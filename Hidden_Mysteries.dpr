program Hidden_Mysteries;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  uMain in 'uMain.pas' {FrmMain},
  uConfig in 'Data\uConfig.pas',
  UniPas.Routing in 'Lib\UniPas\UniPas.Routing.pas',
  UniPas.Routing.Pages in 'Lib\UniPas\UniPas.Routing.Pages.pas',
  UniPas.uFrame_404PageNotFound in 'Lib\UniPas\Pages\UniPas.uFrame_404PageNotFound.pas' {Frame_404PageNotFound: TFrame},
  UniPas.Routing.Variables in 'Lib\UniPas\UniPas.Routing.Variables.pas',
  popSelectMap in 'Dialogs\popSelectMap.pas' {popupSelectMap: TFrame},
  Ian.Config in 'Lib\Ian\Ian.Config.pas',
  Ian.Styling.Buttons in 'Lib\Ian\Ian.Styling.Buttons.pas',
  Ian.Utilities in 'Lib\Ian\Ian.Utilities.pas',
  uFrame_MainMenu in 'Pages\uFrame_MainMenu.pas' {Frame_MainMenu: TFrame},
  uFrame_Map1 in 'Pages\uFrame_Map1.pas' {Frame_Map1: TFrame},
  uFrame_Map2 in 'Pages\uFrame_Map2.pas' {Frame_Map2: TFrame},
  uFrame_Map3 in 'Pages\uFrame_Map3.pas' {Frame_Map3: TFrame},
  uFrame_Map4 in 'Pages\uFrame_Map4.pas' {Frame_Map4: TFrame},
  uFrame_Map5 in 'Pages\uFrame_Map5.pas' {Frame_Map5: TFrame},
  uFrame_Map6 in 'Pages\uFrame_Map6.pas' {Frame_Map6: TFrame},
  uFrame_MapSelection in 'Pages\uFrame_MapSelection.pas' {Frame_MapSelection: TFrame},
  uFrame_Options in 'Pages\uFrame_Options.pas' {Frame_Options: TFrame},
  uBootstrapIcons in 'Lib\Delphi-Bootstrap-Icons\uBootstrapIcons.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
