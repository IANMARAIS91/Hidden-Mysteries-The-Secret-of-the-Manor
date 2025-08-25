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
    layMapCHI_Monitor1: TLayout;
    layMapCHI_Monitor2: TLayout;
    layMapCHI_Monitor3: TLayout;
    layMapCHI_Laptop4: TLayout;
    layMapCHI_Laptop2: TLayout;
    layMapCHI_Laptop3: TLayout;
    layMapCHI_Laptop1: TLayout;
    Layout1: TLayout;
    btnCancel: TRectangle;
    lblCancel: TLabel;
    Rectangle1: TRectangle;
    procedure layMapCHI_Monitor1Click(Sender: TObject);
    procedure layMapCHI_Laptop1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    // Track CHI layout controls so we can pin them to image pixels
    FCHIControls: TList<TLayout>;
    FCHIOrigin: TDictionary<TLayout, TPointF>; // original image-space coordinates (pixels)
    FImgScale: Single; // last computed image scale
    FImgPos: TPointF;  // last computed top-left of imgMap

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
  end;

implementation

uses
  System.Math,
  UniPas.Routing; // use routing to show map selection

{$R *.fmx}

<<<<<<< HEAD
constructor TFrame_Map1.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCHIControls := TList<TLayout>.Create;
  FCHIOrigin := TDictionary<TLayout, TPointF>.Create;
  FImgScale := 1.0;
  FImgPos := PointF(0, 0);
end;

destructor TFrame_Map1.Destroy;
begin
  FCHIOrigin.Free;
  FCHIControls.Free;
  inherited Destroy;
end;

procedure TFrame_Map1.RegisterCHIControls;
var
  i: Integer;
  C: TComponent;
  L: TLayout;
  Orig: TPointF;
begin
  if not Assigned(FCHIControls) or not Assigned(FCHIOrigin) then
    Exit;

  FCHIControls.Clear;
  FCHIOrigin.Clear;

  // Compute origin positions in image pixel space using the last known image scale/position
  for i := 0 to ComponentCount - 1 do
  begin
    C := Components[i];
    if (C is TLayout) and (Pos('layMapCHI_', C.Name) = 1) then
    begin
      L := TLayout(C);
      FCHIControls.Add(L);
      // Store original image-space pixel coords (relative to imgMap top-left before scaling)
      if FImgScale > 0 then
        Orig := PointF((L.Position.X - FImgPos.X) / FImgScale, (L.Position.Y - FImgPos.Y) / FImgScale)
      else
        Orig := PointF(L.Position.X - FImgPos.X, L.Position.Y - FImgPos.Y);
      FCHIOrigin.Add(L, Orig);
    end;
  end;
end;

procedure TFrame_Map1.RepositionCHIControls;
var
  i: Integer;
  L: TLayout;
  Orig: TPointF;
begin
  if not Assigned(FCHIControls) or not Assigned(FCHIOrigin) then
    Exit;

  for i := 0 to FCHIControls.Count - 1 do
  begin
    L := FCHIControls.Items[i];
    if Assigned(L) and FCHIOrigin.TryGetValue(L, Orig) then
    begin
      L.Position.X := FImgPos.X + Orig.X * FImgScale;
      L.Position.Y := FImgPos.Y + Orig.Y * FImgScale;
    end;
  end;
end;

=======
>>>>>>> 4c19799dd66a2022241fcd68149b3ccffac435d5
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
<<<<<<< HEAD

  // store last-known image transform so CHI controls can be pinned to image pixels
  FImgScale := scale;
  FImgPos := PointF(imgMap.Position.X, imgMap.Position.Y);

  // Reposition CHI-aware controls to match image pixel coordinates
  RepositionCHIControls;
=======
>>>>>>> 4c19799dd66a2022241fcd68149b3ccffac435d5
end;

end.
