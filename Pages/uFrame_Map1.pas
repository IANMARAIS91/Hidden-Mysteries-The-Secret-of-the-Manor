unit uFrame_Map1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation;

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
    img_Auroralumina_Attenboroughii: TImage;
    img_Bradgatia_Linfordensis: TImage;
    img_Charnia_Masoni: TImage;
    img_Dickinsonia_Costata: TImage;
    img_Fractofusus_Misrai: TImage;
    img_Kimberella_Quadrata: TImage;
    img_Metaspriggina: TImage;
    img_Pteridinium: TImage;
    img_Rangea_Schneiderhoehni: TImage;
    img_Spriggina_floundersi: TImage;
    img_Thectardis_avalonensis: TImage;
    img_Tribrachidium_heraldicum: TImage;
    img_Yorgia_Waggoneri: TImage;
    LayMapCHI_Bradgatia_Linfordensis_3_4: TEllipse;
    img_Beothukis_Mistakensis: TImage;
    Text_Beothukis_Mistakensis: TText;
    Text_Bradgatia_Linfordensis: TText;
    Text_Pteridinium: TText;
    Text_Thectardis_Avalonensis: TText;
    Text_Spriggina_Floundersi: TText;
    Text_Yorgia_Waggoneri: TText;
    Text_Auroralumina_Attenboroughii: TText;
    Text_Tribrachidiu_Heraldicum: TText;
    Text_Kimberella_Quadrata: TText;
    Text_Rangea_Schneiderhoehni: TText;
    Text_Fractofusus_Misrai: TText;
    Text_Dickinsonia_Costata: TText;
    Text_Metaspriggina: TText;
    Text_Charnia_Masoni: TText;
    LayMapCHI_Charnia_Masoni_1_2: TEllipse;
    lbl_Title_Counter: TLabel;
    lbl_Counter: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure Found_Auroralumina_attenboroughii_1(Sender: TObject);
    procedure Found_Auroralumina_Attenboroughii_2(Sender: TObject);
    procedure Found_Beothukis_Mistakensis_1(Sender: TObject);
    procedure Found_Beothukis_Mistakensis_2(Sender: TObject);
    procedure Found_Beothukis_Mistakensis_3(Sender: TObject);
    procedure Found_Bradgatia_Lindfordensis_1(Sender: TObject);
    procedure Found_Bradgatia_Lindfordensis_2(Sender: TObject);
    procedure Found_Bradgatia_Lindfordensis_3(Sender: TObject);
    procedure Found_Spriggina_Floundersi_1(Sender: TObject);
    procedure Found_Spriggina_Floundersi_2(Sender: TObject);
    procedure Found_Spriggina_Floundersi_3(Sender: TObject);
    procedure Found_Charnia_Masoni_1(Sender: TObject);
    procedure Found_Dickinsonia_Costata_1(Sender: TObject);
    procedure Found_Dickinsonia_Costata_2(Sender: TObject);
    procedure Found_Fractofusus_Misrai_1(Sender: TObject);
    procedure Found_Fractofusus_Misrai_2(Sender: TObject);
    procedure Found_Fractofusus_Misrai_3(Sender: TObject);
    procedure Found_Fractofusus_Misrai_4(Sender: TObject);
    procedure Found_Kimberella_Quadrata_1(Sender: TObject);
    procedure Found_Kimberella_Quadrata_2(Sender: TObject);
    procedure Found_Kimberella_Quadrata_3(Sender: TObject);
    procedure Found_Metaspringa(Sender: TObject);
    procedure Found_Metaspringa_1(Sender: TObject);
    procedure Found_Metaspriggina_1(Sender: TObject);
    procedure Found_Metaspriggina_2(Sender: TObject);
    procedure Found_Metaspriggina_3(Sender: TObject);
    procedure Found_Pteridinium_1(Sender: TObject);
    procedure Found_Pteridinium_2(Sender: TObject);
    procedure Found_Pteridinium_3(Sender: TObject);
    procedure Found_Rangea_Schneiderhoeni_1(Sender: TObject);
    procedure Found_Rangea_Schneiderhoeni_2(Sender: TObject);
    procedure Found_Rangea_Schneiderhoeni_3(Sender: TObject);
    procedure Found_Thectadris_Avalonensis_2(Sender: TObject);
    procedure Found_Thectadris_Avalonensis_3(Sender: TObject);
    procedure Found_Thectadris_Avalonensis_1(Sender: TObject);
    procedure Found_Thectadris_Avalonensis_4(Sender: TObject);
    procedure Found_Yoriga_Waggoneri_2(Sender: TObject);
    procedure Found_Yoriga_Waggoneri_1(Sender: TObject);
    procedure Found_Tribrachidiun_Heraldicum_3(Sender: TObject);
    procedure Found_Tribrachidiun_Heraldicum_2(Sender: TObject);
    procedure Found_Tribrachidium_Heraldicum_1(Sender: TObject);
  private
  protected
  public
  end;

implementation

uses
  UniPas.Routing; // use routing to show map selection

{$R *.fmx}

procedure TFrame_Map1.btnCancelClick(Sender: TObject);
begin
  TUniPas.RenderPage('MapSelection');
end;

procedure TFrame_Map1.Found_Auroralumina_attenboroughii_1(Sender: TObject);
begin
  ShowMessage('Found Found Auroralumina attenboroughii 1!');
end;

procedure TFrame_Map1.Found_Auroralumina_Attenboroughii_2(
  Sender: TObject);
begin
  ShowMessage('Found Found Auroralumina attenboroughii 2!');
end;

procedure TFrame_Map1.Found_Beothukis_Mistakensis_1(Sender: TObject);
begin
  ShowMessage('Found Beothukis Mistakensis 1!');
end;

procedure TFrame_Map1.Found_Beothukis_Mistakensis_2(Sender: TObject);
begin
  ShowMessage('Found Beothukis Mistakensis 2!');
end;

procedure TFrame_Map1.Found_Beothukis_Mistakensis_3(Sender: TObject);
begin
  ShowMessage('Found Beothukis Mistakensis 3!');
end;

procedure TFrame_Map1.Found_Bradgatia_Lindfordensis_1(Sender: TObject);
begin
  ShowMessage('Found Bradgatia Linfordensis 1!');
end;

procedure TFrame_Map1.Found_Bradgatia_Lindfordensis_2(Sender: TObject);
begin
  ShowMessage('Found Bradgatia Linfordensis 2!');
end;

procedure TFrame_Map1.Found_Bradgatia_Lindfordensis_3(Sender: TObject);
begin
  ShowMessage('Found Bradgatia Linfordensis 3!');
end;

procedure TFrame_Map1.Found_Charnia_Masoni_1(Sender: TObject);
begin
  ShowMessage('Found Found Found Charnia Masoni 1!');
end;

procedure TFrame_Map1.Found_Dickinsonia_Costata_1(Sender: TObject);
begin
  ShowMessage('Found Dickinsonia Costata 1!');
end;

procedure TFrame_Map1.Found_Dickinsonia_Costata_2(Sender: TObject);
begin
  ShowMessage('Found Dickinsonia Costata 2!');
end;

procedure TFrame_Map1.Found_Fractofusus_Misrai_1(Sender: TObject);
begin
  ShowMessage('Found Fractofusus Misrai 1!');
end;

procedure TFrame_Map1.Found_Fractofusus_Misrai_2(Sender: TObject);
begin
  ShowMessage('Found Fractofusus Misrai 2!');
end;

procedure TFrame_Map1.Found_Fractofusus_Misrai_3(Sender: TObject);
begin
  ShowMessage('Found Fractofusus Misrai 3!');
end;

procedure TFrame_Map1.Found_Fractofusus_Misrai_4(Sender: TObject);
begin
  ShowMessage('Found Fractofusus Misrai 4!');
end;

procedure TFrame_Map1.Found_Kimberella_Quadrata_1(Sender: TObject);
begin
  ShowMessage('Found Kimberella Quadrata 1!');
end;

procedure TFrame_Map1.Found_Kimberella_Quadrata_2(Sender: TObject);
begin
  ShowMessage('Found Kimberella Quadrata 2!');
end;

procedure TFrame_Map1.Found_Kimberella_Quadrata_3(Sender: TObject);
begin
  ShowMessage('Found Kimberella Quadrata 3!');
end;

procedure TFrame_Map1.Found_Metaspriggina_1(Sender: TObject);
begin
  ShowMessage('Found Metaspriggina 1!');
end;

procedure TFrame_Map1.Found_Metaspriggina_2(Sender: TObject);
begin
  ShowMessage('Found Metaspriggina 2!');
end;

procedure TFrame_Map1.Found_Metaspriggina_3(Sender: TObject);
begin
  ShowMessage('Found Metaspriggina 3!');
end;

procedure TFrame_Map1.Found_Metaspringa(Sender: TObject);
begin
  ShowMessage('Found Metaspringa 1!');
end;

procedure TFrame_Map1.Found_Metaspringa_1(Sender: TObject);
begin
  ShowMessage('Found Metaspring 1!');
end;

procedure TFrame_Map1.Found_Pteridinium_1(Sender: TObject);
begin
  ShowMessage('Found Pteridinium 1!');
end;

procedure TFrame_Map1.Found_Pteridinium_2(Sender: TObject);
begin
  ShowMessage('Found Pteridinium 2!');
end;

procedure TFrame_Map1.Found_Pteridinium_3(Sender: TObject);
begin
  ShowMessage('Found Pteridinium 3!');
end;

procedure TFrame_Map1.Found_Rangea_Schneiderhoeni_1(Sender: TObject);
begin
  ShowMessage('Found Rangea Schneiderhoeni 1!');
end;

procedure TFrame_Map1.Found_Rangea_Schneiderhoeni_2(Sender: TObject);
begin
 ShowMessage('Found Rangea Schneiderhoeni 2!');
end;

procedure TFrame_Map1.Found_Rangea_Schneiderhoeni_3(Sender: TObject);
begin
 ShowMessage('Found Rangea Schneiderhoeni 3!');
end;

procedure TFrame_Map1.Found_Spriggina_Floundersi_1(Sender: TObject);
begin
  ShowMessage('Found Found Spriggina Floundersi 1!');
end;

procedure TFrame_Map1.Found_Spriggina_Floundersi_2(Sender: TObject);
begin
  ShowMessage('Found Found Spriggina Floundersi 2!');
end;

procedure TFrame_Map1.Found_Spriggina_Floundersi_3(Sender: TObject);
begin
  ShowMessage('Found Found Spriggina Floundersi 3!');
end;

procedure TFrame_Map1.Found_Thectadris_Avalonensis_1(Sender: TObject);
begin
  ShowMessage('Found Thectadris Avalonensis 1!');
end;

procedure TFrame_Map1.Found_Thectadris_Avalonensis_2(Sender: TObject);
begin
  ShowMessage('Found Thectadris Avalonensis 2!');
end;

procedure TFrame_Map1.Found_Thectadris_Avalonensis_3(Sender: TObject);
begin
  ShowMessage('Found Thectadris Avalonensis 3!');
end;

procedure TFrame_Map1.Found_Thectadris_Avalonensis_4(Sender: TObject);
begin
  ShowMessage('Found Thectadris Avalonensis 4!');
end;

procedure TFrame_Map1.Found_Tribrachidiun_Heraldicum_2(Sender: TObject);
begin
  ShowMessage('Found Tribrachidiun Heraldicum 2!');
end;

procedure TFrame_Map1.Found_Tribrachidiun_Heraldicum_3(Sender: TObject);
begin
  ShowMessage('Found Tribrachidiun Heraldicum 3!');
end;

procedure TFrame_Map1.Found_Yoriga_Waggoneri_1(Sender: TObject);
begin
  ShowMessage('Found Yoriga Waggoneri 1!');
end;

procedure TFrame_Map1.Found_Yoriga_Waggoneri_2(Sender: TObject);
begin
  ShowMessage('Found Yoriga Waggoneri 2!');
end;

procedure TFrame_Map1.Found_Tribrachidium_Heraldicum_1(
  Sender: TObject);
begin
  ShowMessage('Found Tribrachidiun Heraldicum 1!');
end;

end.
