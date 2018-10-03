unit FigureClass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections;

type
  TFigure = class
  private
    _X: integer;
    _Y: integer;
    _size: integer;
    _delta: integer;
    _color: TColor;
    _checked: boolean;
  public
    property X: integer read _X write _X;
    property Y: integer read _Y write _Y;
    property Delta: integer read _delta write _delta;
    property Size: integer read _size write _size;
    property Color: TColor read _color write _color;
    property Checked: boolean read _checked write _checked;
  end;

  TFiguresList = class(TObjectList<TFigure>)
  end;

  TCircle = class(TFigure)
  public
    constructor Create(width, heigth: integer);
  end;

  TSquere = class(TFigure)
  public
    constructor Create(width, heigth: integer);
  end;

  TTriangle = class(TFigure)
  public
    constructor Create(width, heigth: integer);
  end;

  TStar = class(TFigure)
  public
    constructor Create(width, heigth: integer);
  end;

  TPaintManager = class
  private
    _cnv: TCanvas;
    _ItemsList: TFiguresList;
    _width, _height: integer;
    procedure Check(x, y: integer);
    procedure PaintStar(Star: TStar);
    procedure PaintSquere(Squere: TSquere);
    procedure PaintCircle(Circle: TCircle);
    procedure PaintTriangle(Triangle: TTriangle);
    procedure PaintItem(Item: TFigure);
    procedure PaintAllFigures;
  public
    constructor Create(cnv: TCanvas; width, height: integer);
    property Canvas: TCanvas read _cnv write _cnv;
    property ItemsList: TFiguresList read _ItemsList write _ItemsList;
    property Width: integer read _width write _width;
    property Height: integer read _height write _height;
    procedure Update;
    procedure ChangeColor(cl: TColor);
  end;

implementation

{ TCircle }

constructor TCircle.Create(width, heigth: integer);
begin
  self.Size := random(80) + 40;
  self.X := random(width - self.Size * 2) + self.Size;
  self.Y := random(heigth - self.Size * 2) + self.Size;
  self.Color := clBlack;
  _checked := false;
end;

{ TSquere }

constructor TSquere.Create(width, heigth: integer);
begin
  self.Size := random(80) + 40;
  self.X := random(width - self.Size * 4) + self.Size * 2;
  self.Y := random(heigth - self.Size * 4) + self.Size * 2;
  self.Delta := random(360);
  self.Color := clBlack;
  _checked := false;
end;

{ TTriangle }

constructor TTriangle.Create(width, heigth: integer);
begin
  self.Size := random(80) + 40;
  self.X := random(width - self.Size * 2) + self.Size;
  self.Y := random(heigth - self.Size * 2) + self.Size;
  self.Delta := random(360);
  self.Color := clBlack;
  _checked := false;
end;

{ TStar }

constructor TStar.Create(width, heigth: integer);
begin
  self.Size := random(80) + 40;
  self.X := random(width - self.Size * 2) + self.Size;
  self.Y := random(heigth - self.Size * 2) + self.Size;
  self.Delta := random(360);
  self.Color := clBlack;
  _checked := false;
end;

{ TPaintManager }

procedure TPaintManager.ChangeColor(cl: TColor);
begin
  self._cnv.Brush.Color := cl;
  Update;
end;

procedure TPaintManager.Check(x, y: integer);
begin
  _cnv.pen.Color := clBlack;
  _cnv.MoveTo(x - 15, y - 15);
  _cnv.LineTo(x + 15, y + 15);
  _cnv.MoveTo(x + 15, y - 15);
  _cnv.LineTo(x - 15, y + 15);
end;

constructor TPaintManager.Create(cnv: TCanvas; width, height: integer);
begin
  _cnv := cnv;
  _width := width;
  _height := height;
  _Itemslist := TFiguresList.Create(true);
end;

procedure TPaintManager.PaintAllFigures;
var
  i: integer;
begin
  for i := 0 to ItemsList.Count - 1 do
  begin
    PaintItem(ItemsList[i]);
    if itemslist[i].Checked then
      Check(itemslist[i].X, itemslist[i].Y);
  end;
end;

procedure TPaintManager.PaintCircle(Circle: TCircle);
begin
  _cnv.Pen.Color := Circle.Color;
  _cnv.Ellipse(Circle.X - Circle.Size, Circle.Y - Circle.Size, Circle.X + Circle.Size, Circle.Y + Circle.Size);
end;

procedure TPaintManager.PaintItem(Item: TFigure);
begin
  if Item is TStar then
    PaintStar(Item as TStar)
  else if Item is TCircle then
    PaintCircle(Item as TCircle)
  else if Item is TSquere then
    PaintSquere(Item as TSquere)
  else if Item is TTriangle then
    PaintTriangle(Item as TTriangle);
end;

procedure TPaintManager.PaintSquere(Squere: TSquere);
var
  sina, cosa: double;
  crd: array[1..5] of TPoint;
  m: integer;
begin
  m := Squere.Size;
  cosa := cos(2 * pi * Squere.Delta / 360);
  sina := sin(2 * pi * Squere.Delta / 360);
  crd[1].X := Squere.X + round((-m * cosa) - (-m * sina));
  crd[1].y := Squere.Y + round((-m * sina) + (-m * cosa));
  crd[2].X := Squere.X + round((m * cosa) - (-m * sina));
  crd[2].y := Squere.Y + round((m * sina) + (-m * cosa));
  crd[3].X := Squere.X + round((m * cosa) - (m * sina));
  crd[3].y := Squere.Y + round((m * sina) + (m * cosa));
  crd[4].X := Squere.X + round((-m * cosa) - (m * sina));
  crd[4].y := Squere.Y + round((-m * sina) + (m * cosa));
  crd[5].X := crd[1].X;
  crd[5].Y := crd[1].y;
  _cnv.Pen.Color := Squere.Color;
  _cnv.Polyline(crd);
end;

procedure TPaintManager.PaintStar(Star: TStar);
var
  i, a: integer;
  crd: array[1..11] of TPoint;
begin
  a := star.Delta - 18;
  for i := 1 to 10 do
  begin
    if (i mod 2 = 0) then
    begin
      crd[i].x := Star.X + Round(Star.Size / 3 * cos(a * 2 * pi / 360));
      crd[i].y := Star.Y + Round(Star.Size / 3 * sin(a * 2 * pi / 360));
    end else
    begin
      crd[i].x := Star.X + Round(Star.Size * cos(a * 2 * pi / 360));
      crd[i].y := Star.Y + Round(Star.Size * sin(a * 2 * pi / 360));
    end;
  a := a + 36;
  end;
  crd[11].X := crd[1].X;
  crd[11].Y := crd[1].Y;
  _cnv.Pen.Color := Star.Color;
  _cnv.Polyline(crd);
end;

procedure TPaintManager.PaintTriangle(Triangle: TTriangle);
var
  i: integer;
  crd: array[1..4] of TPoint;
begin
  for i := 1 to 3 do
  begin
    crd[i].X := Triangle.X + round(Triangle.Size * sin(Triangle.Delta / 57.4 + 2 * i * pi / 3));
    crd[i].Y := Triangle.Y - round(Triangle.Size * cos(Triangle.Delta / 57.4 + 2 * i * pi / 3));
  end;
  crd[4].X := crd[1].X;
  crd[4].Y := crd[1].Y;
  _cnv.Pen.Color := Triangle.Color;
  _cnv.Polyline(crd);
end;

procedure TPaintManager.Update;
begin
  _cnv.FillRect(rect(0, 0, _width, _height));
  PaintAllFigures;
end;

end.
