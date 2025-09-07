unit popSelectMap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, System.Math.Vectors, FMX.Controls3D,
  FMX.Objects3D, FMX.Layouts;

type
  TpopupSelectMap = class(TFrame)
    layDialog: TRectangle;
    lblMessage: TText;
    layButtonContainer: TLayout;
    layButtonCenterContainer: TLayout;
    btnOk: TRectangle;
    lblOk: TLabel; // label inside button
    procedure btnOKClick(Sender: TObject);
  private
    procedure StyleOKAsMenuButton;
  public
    procedure ShowOn(AParent: TControl);
  end;

implementation

uses
  Ian.Styling.Buttons,
  UniPas.Routing;

{$R *.fmx}

procedure TpopupSelectMap.btnOKClick(Sender: TObject);
begin
  Parent := nil;
  Free;
end;

procedure TpopupSelectMap.StyleOKAsMenuButton;
begin
  var targetW: Single := 120; // standard width similar to other menu buttons (can shrink later)
  var targetH: Single := 48;
  var paddingBottom: Single := 12;
  if targetW > layDialog.Width - 16 then targetW := layDialog.Width - 16;
  if targetW < 60 then targetW := 60;
  if targetH > layDialog.Height - 32 then targetH := layDialog.Height - 32;
  if targetH < 36 then targetH := 36;
  // Apply unified styling/colors & hover effects
  if Assigned(lblOK) then
    ApplyButtonStyle(btnOK, lblOK, True);
  btnOK.OnClick := btnOKClick;
end;

procedure TpopupSelectMap.ShowOn(AParent: TControl);
begin
  if Assigned(Parent) then Exit;
  Parent := AParent;
  Align := TAlignLayout.Contents;
  Width := AParent.Width;
  Height := AParent.Height;
  StyleOKAsMenuButton;
  Visible := True;
end;

end.
