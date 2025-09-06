unit popMap1Complete;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TpopupMap1Complete = class(TFrame)
    laySelectMap: TRectangle;
    Message: TText;
    btnOK: TRectangle;
    lblOK: TLabel;
  private
    { visual-only: no behaviors }
  public
    procedure StyleOKAsMenuButton; // apply styles only
    procedure ShowOn(AParent: TControl); // display centered on parent
    procedure btnOKClick(Sender: TObject);
  end;

implementation

uses
  Ian.Styling.Buttons; // styling helper (no behavioral code here)

{$R *.fmx}

procedure TpopupMap1Complete.StyleOKAsMenuButton;
var
  targetW, targetH, paddingBottom: Single;
begin
  if not Assigned(btnOK) or not Assigned(laySelectMap) then
    Exit;
  laySelectMap.ClipChildren := True;
  targetW := 120;
  targetH := 48;
  paddingBottom := 12;
  if targetW > laySelectMap.Width - 16 then
    targetW := laySelectMap.Width - 16;
  if targetW < 60 then
    targetW := 60;
  if targetH > laySelectMap.Height - 32 then
    targetH := laySelectMap.Height - 32;
  if targetH < 36 then
    targetH := 36;
  btnOK.Width := targetW;
  btnOK.Height := targetH;
  btnOK.Position.X := (laySelectMap.Width - btnOK.Width) / 2;
  btnOK.Position.Y := laySelectMap.Height - btnOK.Height - paddingBottom;
  if btnOK.Position.Y < (Message.Position.Y + Message.Height + 4) then
    btnOK.Position.Y := Message.Position.Y + Message.Height + 4;
  if Assigned(lblOK) then
    ApplyButtonStyle(btnOK, lblOK, True);
  lblOK.Text := 'OK';
  // Intentionally do not wire any OnClick or ShowOn behavior — visual only
end;

procedure TpopupMap1Complete.btnOKClick(Sender: TObject);
begin
  Parent := nil;
  Free;
end;

procedure TpopupMap1Complete.ShowOn(AParent: TControl);
begin
  if Assigned(Parent) then Exit;
  Parent := AParent;
  Align := TAlignLayout.Contents;
  Width := AParent.Width;
  Height := AParent.Height;
  // apply sizing and styles
  StyleOKAsMenuButton;
  // set the message text for Map 1 completion
  if Assigned(Message) then
    Message.Text := 'Map 1 Complete!';
  // ensure OK closes the popup
  if Assigned(btnOK) then
    btnOK.OnClick := btnOKClick;
  // center dialog if needed (FMX layout ensures contents align)
  Visible := True;
end;

end.
