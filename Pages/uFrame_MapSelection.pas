unit uFrame_MapSelection;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation;

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
  private
    // Selection state and helpers
    FSelectedIdx: Integer;
    FSelectedTile: TRectangle;
    procedure TileClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure SelectTile(ATile: TRectangle);
    procedure ApplyTileStyle(ATile: TRectangle; const ASelected: Boolean);
    procedure SelectClick(Sender: TObject);
  protected
    procedure Loaded; override;
  published
    // Design-time components (moved into .fmx)
    Overlay: TRectangle;
    Dialog: TRectangle;
    TitleLabel: TLabel;
    Inner: TRectangle;
    SelectMap1: TRectangle;
    SelectMap2: TRectangle;
    SelectMap3: TRectangle;
    lblSelectMap1: TLabel;
    lblSelectMap2: TLabel;
    lblSelectMap3: TLabel;
  public
    procedure ShowOn(AParent: TControl);
    property SelectedIndex: Integer read FSelectedIdx;
  end;

implementation

uses
  Ian.Styling.Buttons,
  uFrame_Map1, uFrame_Map2, uFrame_Map3, uFrame_Map4, uFrame_Map5, uFrame_Map6,
  popSelectMap; // added System.Classes for TThread

{$R *.fmx}

{ TFrame_MapSelection }

procedure TFrame_MapSelection.CancelClick(Sender: TObject);
var
  LSelf: TFrame_MapSelection;
begin
  // Safely remove from parent and defer Free until after the event returns to avoid
  // use-after-free issues in the caller's call stack.
  if Assigned(Self.Parent) then
    Self.Parent := nil;
  LSelf := Self;
  TThread.Queue(nil,
    procedure
    begin
      if not Application.Terminated and Assigned(LSelf) then
        LSelf.Free;
    end);
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

  if Assigned(btnCancel) then
    btnCancel.OnClick := CancelClick;
  if Assigned(btnSelect) then
    btnSelect.OnClick := SelectClick;

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

  // Start hidden; owner code should call ShowOn
  Self.Visible := False;
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

procedure TFrame_MapSelection.SelectClick(Sender: TObject);
var
  ParentObj: TFmxObject;
  NewFrame: TFrame;
  Popup: TpopupSelectMap;
  LSelf: TFrame_MapSelection;
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

  ParentObj := Self.Parent;

  case FSelectedIdx of
    0: NewFrame := TFrame_Map1.Create(nil);
    1: NewFrame := TFrame_Map2.Create(nil);
    2: NewFrame := TFrame_Map3.Create(nil);
    3: NewFrame := TFrame_Map4.Create(nil);
    4: NewFrame := TFrame_Map5.Create(nil);
    5: NewFrame := TFrame_Map6.Create(nil);
  else
    NewFrame := nil;
  end;

  if Assigned(NewFrame) then
  begin
    NewFrame.Parent := ParentObj;
    NewFrame.Align := TAlignLayout.Client;
    // Remove the selection dialog — defer Free to avoid freeing from within event stack
    if Assigned(Self.Parent) then
      Self.Parent := nil;
    LSelf := Self;
    TThread.Queue(nil,
      procedure
      begin
        if not Application.Terminated and Assigned(LSelf) then
          LSelf.Free;
      end);
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
    Dialog.Position.X := (Self.Width - Dialog.Width) / 2;
    Dialog.Position.Y := (Self.Height - Dialog.Height) / 2;
    Dialog.BringToFront;
  end;
end;

end.
