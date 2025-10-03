unit uFrame_Map2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.ScrollBox,
  popMap2Complete, FMX.Effects; // add here so TFrame1 can be used in interface

type
  TFrame_Map2 = class(TFrame)
    btnCancel: TRectangle;
    lblCancel: TLabel;
    Rect_Map2: TRectangle;
    Rect_Item_Reference_Box: TRectangle;
    img_Map2: TImage;
    lbl_Title_Counter: TLabel;
    lbl_Counter: TLabel;
    VertScrollBox1: TVertScrollBox;
    GridLayout1: TGridLayout;
    Layout1: TLayout;
    img_Amplectobelua_Symbrachiata: TImage;
    Text_Amplectobelua_Symbrachiata: TText;
    Layout2: TLayout;
    img_Amplectobelua_Stephenensis: TImage;
    Text_Amplectobelua_Stephenensis: TText;
    Layout3: TLayout;
    Layout4: TLayout;
    img_Anomalocaris_Canadensis: TImage;
    img_Anomalocaris_Magnabasis: TImage;
    Text_Anomalocaris_Canadensis: TText;
    Text_Anomalocaris_Magnabasis: TText;
    Layout5: TLayout;
    img_Anomalocaris_Pennsylvanica: TImage;
    Layout6: TLayout;
    img_Anomalocaris_Saron: TImage;
    Layout7: TLayout;
    Layout8: TLayout;
    img_Bathynotus: TImage;
    img_Dorypyge: TImage;
    Layout9: TLayout;
    Layout10: TLayout;
    img_Ellipsocephalus: TImage;
    img_Eoredlichia: TImage;
    Text_Bathynotus: TText;
    Text_Dorypyge: TText;
    Text_Spriggina_Floundersi: TText;
    Text_Anomalocaris_Pennsylvanica: TText;
    Text_Eoredlichia: TText;
    Text_Ellipsocephalus: TText;
    Layout11: TLayout;
    Layout12: TLayout;
    img_Hurdia_Victoria: TImage;
    img_Kerygmachela: TImage;
    Text_Hurdia_Victoria: TText;
    Text_Kerygmachela: TText;
    Layout13: TLayout;
    Layout14: TLayout;
    img_Laggania_Cambria: TImage;
    Text_Laggania_Cambria: TText;
    Text_Megadictyon: TText;
    img_Item_Reference_Box_Background: TImage;
    Layout15: TLayout;
    img_Megadictyon: TImage;
    ScaledLayout1: TScaledLayout;
    Rect_Amplectobelua_Stephenensis_1: TRectangle;
    img_Amplectobelua_Stephenensis_1: TImage;
    Rect_Amplectobelua_Stephenensis_2: TRectangle;
    Rect_Anomalocaris_Saron_1: TRectangle;
    img_Anomalocaris_Saron_1: TImage;
    Layout16: TLayout;
    img_Olenellus: TImage;
    Text_Olenellus: TText;
    Layout17: TLayout;
    img_Opabinia_Regalis: TImage;
    Text_opabinia_Regalis: TText;
    img_Amplectobelua_Stephenensis_2: TImage;
    Rect_Anomalocaris_Saron_2: TRectangle;
    img_Anomalocaris_Saron_2: TImage;
    glow_Anomalocaris_Saron_2: TGlowEffect;
    Rect_Anomalocaris_Saron_3: TRectangle;
    img_Anomalocaris_Saron_3: TImage;
    Rect_Anomalocaris_Saron_4: TRectangle;
    img_Anomalocaris_Saron_4: TImage;
    Rect_Anomalocaris_Canadensis_1: TRectangle;
    img_Anomalocaris_Canadensis_1: TImage;
    Rect_Anomalocaris_Canadensis_2: TRectangle;
    img_Anomalocaris_Canadensis_2: TImage;
    Rect_Anomalocaris_Canadensis_3: TRectangle;
    img_Anomalocaris_Canadensis_3: TImage;
    Rect_Anomalocaris_Magnabasis_1: TRectangle;
    img_Anomalocaris_Magnabasis_1: TImage;
    Rect_Anomalocaris_Magnabasis_2: TRectangle;
    img_Anomalocaris_Magnabasis_2: TImage;
    Rect_Anomalocaris_Magnabasis_3: TRectangle;
    img_Anomalocaris_Magnabasis_3: TImage;
    Rect_Amplectobelua_Symbrachiata_1: TRectangle;
    img_Rect_Amplectobelua_Symbrachiata_1: TImage;
    Rect_Amplectobelua_Symbrachiata_2: TRectangle;
    img_Amplectobelua_Symbrachiata_2: TImage;
    Rect_Amplectobelua_Symbrachiata_3: TRectangle;
    img_Amplectobelua_Symbrachiata_3: TImage;
    Rect_Anomalocaris_Pennsylvanica_1: TRectangle;
    img_Rect_Anomalocaris_Pennsylvanica_1: TImage;
    Rect_Anomalocaris_Pennsylvanica_2: TRectangle;
    img_Anomalocaris_Pennsylvanica_2: TImage;
    Rect_Anomalocaris_Pennsylvanica_3: TRectangle;
    img_Anomalocaris_Pennsylvanica_3: TImage;
    Rect_Bathynotus_1: TRectangle;
    img_Bathynotus_1: TImage;
    Rect_Bathynotus_2: TRectangle;
    img_Bathynotus_2: TImage;
    Rect_Bathynotus_3: TRectangle;
    img_Bathynotus_3: TImage;
    Rect_Bathynotus_4: TRectangle;
    img_Bathynotus_4: TImage;
    Rect_Dorypyge_2: TRectangle;
    Rect_Dorypyge_3: TRectangle;
    img_Dorypyge_3: TImage;
    img_Dorypyge_2: TImage;
    Rect_Dorypyge_1: TRectangle;
    img_Dorypyge_1: TImage;
    Rect_Dorypyge_4: TRectangle;
    img_Dorypyge_4: TImage;
    Rect_Ellipsocephalus_1: TRectangle;
    img_Ellipsocephalus_1: TImage;
    Rect_Ellipsocephalus_2: TRectangle;
    img_Ellipsocephalus_2: TImage;
    Rect_Ellipsocephalus_3: TRectangle;
    img_Ellipsocephalus_3: TImage;
    Rect_Ellipsocephalus_4: TRectangle;
    img_Ellipsocephalus_4: TImage;
    Rect_Eoredlichia_4: TRectangle;
    img_Eoredlichia_4: TImage;
    Rect_Eoredlichia_1: TRectangle;
    img_Eoredlichia_1: TImage;
    Rect_Eoredlichia_2: TRectangle;
    img_Eoredlichia_2: TImage;
    Rect_Eoredlichia_3: TRectangle;
    img_Eoredlichia_3: TImage;
    Rect_Hurdia_Victoria_1: TRectangle;
    img_Hurdia_Victoria_1: TImage;
    Rect_Hurdia_Victoria_2: TRectangle;
    img_Hurdia_Victoria_2: TImage;
    Rect_Hurdia_Victoria_3: TRectangle;
    img_Hurdia_Victoria_3: TImage;
    Rect_Hurdia_Victoria_4: TRectangle;
    img_Hurdia_Victoria_4: TImage;
    Rect_Kerygmachela_3: TRectangle;
    img_Kerygmachela_3: TImage;
    Rect_Kerygmachela_1: TRectangle;
    img_Kerygmachela_1: TImage;
    Rect_Kerygmachela_2: TRectangle;
    img_Kerygmachela_2: TImage;
    Rect_Laggania_Cambria_1: TRectangle;
    img_Laggania_Cambria_1: TImage;
    Rect_Laggania_Cambria_2: TRectangle;
    img_Laggania_Cambria_2: TImage;
    Rect_Laggania_Cambria_3: TRectangle;
    img_Laggania_Cambria_3: TImage;
    Rect_Megadictyon_1: TRectangle;
    img_Megadictyon_1: TImage;
    Rect_Megadictyon_2: TRectangle;
    img_Megadictyon_2: TImage;
    Rect_Megadictyon_4: TRectangle;
    img_Megadictyon_4: TImage;
    Rect_Megadictyon_3: TRectangle;
    img_Megadictyon_3: TImage;
    Rect_Olenellus_1: TRectangle;
    img_Olenellus_1: TImage;
    Rect_Olenellus_2: TRectangle;
    img_Olenellus_2: TImage;
    Rect_Olenellus_3: TRectangle;
    img_Olenellus_3: TImage;
    Rect_Olenellus_4: TRectangle;
    img_Olenellus_4: TImage;
    Rect_Opabinia_Regalis_1: TRectangle;
    img_Opabinia_Regalis_1: TImage;
    Rect_Opabinia_Regalis_2: TRectangle;
    img_Opabinia_Regalis_2: TImage;
    Rect_Opabinia_Regalis_3: TRectangle;
    img_Opabinia_Regalis_3: TImage;
    Rectangle5: TRectangle;
    Image5: TImage;
    Rectangle4: TRectangle;
    Image4: TImage;
    procedure btnCancelClick(Sender: TObject);
    procedure FramePainting(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
    FTotal: Integer;
    FRemaining: Integer;
    FFound: TStringList;
    procedure UpdateCounter;
    procedure AdjustGridItemWidth;
    function TryFoundItem(const AKey: string): Boolean;
  protected
    procedure Loaded; override;
    procedure Resize; override;
  public
    destructor Destroy; override;
  end;

implementation

uses
  Ian.Styling.Buttons,
  UniPas.Routing; // use routing to show map selection

{$R *.fmx}

procedure TFrame_Map2.btnCancelClick(Sender: TObject);
begin
  TUniPas.RenderPage('MapSelection');
end;

procedure TFrame_Map2.Loaded;
begin
  inherited;
  FFound := TStringList.Create;
  FTotal := 41; // total number of logical items
  FRemaining := FTotal;
  // keep the title label fixed to "TOTAL"
  if Assigned(lbl_Title_Counter) then
    lbl_Title_Counter.Text := 'TOTAL';
  UpdateCounter;
  // ensure grid items size appropriately for two columns
  // Defer the actual adjustment to the main queue so the parent/control sizes are finalized
  TThread.Queue(nil,
    procedure
    begin
      AdjustGridItemWidth;
      // force redraw so the GridLayout items take the new widths immediately
      if Assigned(GridLayout1) then
      begin
        GridLayout1.Repaint;
        if Assigned(GridLayout1.Parent) and (GridLayout1.Parent is TControl)
        then
          TControl(GridLayout1.Parent).Repaint;
      end;
      if Assigned(VertScrollBox1) then
        VertScrollBox1.Repaint;
    end);

  // Apply the Ian button styling to the cancel button on this map frame
  if Assigned(btnCancel) and Assigned(lblCancel) then
    ApplyButtonStyle(btnCancel, lblCancel, True);

  // ensure the cancel label shows the X (restore original)
  if Assigned(lblCancel) then
    lblCancel.Text := 'X';
end;

procedure TFrame_Map2.Resize;
begin
  inherited;
  // Recalculate grid item width whenever the frame resizes
  AdjustGridItemWidth;
end;

procedure TFrame_Map2.AdjustGridItemWidth;
var
  availWidth, scrollbarWidth, targetWidth: Single;
begin
  if not Assigned(GridLayout1) then
    Exit;

  // Prefer the parent control width when available (cast to TControl).
  if Assigned(GridLayout1.Parent) and (GridLayout1.Parent is TControl) then
    availWidth := TControl(GridLayout1.Parent).Width
  else
    availWidth := GridLayout1.Width;

  if availWidth <= 0 then
    availWidth := GridLayout1.Width;

  scrollbarWidth := 0;
  // Determine whether a vertical scrollbar is likely present by comparing content
  // height with the viewport height. Some FMX versions do not publish VertScrollBar
  // so avoid referencing it directly.
  if Assigned(VertScrollBox1) then
  begin
    if Assigned(VertScrollBox1.Content) and
      (VertScrollBox1.Content.Height > VertScrollBox1.Height) then
      scrollbarWidth := 16; // approximate scrollbar width; adjust if needed
  end;

  targetWidth := (availWidth - scrollbarWidth) / 2;
  if targetWidth < 1 then
    targetWidth := 1;

  GridLayout1.ItemWidth := targetWidth;
end;

destructor TFrame_Map2.Destroy;
begin
  FFound.Free;
  inherited;
end;

procedure TFrame_Map2.FramePainting(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  AdjustGridItemWidth;
end;

procedure TFrame_Map2.UpdateCounter;
var
  s: string;
  comp: TComponent;
begin
  s := Format('%d/%d', [FRemaining, FTotal]);

  // Always update the visible counter label if present (shows e.g. "40/40", "39/40"...)
  if Assigned(lbl_Counter) then
    lbl_Counter.Text := s;

  if FRemaining = 0 then
  begin
    var Popup := TpopupMap2Complete.Create(nil);
    Popup.ShowOn(TControl(Parent));
  end;
end;

function TFrame_Map2.TryFoundItem(const AKey: string): Boolean;
var
  key: string;
begin
  // normalize key and ignore empty keys
  key := Trim(AKey);
  if key = '' then
  begin
    Result := False;
    Exit;
  end;

  key := LowerCase(key);

  // if already found, return false and do nothing
  if FFound.IndexOf(key) >= 0 then
  begin
    Result := False;
    Exit;
  end;

  // mark found and decrement
  FFound.Add(key);

  if FRemaining > 0 then
    Dec(FRemaining);

  UpdateCounter;
  Result := True;
end;

end.
