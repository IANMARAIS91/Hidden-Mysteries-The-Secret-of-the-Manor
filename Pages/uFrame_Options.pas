unit uFrame_Options;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.IniFiles,

  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Objects,
  FMX.Controls.Presentation,

  System.IOutils,

  Ian.Styling.Buttons,
  Ian.Config; // new

type
  TFrame_Options = class(TFrame)
    Overlay: TRectangle;
    Dialog: TRectangle;
    TitleLabel: TLabel;
    Inner: TLayout;
    LabelMusic: TLabel;
    SwitchMusic: TSwitch;
    LabelSfx: TLabel;
    SwitchSfx: TSwitch;
    LabelFullscreen: TLabel;
    SwitchFullscreen: TSwitch;
    layButtonContainer: TLayout;
    layButtonCenterContainer: TLayout;
    btnSave: TRectangle;
    lblSave: TLabel;
    Layout1: TLayout;
    btnCancel: TRectangle;
    lblCancel: TLabel;
  private
    // fields first (Delphi expects fields before any subsequent method/property declarations to avoid E2169 in some compiler versions)
    FPendingFullscreen: Boolean; // store the user's pending fullscreen choice until Save
    procedure CancelClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure LoadOptionsFromIni; // new
    procedure SwitchFullscreenChanged(Sender: TObject); // handle toggles without applying immediately
  protected
    procedure Loaded; override;
  public
    procedure ShowOn(AParent: TControl);
    procedure HideOverlay;
  end;

implementation

{$R *.fmx}

procedure TFrame_Options.CancelClick(Sender: TObject);
begin
  HideOverlay;
end;

procedure TFrame_Options.HideOverlay;
begin
  // Remove and free the frame (caller expects the overlay/dialog to go away)
  if Assigned(Self.Parent) then
  begin
    Self.Parent := nil;
    Free;
  end;
end;

procedure TFrame_Options.LoadOptionsFromIni;
var
  cfg: TGameConfig;
begin
  LoadConfig(cfg);
  if Assigned(SwitchMusic) then
    SwitchMusic.IsChecked := cfg.MusicEnabled;
  if Assigned(SwitchSfx) then
    SwitchSfx.IsChecked := cfg.SfxEnabled;
  if Assigned(SwitchFullscreen) then
  begin
    SwitchFullscreen.IsChecked := cfg.Fullscreen; // reflect only; applied on save
    FPendingFullscreen := cfg.Fullscreen;
  end;
end;

procedure TFrame_Options.SaveClick(Sender: TObject);
var
  cfg: TGameConfig;
begin
  // Gather pending values (do not apply changes until Save is pressed)
  if Assigned(SwitchMusic) then
    cfg.MusicEnabled := SwitchMusic.IsChecked
  else
    cfg.MusicEnabled := True;
  if Assigned(SwitchSfx) then
    cfg.SfxEnabled := SwitchSfx.IsChecked
  else
    cfg.SfxEnabled := True;

  // Apply the user's choice from the UI when Save is pressed. Use the switch's IsChecked directly
  // to avoid relying on the OnSwitch event firing.
  if Assigned(SwitchFullscreen) then
    cfg.Fullscreen := SwitchFullscreen.IsChecked
  else
    cfg.Fullscreen := FPendingFullscreen;

  SaveConfig(cfg);

  if Assigned(Application.MainForm) then
  begin
    Application.MainForm.FullScreen := cfg.Fullscreen;

    // Ensure that when leaving fullscreen we restore a normal, decorated window
    if not cfg.Fullscreen then
    begin
      try
        // Request a normal window state which helps restore decorations on many platforms
        Application.MainForm.WindowState := TWindowState.wsNormal;
        Application.MainForm.BringToFront;

        // Some window managers require a quick hide/show to re-evaluate window decorations
        try
          Application.MainForm.Visible := False;
          Application.MainForm.Visible := True;
        except
          // ignore
        end;

        // On some platforms toggling FormStyle/Form borders helps force the native window
        // manager to re-apply decorations; wrap in platform guards to avoid cross-platform issues
        {$IFDEF MSWINDOWS}
        try
          Application.MainForm.FormStyle := TFormStyle.Normal;
        except
          // ignore failures
        end;
        {$ENDIF}

        {$IFDEF LINUX}
        try
          Application.MainForm.FormStyle := TFormStyle.Normal;
        except
          // ignore failures
        end;
        {$ENDIF}
      except
        // swallow any exceptions to avoid crashing the app when platform-specific
        // changes are not supported
      end;
    end
    else
    begin
      // When entering fullscreen, ensure the form is maximized for visual consistency
      try
        Application.MainForm.WindowState := TWindowState.wsMaximized;
      except
        // ignore
      end;
    end;
  end;

  HideOverlay;
end;

procedure TFrame_Options.SwitchFullscreenChanged(Sender: TObject);
begin
  // Only update the pending value; do not change the application's fullscreen state until Save
  if Assigned(SwitchFullscreen) then
    FPendingFullscreen := SwitchFullscreen.IsChecked;
end;

procedure TFrame_Options.Loaded;
begin
  inherited Loaded;

  // Wire events and defaults for design-time components
  if Assigned(btnCancel) then
    btnCancel.OnClick := CancelClick;
  if Assigned(btnSave) then
    btnSave.OnClick := SaveClick;

  if Assigned(btnSave) and Assigned(lblSave) then
    ApplyButtonStyle(btnSave, lblSave, True);
  if Assigned(btnCancel) and Assigned(lblCancel) then
    ApplyButtonStyle(btnCancel, lblCancel, True);

  // Initialize defaults then load persisted values
  if Assigned(SwitchMusic) then SwitchMusic.IsChecked := True;
  if Assigned(SwitchSfx) then SwitchSfx.IsChecked := True;
  if Assigned(SwitchFullscreen) then SwitchFullscreen.IsChecked := False;

  // Wire switch change handler so toggling only updates pending state
  if Assigned(SwitchFullscreen) then
    SwitchFullscreen.OnSwitch := SwitchFullscreenChanged;

  LoadOptionsFromIni; // overrides with stored values

  // Start hidden; owner code should call ShowOn
  Self.Visible := False;
end;

procedure TFrame_Options.ShowOn(AParent: TControl);
begin
  // Parent the frame to the given control (typically the main form) and center the dialog
  if Assigned(Self.Parent) then
    Exit;
  Self.Parent := AParent;
  Self.Align := TAlignLayout.Client;
  Self.Visible := True;
  if Assigned(Dialog) then
  begin
    Dialog.Position.X := (Self.Width - Dialog.Width) / 2;
    Dialog.Position.Y := (Self.Height - Dialog.Height) / 2;
    Dialog.BringToFront;
  end;
end;

end.
