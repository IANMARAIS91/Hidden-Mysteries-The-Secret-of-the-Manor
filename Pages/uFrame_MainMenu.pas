unit uFrame_MainMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Layouts, System.Net.HttpClient, FMX.Dialogs, FMX.Objects,
  FMX.Effects, FMX.Filter.Effects, FMX.Ani;

type
  TFrame_MainMenu = class(TFrame)
    lblMainHeading: TLabel;
    lblSubHeading: TLabel;
    lblCopyright: TLabel;
    layButtonContainer: TLayout;
    layButtonCenterContainer: TLayout;
    btnPlayGame: TRectangle;
    lblPlayGame: TLabel;
    btnExit: TRectangle;
    lblExit: TLabel;
    btnOptions: TRectangle;
    lblOptions: TLabel;
    layContainer: TLayout;
    imgBackground: TImage;
    GloomEffect1: TGloomEffect;
    procedure btnExitClick(Sender: TObject);
    procedure btnPlayGameClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
  protected
    procedure Loaded; override;
  public
  end;

var
  Frame_MainMenu: TFrame_MainMenu;

implementation

uses
  uFrame_MapSelection,
  Ian.Styling.Buttons,
  uFrame_Options; // move options UI into its own frame

{$R *.fmx}

procedure TFrame_MainMenu.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrame_MainMenu.btnOptionsClick(Sender: TObject);
var
  Frm: TFrame_Options;
  i: Integer;
  existing: TFrame_Options;
begin
  // If an Options frame already exists as a component owned by this frame, reuse it
  existing := nil;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TFrame_Options then
    begin
      existing := TFrame_Options(Components[i]);
      Break;
    end;
  if Assigned(existing) then
  begin
    existing.ShowOn(Self);
    Exit;
  end;

  // Create the options frame and show it on this frame's parent (non-blocking)
  Frm := TFrame_Options.Create(nil);
  try
    Frm.ShowOn(Self);
  except
    Frm.Free;
    raise;
  end;
end;

procedure TFrame_MainMenu.btnPlayGameClick(Sender: TObject);
var
  Frm: TFrame_MapSelection;
begin
  Frm := TFrame_MapSelection.Create(nil);
  try
    Frm.ShowOn(Self);
  except
    Frm.Free;
    raise;
  end;
end;

procedure TFrame_MainMenu.Loaded;
begin
  inherited;
  // Assign shared handlers to the menu buttons using the styling unit
  ApplyButtonStyle(btnPlayGame, lblPlayGame, True);
  ApplyButtonStyle(btnOptions, lblOptions, True);
  ApplyButtonStyle(btnExit, lblExit, True);
end;

end.
