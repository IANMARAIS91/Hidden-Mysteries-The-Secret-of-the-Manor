unit uFrame_Map2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TFrame_Map2 = class(TFrame)
    Rectangle1: TRectangle;
    imgMap: TImage;
    layMapHitbox_Monitor1: TLayout;
    layMapHitbox_Monitor2: TLayout;
    layMapHitbox_Monitor3: TLayout;
    layMapHitbox_Laptop2: TLayout;
    layMapHitbox_Laptop1: TLayout;
    layMapHitbox_Laptop3: TLayout;
    layMapHitbox_Laptop4: TLayout;
    Layout1: TLayout;
    btnCancel: TRectangle;
    lblCancel: TLabel;
    Rectangle2: TRectangle;
    ScaledLayout1: TScaledLayout;
    procedure btnCancelClick(Sender: TObject);
    procedure Laptop_Found(Sender: TObject);
    procedure TV_Screen_Found(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
   UniPas.Routing;

{$R *.fmx}

procedure TFrame_Map2.btnCancelClick(Sender: TObject);
begin
    TUniPas.RenderPage('MapSelection');
end;

procedure TFrame_Map2.Laptop_Found(Sender: TObject);
begin
    ShowMessage('Laptop Found!');
end;

procedure TFrame_Map2.TV_Screen_Found(Sender: TObject);
begin
    ShowMessage('TV Screen Found!');
end;

end.
