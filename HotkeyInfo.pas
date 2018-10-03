unit HotkeyInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  THotkeyInfoForm = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HotkeyInfoForm: THotkeyInfoForm;

implementation

{$R *.dfm}

procedure THotkeyInfoForm.FormCreate(Sender: TObject);
begin
  label1.Caption := 'Up - Вверх' + #13#10 + 'Down - Вниз' + #13#10 + 'Left - Влево' + #13#10 + 'Right - Вправо'
              + #13#10 + 'Shift + Up - Увеличить' + #13#10 + 'Shift + Down - Уменьшить' + #13#10 + 'Shift + Left - Крутить против часовой'
              + #13#10 + 'Shift + Right - Крутить по часовой' + #13#10 + 'Alt + Up - Следующая фигура' + #13#10 + 'Alt + Down - Предыдущая фигура'
              + #13#10 + 'Shift + T - Новый треугольник' + #13#10 + 'Shift + S - Новая звезда' + #13#10 + 'Shift + C - Новый круг'
              + #13#10 + 'Shift + R - новый квадрат' + #13#10 + 'Del - Удалить текущую фигуру';
end;

end.
