unit popSelectMap;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, System.Math.Vectors, FMX.Controls3D,
  FMX.Objects3D;

type
  TpopupSelectMap = class(TFrame)
    laySelectMap: TRectangle;
    Message: TText;
    btnOK: TRectangle; // changed from TButton
    lblOK: TLabel; // label inside button
    procedure btnOKClick(Sender: TObject);
  private
    procedure CenterDialog;
    procedure StyleOKAsMenuButton;
  public
    procedure ShowOn(AParent: TControl);
  end;

implementation

uses
  Ian.Styling.Buttons;

{$R *.fmx}

procedure TpopupSelectMap.CenterDialog;
begin
  if Assigned(laySelectMap) then
  begin
    laySelectMap.Position.X := (Width - laySelectMap.Width) / 2;
    laySelectMap.Position.Y := (Height - laySelectMap.Height) / 2;
    laySelectMap.BringToFront;
  end;
end;

procedure TpopupSelectMap.btnOKClick(Sender: TObject);
begin
  Parent := nil;
  Free;
end;

procedure TpopupSelectMap.StyleOKAsMenuButton;
var
  targetW, targetH, paddingBottom: Single;
begin
  if not Assigned(btnOK) or not Assigned(laySelectMap) then Exit;
  laySelectMap.ClipChildren := True;
  targetW := 120; // standard width similar to other menu buttons (can shrink later)
  targetH := 48;
  paddingBottom := 12;
  if targetW > laySelectMap.Width - 16 then targetW := laySelectMap.Width - 16;
  if targetW < 60 then targetW := 60;
  if targetH > laySelectMap.Height - 32 then targetH := laySelectMap.Height - 32;
  if targetH < 36 then targetH := 36;
  btnOK.Width := targetW;
  btnOK.Height := targetH;
  btnOK.Position.X := (laySelectMap.Width - btnOK.Width) / 2;
  btnOK.Position.Y := laySelectMap.Height - btnOK.Height - paddingBottom;
  if btnOK.Position.Y < (Message.Position.Y + Message.Height + 4) then
    btnOK.Position.Y := Message.Position.Y + Message.Height + 4;
  // Apply unified styling/colors & hover effects
  if Assigned(lblOK) then
    ApplyButtonStyle(btnOK, lblOK, True);
  // Override label text
  lblOK.Text := 'OK';
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
  CenterDialog;
  Visible := True;
end;

end.
