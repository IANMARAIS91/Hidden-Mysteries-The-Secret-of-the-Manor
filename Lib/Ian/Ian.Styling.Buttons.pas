unit Ian.Styling.Buttons;

interface

uses
  System.SysUtils, System.Classes, System.UITypes,
  FMX.Types, FMX.Controls, FMX.Objects, FMX.Ani, FMX.StdCtrls, FMX.Graphics;

// AButton: the rectangle to style; ALabel: label child for text
// AEnableAnimations: when False, the color/visual styling is applied but the
// movement/scale animations are not used (movement is applied instantly).
procedure ApplyButtonStyle(AButton: TRectangle; ALabel: TLabel; AEnableAnimations: Boolean = True);

implementation

type
  TButtonStyleHelper = class(TComponent)
  private
    FAnimationsEnabled: Boolean;
    FInitialRectPosY: Single;
    FInitialRectScaleY: Single;
    FInitialLabelPosY: Single;
    FInitialLabelScaleY: Single;
  public
    Button: TRectangle;
    LabelControl: TLabel;
    constructor Create(AOwner: TComponent; AButton: TRectangle; ALabel: TLabel; AEnableAnimations: Boolean); reintroduce;
    destructor Destroy; override;
    procedure AnimationFinish(Sender: TObject);
    procedure ButtonMouseEnter(Sender: TObject);
    procedure ButtonMouseLeave(Sender: TObject);
  end;

{ TButtonStyleHelper }

constructor TButtonStyleHelper.Create(AOwner: TComponent; AButton: TRectangle; ALabel: TLabel; AEnableAnimations: Boolean);
begin
  inherited Create(AOwner);
  Button := AButton;
  LabelControl := ALabel;
  FAnimationsEnabled := AEnableAnimations;
  // capture initial transform/state so non-animated transitions can restore correctly
  if Assigned(Button) then
  begin
    FInitialRectPosY := Button.Position.Y;
    FInitialRectScaleY := Button.Scale.Y;
  end
  else
  begin
    FInitialRectPosY := 0;
    FInitialRectScaleY := 1;
  end;
  if Assigned(LabelControl) then
  begin
    FInitialLabelPosY := LabelControl.Position.Y;
    FInitialLabelScaleY := LabelControl.Scale.Y;
  end
  else
  begin
    FInitialLabelPosY := 0;
    FInitialLabelScaleY := 1;
  end;
end;

procedure TButtonStyleHelper.AnimationFinish(Sender: TObject);
begin
  // Free the animation object when finished
  if Sender is TFloatAnimation then
    TFloatAnimation(Sender).Free;
end;

destructor TButtonStyleHelper.Destroy;
var
  i: Integer;
begin
  // Disconnect mouse event handlers so the control won't call into this freed helper
  if Assigned(Button) then
  begin
    try
      Button.OnMouseEnter := nil;
      Button.OnMouseLeave := nil;
    except
      // ignore if control already partially destroyed
    end;
    // Also clear TagObject so it doesn't reference this helper any more
    try
      Button.TagObject := nil;
    except
    end;

    // Clear animations' OnFinish to avoid callback into a freed helper
    for i := 0 to Button.ComponentCount - 1 do
      if Button.Components[i] is TFloatAnimation then
        TFloatAnimation(Button.Components[i]).OnFinish := nil;
  end;
  if Assigned(LabelControl) then
  begin
    for i := 0 to LabelControl.ComponentCount - 1 do
      if LabelControl.Components[i] is TFloatAnimation then
        TFloatAnimation(LabelControl.Components[i]).OnFinish := nil;
  end;
  inherited Destroy;
end;

procedure TButtonStyleHelper.ButtonMouseEnter(Sender: TObject);
var
  R: TRectangle;
  anim: TFloatAnimation;
  L: TLabel;
  scaleTarget: Single;
  moveY: Single;
begin
  if not (Sender is TRectangle) then
    Exit;
  R := Sender as TRectangle;

  // Save original color in Tag (NativeInt). If Tag already set, we assume stored.
  if R.Tag = 0 then
    R.Tag := NativeInt(R.Fill.Color);
  // Light rose-gold color (RGB): F2 C2 B2 with more transparent alpha -> $33F2C2B2
  R.Fill.Color := TAlphaColor($33F2C2B2);

  // Choose stronger visual effect
  scaleTarget := 0.92; // more vertical squeeze
  moveY := 10; // pixels downwards so bottom appears closer

  // Find associated label from helper
  L := LabelControl;

  if FAnimationsEnabled then
  begin
    // Animate vertical squeeze on rectangle
    anim := TFloatAnimation.Create(Self); // helper owns animation
    anim.Parent := R;
    anim.PropertyName := 'Scale.Y';
    anim.StartValue := R.Scale.Y;
    anim.StopValue := scaleTarget; // slightly squashed vertically
    anim.Duration := 0.18;
    anim.OnFinish := AnimationFinish;
    anim.Enabled := True;

    anim := TFloatAnimation.Create(Self);
    anim.Parent := R;
    anim.PropertyName := 'Position.Y';
    anim.StartValue := R.Position.Y;
    anim.StopValue := R.Position.Y + moveY; // move down
    anim.Duration := 0.18;
    anim.OnFinish := AnimationFinish;
    anim.Enabled := True;

    if Assigned(L) then
    begin
      // Animate label scale to counter the rectangle squeeze
      anim := TFloatAnimation.Create(Self);
      anim.Parent := L;
      anim.PropertyName := 'Scale.Y';
      anim.StartValue := L.Scale.Y;
      anim.StopValue := 1.0 / scaleTarget;
      anim.Duration := 0.18;
      anim.OnFinish := AnimationFinish;
      anim.Enabled := True;

      // Animate label position to counter the rectangle movement
      anim := TFloatAnimation.Create(Self);
      anim.Parent := L;
      anim.PropertyName := 'Position.Y';
      anim.StartValue := L.Position.Y;
      anim.StopValue := L.Position.Y - moveY;
      anim.Duration := 0.18;
      anim.OnFinish := AnimationFinish;
      anim.Enabled := True;
    end;
  end
  else
  begin
    // When animations are disabled, only change color — do not move or scale controls.
    // Record initial values so Leave can restore if needed.
    if Assigned(Button) then
    begin
      FInitialRectPosY := Button.Position.Y;
      FInitialRectScaleY := Button.Scale.Y;
    end;
    if Assigned(L) then
    begin
      FInitialLabelPosY := L.Position.Y;
      FInitialLabelScaleY := L.Scale.Y;
    end;
  end;
end;

procedure TButtonStyleHelper.ButtonMouseLeave(Sender: TObject);
var
  R: TRectangle;
  anim: TFloatAnimation;
  L: TLabel;
  moveY: Single;
begin
  if not (Sender is TRectangle) then
    Exit;
  R := Sender as TRectangle;
  // Restore color if we saved one
  if R.Tag <> 0 then
  begin
    R.Fill.Color := TAlphaColor(R.Tag);
    R.Tag := 0;
  end;

  moveY := 10; // must match enter's moveY

  L := LabelControl;

  if FAnimationsEnabled then
  begin
    // Animate back vertical scale to 1
    anim := TFloatAnimation.Create(Self);
    anim.Parent := R;
    anim.PropertyName := 'Scale.Y';
    anim.StartValue := R.Scale.Y;
    anim.StopValue := 1.0;
    anim.Duration := 0.18;
    anim.OnFinish := AnimationFinish;
    anim.Enabled := True;

    // Move back up to original position
    anim := TFloatAnimation.Create(Self);
    anim.Parent := R;
    anim.PropertyName := 'Position.Y';
    anim.StartValue := R.Position.Y;
    anim.StopValue := R.Position.Y - moveY; // move back up
    anim.Duration := 0.18;
    anim.OnFinish := AnimationFinish;
    anim.Enabled := True;

    if Assigned(L) then
    begin
      // Animate label scale back to normal
      anim := TFloatAnimation.Create(Self);
      anim.Parent := L;
      anim.PropertyName := 'Scale.Y';
      anim.StartValue := L.Scale.Y;
      anim.StopValue := 1.0;
      anim.Duration := 0.18;
      anim.OnFinish := AnimationFinish;
      anim.Enabled := True;

      // Animate label position back to original
      anim := TFloatAnimation.Create(Self);
      anim.Parent := L;
      anim.PropertyName := 'Position.Y';
      anim.StartValue := L.Position.Y;
      anim.StopValue := L.Position.Y + moveY;
      anim.Duration := 0.18;
      anim.OnFinish := AnimationFinish;
      anim.Enabled := True;
    end;
  end
  else
  begin
    // When animations are disabled we should not move/scale controls — just restore any stored values.
    if Assigned(Button) then
    begin
      Button.Scale.Y := FInitialRectScaleY;
      Button.Position.Y := FInitialRectPosY;
    end;
    if Assigned(L) then
    begin
      L.Scale.Y := FInitialLabelScaleY;
      L.Position.Y := FInitialLabelPosY;
    end;
  end;

  // No rotation center changes needed
end;

procedure ApplyButtonStyle(AButton: TRectangle; ALabel: TLabel; AEnableAnimations: Boolean = True);
var
  helper: TButtonStyleHelper;
begin
  if not Assigned(AButton) then
    Exit;

  // Apply the visual defaults taken from the FMX design-time values so dynamically
  // created buttons match the appearance:
  // - Cursor = crHandPoint
  // - Fill.Color = x990A0A0A
  // - Size = 161 x 56
  // - Stroke.Color = x7FB4A082
  // - XRadius/YRadius = 7
  AButton.Cursor := crHandPoint;
  AButton.Fill.Kind := TBrushKind.Solid;
  AButton.Fill.Color := TAlphaColor($990A0A0A);
  AButton.Height := 56;
  AButton.Stroke.Kind := TBrushKind.Solid;
  AButton.Stroke.Color := TAlphaColor($7FB4A082);
  AButton.XRadius := 7;
  AButton.YRadius := 7;

  // Create helper (owned by the button so it frees with it)
  helper := TButtonStyleHelper.Create(AButton, AButton, ALabel, AEnableAnimations);
  // store helper in TagObject for later reference
  AButton.TagObject := helper;

  // Apply label defaults via helper
  if Assigned(ALabel) then
  begin
    helper.LabelControl.Align := TAlignLayout.Client;
    helper.LabelControl.StyledSettings := [TStyledSetting.Family];
    helper.LabelControl.TextSettings.Font.Size := 18;
    helper.LabelControl.TextSettings.FontColor := TAlphaColorRec.White;
    helper.LabelControl.TextSettings.HorzAlign := TTextAlign.Center;
    helper.LabelControl.Width := AButton.Width;
    helper.LabelControl.Height := AButton.Height;
  end;

  // Wire up mouse handlers to helper methods
  AButton.OnMouseEnter := helper.ButtonMouseEnter;
  AButton.OnMouseLeave := helper.ButtonMouseLeave;
  // Ensure it's hittable
  AButton.HitTest := True;
end;

end.
