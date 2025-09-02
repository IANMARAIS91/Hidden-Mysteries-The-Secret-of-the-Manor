unit uFrame_Map1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.ScrollBox;

type
  TFrame_Map1 = class(TFrame)
    Lay_Map1: TLayout;
    btnCancel: TRectangle;
    lblCancel: TLabel;
    Rect_Map1: TRectangle;
    Rect_buttons_Section: TRectangle;
    img_Map1: TImage;
    ScaledLayout1: TScaledLayout;
    LayMapCHI_Auroralumina_Attenboroughii_1_1: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_1_2: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_1_3: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_1_4: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_1_5: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_1_6: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_1_7: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_1_8: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_1_9: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_2_1: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_2_2: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_2_3: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_2_4: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_2_5: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_2_6: TEllipse;
    LayMapCHI_Auroralumina_Attenboroughii_2_7: TEllipse;
    LayMapCHI_Beothukis_Mistakensis_1: TEllipse;
    LayMapCHI_Beothukis_Mistakensis_2: TEllipse;
    LayMapCHI_Beothukis_Mistakensis_3: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_1_1: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_1_2: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_1_3: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_2_1: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_2_2: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_2_3: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_2_4: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_2_5: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_2_6: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_2_7: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_3_1: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_3_2: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_3_3: TEllipse;
    LayMapCHI_Charnia_Masoni_1_1: TEllipse;
    LayMapCHI_Charnia_Masoni_1_8: TEllipse;
    LayMapCHI_Charnia_Masoni_1_9: TEllipse;
    LayMapCHI_Charnia_Masoni_1_10: TEllipse;
    LayMapCHI_Charnia_Masoni_1_11: TEllipse;
    LayMapCHI_Charnia_Masoni_1_3: TEllipse;
    LayMapCHI_Charnia_Masoni_1_4: TEllipse;
    LayMapCHI_Charnia_Masoni_1_5: TEllipse;
    LayMapCHI_Charnia_Masoni_1_6: TEllipse;
    LayMapCHI_Charnia_Masoni_1_7: TEllipse;
    LayMapCHI_Spriggina_Floundersi_3_1: TEllipse;
    LayMapCHI_Spriggina_Floundersi_3_2: TEllipse;
    LayMapCHI_Spriggina_Floundersi_3_4: TEllipse;
    LayMapCHI_Spriggina_Floundersi_3_3: TEllipse;
    LayMapCHI_Dickinsonia_Costata_1_1: TEllipse;
    LayMapCHI_Dickinsonia_Costata_1_2: TEllipse;
    LayMapCHI_Dickinsonia_Costata_2: TEllipse;
    LayMapCHI_Fractofusus_Misrai_1: TEllipse;
    LayMapCHI_Fractofusus_Misrai_2: TEllipse;
    LayMapCHI_Fractofusus_Misrai_3: TEllipse;
    LayMapCHI_Fractofusus_Misrai_4: TEllipse;
    LayMapCHI_Kimberella_Quadrata_1_1: TEllipse;
    LayMapCHI_Kimberella_Quadrata_1_2: TEllipse;
    LayMapCHI_Kimberella_Quadrata_1_3: TEllipse;
    LayMapCHI_Kimberella_Quadrata_1_4: TEllipse;
    LayMapCHI_Kimberella_Quadrata_2_1: TEllipse;
    LayMapCHI_Kimberella_Quadrata_2_2: TEllipse;
    LayMapCHI_Kimberella_Quadrata_2_3: TEllipse;
    LayMapCHI_Kimberella_Quadrata_2_4: TEllipse;
    LayMapCHI_Kimberella_Quadrata_3_1: TEllipse;
    LayMapCHI_Kimberella_Quadrata_3_2: TEllipse;
    LayMapCHI_Kimberella_Quadrata_3_3: TEllipse;
    LayMapCHI_Kimberella_Quadrata_3_4: TEllipse;
    LayMapCHI_Metaspriggina_1_1: TEllipse;
    LayMapCHI_Metaspriggina_1_2: TEllipse;
    LayMapCHI_Metaspriggina_1_3: TEllipse;
    LayMapCHI_Metaspriggina_2_1: TEllipse;
    LayMapCHI_Metaspriggina_2_2: TEllipse;
    LayMapCHI_Metaspriggina_2_3: TEllipse;
    LayMapCHI_Metaspriggina_2_4: TEllipse;
    LayMapCHI_Metaspriggina_2_5: TEllipse;
    LayMapCHI_Metaspriggina_2_6: TEllipse;
    LayMapCHI_Metaspriggina_2_7: TEllipse;
    LayMapCHI_Metaspriggina_2_8: TEllipse;
    LayMapCHI_Metaspriggina_2_9: TEllipse;
    LayMapCHI_Metaspriggina_3_1: TEllipse;
    LayMapCHI_Metaspriggina_3_2: TEllipse;
    LayMapCHI_Pteridinium_1: TEllipse;
    LayMapCHI_Pteridinium_2_1: TEllipse;
    LayMapCHI_Pteridinium_2_2: TEllipse;
    LayMapCHI_Pteridinium_3: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_1_1: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_1_2: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_1_3: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_1_4: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_1_5: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_1_6: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_1_7: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_1_8: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_1_9: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_2_1: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_2_10: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_2_2: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_2_3: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_2_4: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_2_5: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_2_6: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_2_7: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_2_8: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_2_9: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_3_1: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_3_10: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_3_2: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_3_3: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_3_4: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_3_5: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_3_6: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_3_7: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_3_8: TEllipse;
    LayMapCHI_Rangea_Schneiderhoehni_3_9: TEllipse;
    LayMapCHI_Spriggina_Floundersi_1_1: TEllipse;
    LayMapCHI_Spriggina_Floundersi_1_2: TEllipse;
    LayMapCHI_Spriggina_Floundersi_1_3: TEllipse;
    LayMapCHI_Spriggina_Floundersi_2_1: TEllipse;
    LayMapCHI_Spriggina_Floundersi_2_2: TEllipse;
    LayMapCHI_Spriggina_Floundersi_2_3: TEllipse;
    LayMapCHI_Spriggina_Floundersi_2_4: TEllipse;
    LayMapCHI_Thectadris_Avalonensis_2_1: TEllipse;
    LayMapCHI_Thectadris_Avalonensis_2_2: TEllipse;
    LayMapCHI_Thectadris_Avalonensis_2_3: TEllipse;
    LayMapCHI_Thectadris_Avalonensis_2_4: TEllipse;
    LayMapCHI_Thectadris_Avalonensis_2_5: TEllipse;
    LayMapCHI_Thectadris_Avalonensis_2_6: TEllipse;
    LayMapCHI_Thectadris_Avalonensis_2_7: TEllipse;
    LayMapCHI_Thectadris_Avalonensis_3_1: TEllipse;
    LayMapCHI_Thectadris_Avalonensis_3_2: TEllipse;
    LayMapCHI_Thectadris_Avalonensis_3_3: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_1_1: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_1_2: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_1_3: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_1_4: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_4_1: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_4_2: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_4_3: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_4_4: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_4_5: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_4_6: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_4_7: TEllipse;
    LayMapCHI_Thectardis_Avalonensis_4_8: TEllipse;
    LayMapCHI_Tribrachidium_Heraldicum_1: TEllipse;
    LayMapCHI_Tribrachidium_Heraldicum_2: TEllipse;
    LayMapCHI_Tribrachidium_Heraldicum_3: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_1_1: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_1_2: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_1_3: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_1_4: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_1_5: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_1_6: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_2_1: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_2_2: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_2_3: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_2_4: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_2_5: TEllipse;
    LayMapCHI_Yorgia_Waggoneri_2_6: TEllipse;
    LayMapCHI_Metaspriggina_3_3: TEllipse;
    LayMapCHI_Metaspriggina_3_4: TEllipse;
    LayMapCHI_Bradgatia_Linfordensis_3_4: TEllipse;
    LayMapCHI_Charnia_Masoni_1_2: TEllipse;
    lbl_Title_Counter: TLabel;
    lbl_Counter: TLabel;
    VertScrollBox1: TVertScrollBox;
    GridLayout1: TGridLayout;
    Layout1: TLayout;
    img_Beothukis_Mistakensis: TImage;
    Text_Beothukis_Mistakensis: TText;
    Layout2: TLayout;
    img_Bradgatia_Linfordensis: TImage;
    Text_Bradgatia_Linfordensis: TText;
    Layout3: TLayout;
    Layout4: TLayout;
    img_Pteridinium: TImage;
    img_Thectardis_avalonensis: TImage;
    Text_Pteridinium: TText;
    Text_Thectardis_Avalonensis: TText;
    Layout5: TLayout;
    img_Yorgia_Waggoneri: TImage;
    Layout6: TLayout;
    img_Spriggina_floundersi: TImage;
    Layout7: TLayout;
    Layout8: TLayout;
    img_Kimberella_Quadrata: TImage;
    img_Tribrachidium_heraldicum: TImage;
    Layout9: TLayout;
    Layout10: TLayout;
    img_Auroralumina_Attenboroughii: TImage;
    img_Rangea_Schneiderhoehni: TImage;
    Text_Kimberella_Quadrata: TText;
    Text_Tribrachidiu_Heraldicum: TText;
    Text_Spriggina_Floundersi: TText;
    Text_Yorgia_Waggoneri: TText;
    Text_Rangea_Schneiderhoehni: TText;
    Text_Auroralumina_Attenboroughii: TText;
    Layout11: TLayout;
    Layout12: TLayout;
    img_Fractofusus_Misrai: TImage;
    img_Dickinsonia_Costata: TImage;
    Text_Fractofusus_Misrai: TText;
    Text_Dickinsonia_Costata: TText;
    Layout13: TLayout;
    Layout14: TLayout;
    img_Metaspriggina: TImage;
    img_Charnia_Masoni: TImage;
    Text_Metaspriggina: TText;
    Text_Charnia_Masoni: TText;
    procedure btnCancelClick(Sender: TObject); procedure Found_Auroralumina_attenboroughii_1(Sender: TObject);
    procedure Found_Auroralumina_Attenboroughii_2(Sender: TObject); procedure Found_Beothukis_Mistakensis_1(Sender: TObject);
    procedure Found_Beothukis_Mistakensis_2(Sender: TObject); procedure Found_Beothukis_Mistakensis_3(Sender: TObject);
    procedure Found_Bradgatia_Lindfordensis_1(Sender: TObject); procedure Found_Bradgatia_Lindfordensis_2(Sender: TObject);
    procedure Found_Bradgatia_Lindfordensis_3(Sender: TObject); procedure Found_Spriggina_Floundersi_1(Sender: TObject);
    procedure Found_Spriggina_Floundersi_2(Sender: TObject); procedure Found_Spriggina_Floundersi_3(Sender: TObject);
    procedure Found_Charnia_Masoni_1(Sender: TObject); procedure Found_Dickinsonia_Costata_1(Sender: TObject);
    procedure Found_Dickinsonia_Costata_2(Sender: TObject); procedure Found_Fractofusus_Misrai_1(Sender: TObject);
    procedure Found_Fractofusus_Misrai_2(Sender: TObject); procedure Found_Fractofusus_Misrai_3(Sender: TObject);
    procedure Found_Fractofusus_Misrai_4(Sender: TObject); procedure Found_Kimberella_Quadrata_1(Sender: TObject);
    procedure Found_Kimberella_Quadrata_2(Sender: TObject); procedure Found_Kimberella_Quadrata_3(Sender: TObject);
    procedure Found_Metaspringa(Sender: TObject); procedure Found_Metaspringa_1(Sender: TObject);
    procedure Found_Metaspriggina_1(Sender: TObject); procedure Found_Metaspriggina_2(Sender: TObject);
    procedure Found_Metaspriggina_3(Sender: TObject); procedure Found_Pteridinium_1(Sender: TObject);
    procedure Found_Pteridinium_2(Sender: TObject); procedure Found_Pteridinium_3(Sender: TObject);
    procedure Found_Rangea_Schneiderhoeni_1(Sender: TObject); procedure Found_Rangea_Schneiderhoeni_2(Sender: TObject);
    procedure Found_Rangea_Schneiderhoeni_3(Sender: TObject); procedure Found_Thectadris_Avalonensis_2(Sender: TObject);
    procedure Found_Thectadris_Avalonensis_3(Sender: TObject); procedure Found_Thectadris_Avalonensis_1(Sender: TObject);
    procedure Found_Thectadris_Avalonensis_4(Sender: TObject); procedure Found_Yoriga_Waggoneri_2(Sender: TObject);
    procedure Found_Yoriga_Waggoneri_1(Sender: TObject); procedure Found_Tribrachidiun_Heraldicum_3(Sender: TObject);
    procedure Found_Tribrachidiun_Heraldicum_2(Sender: TObject); procedure Found_Tribrachidium_Heraldicum_1(Sender: TObject);
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
  UniPas.Routing; // use routing to show map selection

{$R *.fmx}

procedure TFrame_Map1.btnCancelClick(Sender: TObject);
begin
  TUniPas.RenderPage('MapSelection');
end;

procedure TFrame_Map1.Loaded;
begin
  inherited;
  FFound := TStringList.Create;
  FTotal := 40; // total number of logical items
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
        if Assigned(GridLayout1.Parent) and (GridLayout1.Parent is TControl) then
          TControl(GridLayout1.Parent).Repaint;
      end;
      if Assigned(VertScrollBox1) then
        VertScrollBox1.Repaint;
    end);
  // ensure the cancel label shows the X (restore original)
  if Assigned(lblCancel) then
    lblCancel.Text := 'X';
end;

procedure TFrame_Map1.Resize;
begin
  inherited;
  // Recalculate grid item width whenever the frame resizes
  AdjustGridItemWidth;
end;

procedure TFrame_Map1.AdjustGridItemWidth;
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
    if Assigned(VertScrollBox1.Content) and (VertScrollBox1.Content.Height > VertScrollBox1.Height) then
      scrollbarWidth := 16; // approximate scrollbar width; adjust if needed
  end;

  targetWidth := (availWidth - scrollbarWidth) / 2;
  if targetWidth < 1 then
    targetWidth := 1;

  GridLayout1.ItemWidth := targetWidth;
end;

destructor TFrame_Map1.Destroy;
begin
  FFound.Free;
  inherited;
end;

procedure TFrame_Map1.UpdateCounter;
var
  s: string;
  comp: TComponent;
begin
  s := Format('%d/%d', [FRemaining, FTotal]);

  // Always update the visible counter label if present (shows e.g. "40/40", "39/40"...)
  if Assigned(lbl_Counter) then
    lbl_Counter.Text := s;

  // Leave lbl_Title_Counter showing the static title. The live counter is placed
  // into Components[196] (if present) as requested. Support both TLabel and TText.
  // Do not overwrite lblCancel; if Components[196] references lblCancel, skip it.
  if Self.ComponentCount > 196 then
  begin
    comp := Self.Components[196];
    if comp = lblCancel then
      Exit; // avoid removing the 'X' on the cancel label

    if comp is TLabel then
      TLabel(comp).Text := s
    else if comp is TText then
      TText(comp).Text := s;
  end;
end;

function TFrame_Map1.TryFoundItem(const AKey: string): Boolean;
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

procedure TFrame_Map1.Found_Auroralumina_attenboroughii_1(Sender: TObject);
begin
  if TryFoundItem('Auroralumina_Attenboroughii_1') then
    ShowMessage('Found Found Auroralumina attenboroughii 1!');
end;

procedure TFrame_Map1.Found_Auroralumina_Attenboroughii_2(
  Sender: TObject);
begin
  if TryFoundItem('Auroralumina_Attenboroughii_2') then
    ShowMessage('Found Found Auroralumina attenboroughii 2!');
end;

procedure TFrame_Map1.Found_Beothukis_Mistakensis_1(Sender: TObject);
begin
  if TryFoundItem('Beothukis_Mistakensis_1') then
    ShowMessage('Found Beothukis Mistakensis 1!');
end;

procedure TFrame_Map1.Found_Beothukis_Mistakensis_2(Sender: TObject);
begin
  if TryFoundItem('Beothukis_Mistakensis_2') then
    ShowMessage('Found Beothukis Mistakensis 2!');
end;

procedure TFrame_Map1.Found_Beothukis_Mistakensis_3(Sender: TObject);
begin
  if TryFoundItem('Beothukis_Mistakensis_3') then
    ShowMessage('Found Beothukis Mistakensis 3!');
end;

procedure TFrame_Map1.Found_Bradgatia_Lindfordensis_1(Sender: TObject);
begin
  if TryFoundItem('Bradgatia_Lindfordensis_1') then
    ShowMessage('Found Bradgatia Linfordensis 1!');
end;

procedure TFrame_Map1.Found_Bradgatia_Lindfordensis_2(Sender: TObject);
begin
  if TryFoundItem('Bradgatia_Lindfordensis_2') then
    ShowMessage('Found Bradgatia Linfordensis 2!');
end;

procedure TFrame_Map1.Found_Bradgatia_Lindfordensis_3(Sender: TObject);
begin
  if TryFoundItem('Bradgatia_Lindfordensis_3') then
    ShowMessage('Found Bradgatia Linfordensis 3!');
end;

procedure TFrame_Map1.Found_Spriggina_Floundersi_1(Sender: TObject);
begin
  if TryFoundItem('Spriggina_Floundersi_1') then
    ShowMessage('Found Found Spriggina Floundersi 1!');
end;

procedure TFrame_Map1.Found_Spriggina_Floundersi_2(Sender: TObject);
begin
  if TryFoundItem('Spriggina_Floundersi_2') then
    ShowMessage('Found Found Spriggina Floundersi 2!');
end;

procedure TFrame_Map1.Found_Spriggina_Floundersi_3(Sender: TObject);
begin
  if TryFoundItem('Spriggina_Floundersi_3') then
    ShowMessage('Found Found Spriggina Floundersi 3!');
end;

procedure TFrame_Map1.Found_Charnia_Masoni_1(Sender: TObject);
begin
  if TryFoundItem('Charnia_Masoni_1') then
    ShowMessage('Found Found Found Charnia Masoni 1!');
end;

procedure TFrame_Map1.Found_Dickinsonia_Costata_1(Sender: TObject);
begin
  if TryFoundItem('Dickinsonia_Costata_1') then
    ShowMessage('Found Dickinsonia Costata 1!');
end;

procedure TFrame_Map1.Found_Dickinsonia_Costata_2(Sender: TObject);
begin
  if TryFoundItem('Dickinsonia_Costata_2') then
    ShowMessage('Found Dickinsonia Costata 2!');
end;

procedure TFrame_Map1.Found_Fractofusus_Misrai_1(Sender: TObject);
begin
  if TryFoundItem('Fractofusus_Misrai_1') then
    ShowMessage('Found Fractofusus Misrai 1!');
end;

procedure TFrame_Map1.Found_Fractofusus_Misrai_2(Sender: TObject);
begin
  if TryFoundItem('Fractofusus_Misrai_2') then
    ShowMessage('Found Fractofusus Misrai 2!');
end;

procedure TFrame_Map1.Found_Fractofusus_Misrai_3(Sender: TObject);
begin
  if TryFoundItem('Fractofusus_Misrai_3') then
    ShowMessage('Found Fractofusus Misrai 3!');
end;

procedure TFrame_Map1.Found_Fractofusus_Misrai_4(Sender: TObject);
begin
  if TryFoundItem('Fractofusus_Misrai_4') then
    ShowMessage('Found Fractofusus Misrai 4!');
end;

procedure TFrame_Map1.Found_Kimberella_Quadrata_1(Sender: TObject);
begin
  if TryFoundItem('Kimberella_Quadrata_1') then
    ShowMessage('Found Kimberella Quadrata 1!');
end;

procedure TFrame_Map1.Found_Kimberella_Quadrata_2(Sender: TObject);
begin
  if TryFoundItem('Kimberella_Quadrata_2') then
    ShowMessage('Found Kimberella Quadrata 2!');
end;

procedure TFrame_Map1.Found_Kimberella_Quadrata_3(Sender: TObject);
begin
  if TryFoundItem('Kimberella_Quadrata_3') then
    ShowMessage('Found Kimberella Quadrata 3!');
end;

procedure TFrame_Map1.Found_Metaspriggina_1(Sender: TObject);
begin
  if TryFoundItem('Metaspriggina_1') then
    ShowMessage('Found Metaspriggina 1!');
end;

procedure TFrame_Map1.Found_Metaspriggina_2(Sender: TObject);
begin
  if TryFoundItem('Metaspriggina_2') then
    ShowMessage('Found Metaspriggina 2!');
end;

procedure TFrame_Map1.Found_Metaspriggina_3(Sender: TObject);
begin
  if TryFoundItem('Metaspriggina_3') then
    ShowMessage('Found Metaspriggina 3!');
end;

procedure TFrame_Map1.Found_Metaspringa(Sender: TObject);
begin
  if TryFoundItem('Metaspriggina_a') then
    ShowMessage('Found Metaspringa 1!');
end;

procedure TFrame_Map1.Found_Metaspringa_1(Sender: TObject);
begin
  if TryFoundItem('Metaspriggina_b') then
    ShowMessage('Found Metaspring 1!');
end;

procedure TFrame_Map1.Found_Pteridinium_1(Sender: TObject);
begin
  if TryFoundItem('Pteridinium_1') then
    ShowMessage('Found Pteridinium 1!');
end;

procedure TFrame_Map1.Found_Pteridinium_2(Sender: TObject);
begin
  if TryFoundItem('Pteridinium_2') then
    ShowMessage('Found Pteridinium 2!');
end;

procedure TFrame_Map1.Found_Pteridinium_3(Sender: TObject);
begin
  if TryFoundItem('Pteridinium_3') then
    ShowMessage('Found Pteridinium 3!');
end;

procedure TFrame_Map1.Found_Rangea_Schneiderhoeni_1(Sender: TObject);
begin
  if TryFoundItem('Rangea_Schneiderhoehni_1') then
    ShowMessage('Found Rangea Schneiderhoeni 1!');
end;

procedure TFrame_Map1.Found_Rangea_Schneiderhoeni_2(Sender: TObject);
begin
 if TryFoundItem('Rangea_Schneiderhoehni_2') then
  ShowMessage('Found Rangea Schneiderhoeni 2!');
end;

procedure TFrame_Map1.Found_Rangea_Schneiderhoeni_3(Sender: TObject);
begin
 if TryFoundItem('Rangea_Schneiderhoehni_3') then
  ShowMessage('Found Rangea Schneiderhoeni 3!');
end;

procedure TFrame_Map1.Found_Thectadris_Avalonensis_1(Sender: TObject);
begin
  if TryFoundItem('Thectadris_Avalonensis_1') then
    ShowMessage('Found Thectadris Avalonensis 1!');
end;

procedure TFrame_Map1.Found_Thectadris_Avalonensis_2(Sender: TObject);
begin
  if TryFoundItem('Thectadris_Avalonensis_2') then
    ShowMessage('Found Thectadris Avalonensis 2!');
end;

procedure TFrame_Map1.Found_Thectadris_Avalonensis_3(Sender: TObject);
begin
  if TryFoundItem('Thectadris_Avalonensis_3') then
    ShowMessage('Found Thectadris Avalonensis 3!');
end;

procedure TFrame_Map1.Found_Thectadris_Avalonensis_4(Sender: TObject);
begin
  if TryFoundItem('Thectadris_Avalonensis_4') then
    ShowMessage('Found Thectadris Avalonensis 4!');
end;

procedure TFrame_Map1.Found_Tribrachidiun_Heraldicum_2(Sender: TObject);
begin
  if TryFoundItem('Tribrachidium_Heraldicum_2') then
    ShowMessage('Found Tribrachidiun Heraldicum 2!');
end;

procedure TFrame_Map1.Found_Tribrachidiun_Heraldicum_3(Sender: TObject);
begin
  if TryFoundItem('Tribrachidium_Heraldicum_3') then
    ShowMessage('Found Tribrachidiun Heraldicum 3!');
end;

procedure TFrame_Map1.Found_Yoriga_Waggoneri_1(Sender: TObject);
begin
  if TryFoundItem('Yoriga_Waggoneri_1') then
    ShowMessage('Found Yoriga Waggoneri 1!');
end;

procedure TFrame_Map1.Found_Yoriga_Waggoneri_2(Sender: TObject);
begin
  if TryFoundItem('Yoriga_Waggoneri_2') then
    ShowMessage('Found Yoriga Waggoneri 2!');
end;

procedure TFrame_Map1.FramePainting(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  AdjustGridItemWidth;
end;

procedure TFrame_Map1.Found_Tribrachidium_Heraldicum_1(
  Sender: TObject);
begin
  if TryFoundItem('Tribrachidium_Heraldicum_1') then
    ShowMessage('Found Tribrachidiun Heraldicum 1!');
end;

end.
