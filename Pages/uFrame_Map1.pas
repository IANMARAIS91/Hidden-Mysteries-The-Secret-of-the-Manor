unit uFrame_Map1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  System.Generics.Collections; // moved/added so generics are available in interface

type
  TFrame_Map1 = class(TFrame)
    imgMap: TImage;
    layMapCHI_Monitor1: TRectangle;
    layMapCHI_Monitor2: TRectangle;
    layMapCHI_Monitor3: TRectangle;
    layMapCHI_Laptop4: TRectangle;
    layMapCHI_Laptop2: TRectangle;
    layMapCHI_Laptop3: TRectangle;
    layMapCHI_Laptop1: TRectangle;
    Layout1: TLayout;
    btnCancel: TRectangle;
    lblCancel: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    procedure layMapCHI_Monitor1Click(Sender: TObject);
    procedure layMapCHI_Laptop1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    // Track CHI layout controls so we can pin them to image pixels
    FCHIControls: TList<TControl>;
    FCHIOrigin: TDictionary<TControl, TPointF>; // original image-space coordinates (pixels)
    FImgScale: Single; // last computed image scale
    FImgPos: TPointF;  // last computed top-left of imgMap
    FCHISize: TDictionary<TControl, TPointF>; // original size in image pixel space (width, height)
    FRegisteredImgScale: Single; // the image scale when CHI controls were registered

    procedure UpdateImageCover;
    procedure RegisterCHIControls;
    procedure RepositionCHIControls;
  protected
    procedure Loaded; override;
    procedure Resize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
    // Ensure CHI controls are registered and repositioned/scaled to match the image.
    procedure ScaleCHIWithImage;
  end;

implementation

uses
  System.Math,
  UniPas.Routing; // use routing to show map selection

{$R *.fmx}

constructor TFrame_Map1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCHIControls := TList<TControl>.Create;
  FCHIOrigin := TDictionary<TControl, TPointF>.Create;
  FCHISize := TDictionary<TControl, TPointF>.Create;
  FImgScale := 1.0;
  FImgPos := PointF(0, 0);
  FRegisteredImgScale := 0.0;
end;

destructor TFrame_Map1.Destroy;
begin
  FCHIOrigin.Free;
  FCHISize.Free;
  FCHIControls.Free;
  inherited Destroy;
end;

procedure TFrame_Map1.RegisterCHIControls;
var
  i: Integer;
  C: TComponent;
  L: TControl;
  Orig, SizeOrig: TPointF;
  CtrlAbs, ImgAbs: TPointF;
begin
  if not Assigned(FCHIControls) or not Assigned(FCHIOrigin) or not Assigned(FCHISize) then
    Exit;

  // Avoid re-registering if we've already captured original image-space coordinates
  // If we've already registered for the current image scale, skip. Otherwise re-register
  if (FCHIControls.Count > 0) and (Abs(FRegisteredImgScale - FImgScale) < 1e-6) then
    Exit;

  FCHIControls.Clear;
  FCHIOrigin.Clear;
  FCHISize.Clear;

  // Compute origin positions in image pixel space using the last known image scale/position
  for i := 0 to ComponentCount - 1 do
  begin
    C := Components[i];
    // Accept any visual control (TControl) that matches the naming prefix. Many CHI items are TRectangle.
    if (C is TControl) and (Pos('layMapCHI_', C.Name) = 1) then
    begin
      L := TControl(C);
      FCHIControls.Add(L);

      // Use absolute coordinates so nested parents don't break mapping
      CtrlAbs := L.LocalToAbsolute(PointF(0, 0));
      ImgAbs := imgMap.LocalToAbsolute(PointF(0, 0));

      if FImgScale > 0 then
        Orig := PointF((CtrlAbs.X - ImgAbs.X) / FImgScale, (CtrlAbs.Y - ImgAbs.Y) / FImgScale)
      else
        Orig := PointF(CtrlAbs.X - ImgAbs.X, CtrlAbs.Y - ImgAbs.Y);
      FCHIOrigin.Add(L, Orig);

      // Store original size in image pixel space so controls scale with the image
      if FImgScale > 0 then
        SizeOrig := PointF(L.Width / FImgScale, L.Height / FImgScale)
      else
        SizeOrig := PointF(L.Width, L.Height);
      FCHISize.Add(L, SizeOrig);
    end;
  end;

  // Remember the image scale used so we can avoid unnecessary re-registration
  FRegisteredImgScale := FImgScale;
end;

procedure TFrame_Map1.RepositionCHIControls;
var
  i: Integer;
  L: TControl;
  Orig, SizeOrig: TPointF;
  ImgTopAbs, NewAbs, ParentLocal: TPointF;
begin
  if not Assigned(FCHIControls) or not Assigned(FCHIOrigin) or not Assigned(FCHISize) then
    Exit;

  ImgTopAbs := imgMap.LocalToAbsolute(PointF(0, 0));

  for i := 0 to FCHIControls.Count - 1 do
  begin
    L := FCHIControls.Items[i];
    if Assigned(L) and FCHIOrigin.TryGetValue(L, Orig) then
    begin
      // Compute new absolute position for the control based on image top-left and scaled origin
      NewAbs := PointF(ImgTopAbs.X + Orig.X * FImgScale, ImgTopAbs.Y + Orig.Y * FImgScale);

      // Convert absolute position back into the control parent's local coordinates
      if Assigned(L.Parent) then
      begin
        if L.Parent is TControl then
        begin
          ParentLocal := TControl(L.Parent).AbsoluteToLocal(NewAbs);
          L.Position.Point := ParentLocal; // set position relative to parent
        end
        else
        begin
          // Parent isn't a TControl (rare) - convert relative to this frame instead
          ParentLocal := AbsoluteToLocal(NewAbs);
          L.Position.Point := ParentLocal;
        end;
      end
      else
      begin
        // No parent? set position using frame-local coordinates
        L.Position.X := NewAbs.X - FImgPos.X;
        L.Position.Y := NewAbs.Y - FImgPos.Y;
      end;

      // Apply scaled size so layouts scale with the image
      if FCHISize.TryGetValue(L, SizeOrig) then
      begin
        L.Width := SizeOrig.X * FImgScale;
        L.Height := SizeOrig.Y * FImgScale;
      end;
    end;
  end;
end;

procedure TFrame_Map1.layMapCHI_Laptop1Click(Sender: TObject);
begin
  ShowMessage('You found the laptop!');
end;

procedure TFrame_Map1.btnCancelClick(Sender: TObject);
begin
  TUniPas.RenderPage('MapSelection');
end;

procedure TFrame_Map1.Loaded;
begin
  inherited;
  // Ensure child content does not draw outside the frame
  ClipChildren := True;

  if Assigned(imgMap) then
  begin
    // We'll size/position the image manually to achieve a "cover" effect
    imgMap.Align := TAlignLayout.None;
  end;

  UpdateImageCover;
  // Register CHI controls now that image has been positioned/scaled
  RegisterCHIControls;
end;

procedure TFrame_Map1.layMapCHI_Monitor1Click(Sender: TObject);
begin
  ShowMessage('You found the monitor!');
end;

procedure TFrame_Map1.Resize;
begin
  inherited;
  UpdateImageCover;
  // Ensure CHI controls follow the image when the frame resizes
  ScaleCHIWithImage;
end;

procedure TFrame_Map1.ScaleCHIWithImage;
begin
  // Ensure controls have been registered (capture original image-space positions once)
  if Assigned(FCHIControls) and (FCHIControls.Count = 0) then
    RegisterCHIControls;

  // Reposition/scale CHI-aware controls according to the latest image transform
  RepositionCHIControls;
end;

procedure TFrame_Map1.UpdateImageCover;
var
  pw, ph, iw, ih, scale: Single;
begin
  if not Assigned(imgMap) then
    Exit;

  pw := Width;
  ph := Height;
  if (pw <= 0) or (ph <= 0) then
    Exit;

  if (imgMap.Bitmap <> nil) and (imgMap.Bitmap.Width > 0) and (imgMap.Bitmap.Height > 0) then
  begin
    iw := imgMap.Bitmap.Width;
    ih := imgMap.Bitmap.Height;
  end
  else
  begin
    // Fallback to current size if bitmap not yet available
    iw := Max(1, imgMap.Width);
    ih := Max(1, imgMap.Height);
  end;

  // Scale to cover the entire frame (may crop image on edges, preserves aspect)
  scale := Max(pw / iw, ph / ih);

  imgMap.Align := TAlignLayout.None;
  imgMap.Width := iw * scale;
  imgMap.Height := ih * scale;
  imgMap.Position.X := (pw - imgMap.Width) / 2;
  imgMap.Position.Y := (ph - imgMap.Height) / 2;

  // store last-known image transform so CHI controls can be pinned to image pixels
  FImgScale := scale;
  FImgPos := PointF(imgMap.Position.X, imgMap.Position.Y);

  // Reposition CHI-aware controls to match image pixel coordinates
  RepositionCHIControls;
end;

end.
