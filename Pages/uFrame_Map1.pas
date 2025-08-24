unit uFrame_Map1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation;

type
  TFrame_Map1 = class(TFrame)
    Image1: TImage;
    Monitor1: TLayout;
    Monitor2: TLayout;
    Monitor3: TLayout;
    Laptop4: TLayout;
    Laptop2: TLayout;
    Laptop3: TLayout;
    Laptop1: TLayout;
    Layout1: TLayout;
    btnCancel: TRectangle;
    lblCancel: TLabel;
    Rectangle1: TRectangle;
    procedure Monitor1Click(Sender: TObject);
    procedure Laptop1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    procedure UpdateImageCover;
  protected
    procedure Loaded; override;
    procedure Resize; override;
  public
    { Public declarations }
  end;

implementation

uses
  System.Math,
  UniPas.Routing; // use routing to show map selection

{$R *.fmx}

procedure TFrame_Map1.Laptop1Click(Sender: TObject);
begin
  ShowMessage('You found the laptop!');
end;

procedure TFrame_Map1.btnCancelClick(Sender: TObject);
begin
  TUniPas.RenderPage('MapSelection');
end;

procedure TFrame_Map1.Loaded;
begin
  inherited;
  // Ensure child content does not draw outside the frame
  ClipChildren := True;

  if Assigned(Image1) then
  begin
    // We'll size/position the image manually to achieve a "cover" effect
    Image1.Align := TAlignLayout.None;
  end;

  UpdateImageCover;
end;

procedure TFrame_Map1.Monitor1Click(Sender: TObject);
begin
  ShowMessage('You found the monitor!');
end;

procedure TFrame_Map1.Resize;
begin
  inherited;
  UpdateImageCover;
end;

procedure TFrame_Map1.UpdateImageCover;
var
  pw, ph, iw, ih, scale: Single;
begin
  if not Assigned(Image1) then
    Exit;

  pw := Width;
  ph := Height;
  if (pw <= 0) or (ph <= 0) then
    Exit;

  if (Image1.Bitmap <> nil) and (Image1.Bitmap.Width > 0) and (Image1.Bitmap.Height > 0) then
  begin
    iw := Image1.Bitmap.Width;
    ih := Image1.Bitmap.Height;
  end
  else
  begin
    // Fallback to current size if bitmap not yet available
    iw := Max(1, Image1.Width);
    ih := Max(1, Image1.Height);
  end;

  // Scale to cover the entire frame (may crop image on edges, preserves aspect)
  scale := Max(pw / iw, ph / ih);

  Image1.Align := TAlignLayout.None;
  Image1.Width := iw * scale;
  Image1.Height := ih * scale;
  Image1.Position.X := (pw - Image1.Width) / 2;
  Image1.Position.Y := (ph - Image1.Height) / 2;
end;

end.
