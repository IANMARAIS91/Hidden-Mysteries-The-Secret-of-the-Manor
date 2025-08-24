unit uFrame_MapSelection;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.Effects,
  FMX.Filter.Effects, uBootstrapIcons, System.Skia, FMX.Skia,
  System.Generics.Collections;

type
  TFrame_MapSelection = class(TFrame)
    layButtonContainer: TLayout;
    layButtonCenterContainer: TLayout;
    btnSelect: TRectangle;
    lblSelect: TLabel;
    Layout1: TLayout;
    btnCancel: TRectangle;
    lblCancel: TLabel;
    SelectMap4: TRectangle;
    SelectMap5: TRectangle;
    lblSelectMap5: TLabel;
    SelectMap6: TRectangle;
    lblSelectMap6: TLabel;
    imgBackground: TImage;
    GloomEffect1: TGloomEffect;
    Section1Next: TSkSvg;
    Section1Back: TSkSvg;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure Section1NextMouseEnter(Sender: TObject);
    procedure Section1NextMouseLeave(Sender: TObject);
    procedure Section1BackMouseLeave(Sender: TObject);
    procedure Section1BackMouseEnter(Sender: TObject);
  private
    // Selection state and helpers
    FSelectedIdx: Integer;
    FSelectedTile: TRectangle;
    FOriginalPos: TDictionary<TControl, Single>;
    procedure TileClick(Sender: TObject);
    procedure SelectTile(ATile: TRectangle);
    procedure ApplyTileStyle(ATile: TRectangle; const ASelected: Boolean);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ShowOn(AParent: TControl);
    property SelectedIndex: Integer read FSelectedIdx;
  end;

implementation

uses
  Ian.Styling.Buttons,
  UniPas.Routing, // delegate creation/navigation
  popSelectMap, // added System.Classes for TThread
  FMX.Ani,
  System.NetEncoding;

{$R *.fmx}

{ TFrame_MapSelection }

constructor TFrame_MapSelection.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOriginalPos := TDictionary<TControl, Single>.Create;
end;

destructor TFrame_MapSelection.Destroy;
begin
  FOriginalPos.Free;
  inherited Destroy;
end;

procedure TFrame_MapSelection.btnCancelClick(Sender: TObject);
begin
  TUniPas.RenderPage('MainMenu');
end;

procedure TFrame_MapSelection.btnSelectClick(Sender: TObject);
var
  Popup: TpopupSelectMap;
begin
  // Ensure a map is selected
  if FSelectedIdx < 0 then
  begin
    // Show custom popup instead of generic message
    if Assigned(Parent) and (Parent is TControl) then
    begin
      Popup := TpopupSelectMap.Create(nil);
      Popup.ShowOn(TControl(Parent));
    end
    else
      ShowMessage('Please select a map first.');
    Exit;
  end;

  // Delegate creation of the map frame to TUniPas so routing and lifecycle
  // are centralized. Page names are Map1..Map6.
  TUniPas.RenderPage('Map' + IntToStr(FSelectedIdx + 1));
end;

procedure TFrame_MapSelection.TileClick(Sender: TObject);
var
  idx: Integer;
begin
  if Sender is TRectangle then
  begin
    idx := TRectangle(Sender).Tag;
    // Select and visually highlight the clicked tile
    SelectTile(TRectangle(Sender));
  end;
end;

procedure TFrame_MapSelection.Loaded;
var
  SvgBase64: string;
  CommaPos: Integer;
  Bytes: TBytes;
  Stream: TBytesStream;
  Bmp: TBitmap;
begin
  inherited Loaded;

  // Wire up tile tags and events (components are created by the FMX streaming system)
  if Assigned(SelectMap1) then
  begin
    SelectMap1.Tag := 0;
    SelectMap1.OnClick := TileClick;
  end;
  if Assigned(SelectMap2) then
  begin
    SelectMap2.Tag := 1;
    SelectMap2.OnClick := TileClick;
  end;
  if Assigned(SelectMap3) then
  begin
    SelectMap3.Tag := 2;
    SelectMap3.OnClick := TileClick;
  end;
  // Map 4..6 (if present in the .fmx)
  if Assigned(SelectMap4) then
  begin
    SelectMap4.Tag := 3;
    SelectMap4.OnClick := TileClick;
  end;
  if Assigned(SelectMap5) then
  begin
    SelectMap5.Tag := 4;
    SelectMap5.OnClick := TileClick;
  end;
  if Assigned(SelectMap6) then
  begin
    SelectMap6.Tag := 5;
    SelectMap6.OnClick := TileClick;
  end;

  // Let label clicks pass through to the tiles
  if Assigned(lblSelectMap1) then lblSelectMap1.HitTest := False;
  if Assigned(lblSelectMap2) then lblSelectMap2.HitTest := False;
  if Assigned(lblSelectMap3) then lblSelectMap3.HitTest := False;
  if Assigned(lblSelectMap5) then lblSelectMap5.HitTest := False;
  if Assigned(lblSelectMap6) then lblSelectMap6.HitTest := False;

  // Apply shared button styling to the cancel/select buttons
  if Assigned(btnSelect) and Assigned(lblSelect) then
    ApplyButtonStyle(btnSelect, lblSelect, True);
  if Assigned(btnCancel) and Assigned(lblCancel) then
    ApplyButtonStyle(btnCancel, lblCancel, True);

  // Initial selection state and visuals
  FSelectedIdx := -1;
  FSelectedTile := nil;
  ApplyTileStyle(SelectMap1, False);
  ApplyTileStyle(SelectMap2, False);
  ApplyTileStyle(SelectMap3, False);
  ApplyTileStyle(SelectMap4, False);
  ApplyTileStyle(SelectMap5, False);
  ApplyTileStyle(SelectMap6, False);

  // Animations for Section1Next/Section1Back intentionally disabled; do not wire hover events

  // Start hidden; owner code should call ShowOn
  Self.Visible := False;

  // ...existing code for loading icons ...
end;

procedure TFrame_MapSelection.Section1BackMouseEnter(Sender: TObject);
var
  Ctrl: TControl;
  TargetX: Single;
begin
  if Sender is TControl then
  begin
    Ctrl := TControl(Sender);
    // Store original X if we haven't already so repeated fast hovers don't accumulate
    if not FOriginalPos.ContainsKey(Ctrl) then
      FOriginalPos.Add(Ctrl, Ctrl.Position.X);
    TargetX := FOriginalPos[Ctrl] - 8;
    // Animate to the left by 8px over 150ms
    TAnimator.AnimateFloat(Ctrl, 'Position.X', TargetX, 0.15, TAnimationType.&Out, TInterpolationType.Linear);
  end;
end;

procedure TFrame_MapSelection.Section1BackMouseLeave(Sender: TObject);
var
  Ctrl: TControl;
  TargetX: Single;
begin
  if Sender is TControl then
  begin
    Ctrl := TControl(Sender);
    // Animate back to the stored original position (fallback to current+8 if missing)
    if FOriginalPos.ContainsKey(Ctrl) then
      TargetX := FOriginalPos[Ctrl]
    else
      TargetX := Ctrl.Position.X + 8;
    TAnimator.AnimateFloat(Ctrl, 'Position.X', TargetX, 0.15, TAnimationType.&Out, TInterpolationType.Linear);
  end;
end;

procedure TFrame_MapSelection.Section1NextMouseEnter(Sender: TObject);
var
  Ctrl: TControl;
  TargetX: Single;
begin
  if Sender is TControl then
  begin
    Ctrl := TControl(Sender);
    if not FOriginalPos.ContainsKey(Ctrl) then
      FOriginalPos.Add(Ctrl, Ctrl.Position.X);
    TargetX := FOriginalPos[Ctrl] + 8;
    // Animate to the right by 8px over 150ms
    TAnimator.AnimateFloat(Ctrl, 'Position.X', TargetX, 0.15, TAnimationType.&Out, TInterpolationType.Linear);
  end;
end;

procedure TFrame_MapSelection.Section1NextMouseLeave(Sender: TObject);
var
  Ctrl: TControl;
  TargetX: Single;
begin
  if Sender is TControl then
  begin
    Ctrl := TControl(Sender);
    if FOriginalPos.ContainsKey(Ctrl) then
      TargetX := FOriginalPos[Ctrl]
    else
      TargetX := Ctrl.Position.X - 8;
    TAnimator.AnimateFloat(Ctrl, 'Position.X', TargetX, 0.15, TAnimationType.&Out, TInterpolationType.Linear);
  end;
end;

procedure TFrame_MapSelection.SelectTile(ATile: TRectangle);
begin
  if not Assigned(ATile) then
    Exit;

  // Reset previous selection
  if Assigned(FSelectedTile) then
    ApplyTileStyle(FSelectedTile, False);

  // Apply new selection
  FSelectedTile := ATile;
  FSelectedIdx := ATile.Tag;
  ApplyTileStyle(ATile, True);
end;

procedure TFrame_MapSelection.ApplyTileStyle(ATile: TRectangle; const ASelected: Boolean);
begin
  if not Assigned(ATile) then
    Exit;

  // Ensure stroke is visible for selection outline
  ATile.Stroke.Kind := TBrushKind.Solid;
  if ASelected then
  begin
    ATile.Stroke.Color := $FF4FC3F7; // light blue highlight
    ATile.Stroke.Thickness := 4;
    ATile.Opacity := 1.0;
  end
  else
  begin
    ATile.Stroke.Color := $80FFFFFF; // subtle white outline
    ATile.Stroke.Thickness := 1;
    ATile.Opacity := 0.95;
  end;
end;

procedure TFrame_MapSelection.ShowOn(AParent: TControl);
begin
  // Parent the frame to the given control (typically the main form) and center the dialog
  if Assigned(Self.Parent) then
    Exit;
  Self.Parent := AParent;
  Self.Align := TAlignLayout.Client;
  Self.Visible := True;
  // Center dialog in case Parent size changed
  if Assigned(Dialog) then
  begin
    Dialog.BringToFront;
  end;
end;

end.
