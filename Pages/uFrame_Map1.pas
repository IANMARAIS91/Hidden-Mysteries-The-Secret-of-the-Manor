unit uFrame_Map1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Objects, FMX.Controls.Presentation;

type
  TFrame_Map1 = class(TFrame)
    imgMap: TImage;
    layMapCHI_Monitor1: TLayout;
    layMapCHI_Monitor2: TLayout;
    layMapCHI_Monitor3: TLayout;
    layMapCHI_Laptop4: TLayout;
    layMapCHI_Laptop2: TLayout;
    layMapCHI_Laptop3: TLayout;
    layMapCHI_Laptop1: TLayout;
    Layout1: TLayout;
    btnCancel: TRectangle;
    lblCancel: TLabel;
    Rectangle1: TRectangle;
    procedure layMapCHI_Monitor1Click(Sender: TObject);
    procedure layMapCHI_Laptop1Click(Sender: TObject);
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

procedure TFrame_Map1.layMapCHI_Laptop1Click(Sender: TObject);
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

  if Assigned(imgMap) then
  begin
    // We'll size/position the image manually to achieve a "cover" effect
    imgMap.Align := TAlignLayout.None;
  end;

  UpdateImageCover;
end;

procedure TFrame_Map1.layMapCHI_Monitor1Click(Sender: TObject);
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
  if not Assigned(imgMap) then
    Exit;

  pw := Width;
  ph := Height;
  if (pw <= 0) or (ph <= 0) then
    Exit;

  if (imgMap.Bitmap <> nil) and (imgMap.Bitmap.Width > 0) and (imgMap.Bitmap.Height > 0) then
  begin
    iw := imgMap.Bitmap.Width;
    ih := imgMap.Bitmap.Height;
  end
  else
  begin
    // Fallback to current size if bitmap not yet available
    iw := Max(1, imgMap.Width);
    ih := Max(1, imgMap.Height);
  end;

  // Scale to cover the entire frame (may crop image on edges, preserves aspect)
  scale := Max(pw / iw, ph / ih);

  imgMap.Align := TAlignLayout.None;
  imgMap.Width := iw * scale;
  imgMap.Height := ih * scale;
  imgMap.Position.X := (pw - imgMap.Width) / 2;
  imgMap.Position.Y := (ph - imgMap.Height) / 2;
end;

end.
