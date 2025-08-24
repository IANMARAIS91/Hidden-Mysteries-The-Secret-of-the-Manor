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
  uFrame_Options, // move options UI into its own frame
  UniPas.Routing; // Use TUniPas for navigation/creation of frames

{$R *.fmx}

procedure TFrame_MainMenu.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrame_MainMenu.btnOptionsClick(Sender: TObject);
begin
  TUniPas.RenderPage('Options');
end;

procedure TFrame_MainMenu.btnPlayGameClick(Sender: TObject);
begin
  TUniPas.RenderPage('MapSelection');
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
