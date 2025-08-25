unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Objects, FMX.Ani, FMX.Layouts, System.Net.HttpClient, System.Math, FMX.Dialogs, FMX.Effects,
  uConfig,
  UniPas.Routing.Variables,
  UniPas.Routing;

type
  TFrmMain = class(TForm)
    UniPasContainer: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  System.IniFiles, System.IOUtils, Ian.Config;

{$R *.fmx}

procedure TFrmMain.FormCreate(Sender: TObject);
var
  cfg: TGameConfig;
begin
  UniPas.Routing.Variables.UniPasContainerControl := TObject(UniPasContainer);
  UniPasPageName := 'MainMenu';
  TUniPas.RenderPage(UniPasPageName);

  // Load config and apply fullscreen/windowed mode at startup
  LoadConfig(cfg);
  try
    if cfg.Fullscreen then
    begin
      try
        Self.FullScreen := True;
        Self.WindowState := TWindowState.wsMaximized;
      except
        // ignore platform-specific failures
      end;
    end
    else
    begin
      try
        Self.FullScreen := False;
        Self.WindowState := TWindowState.wsNormal;
        // ensure decorations are applied on some platforms
        try
          Self.Visible := False;
          Self.Visible := True;
        except
          // ignore
        end;
      except
        // ignore
      end;
    end;
  except
    // swallow errors to avoid startup crash
  end;

  try
    // keep bring-to-front behavior
    Self.BringToFront;
  except
    // swallow errors to avoid startup crash
  end;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
var
  cfg: TGameConfig;
begin
  // Persist the current fullscreen/windowed state so the app reopens in the
  // same display mode the user had when closing the application.
  try
    LoadConfig(cfg);
    cfg.Fullscreen := Self.FullScreen;
    SaveConfig(cfg);
  except
    // ignore any IO errors during shutdown
  end;
end;

end.
