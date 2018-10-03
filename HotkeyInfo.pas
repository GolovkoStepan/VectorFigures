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
  label1.Caption := 'Up - �����' + #13#10 + 'Down - ����' + #13#10 + 'Left - �����' + #13#10 + 'Right - ������'
              + #13#10 + 'Shift + Up - ���������' + #13#10 + 'Shift + Down - ���������' + #13#10 + 'Shift + Left - ������� ������ �������'
              + #13#10 + 'Shift + Right - ������� �� �������' + #13#10 + 'Alt + Up - ��������� ������' + #13#10 + 'Alt + Down - ���������� ������'
              + #13#10 + 'Shift + T - ����� �����������' + #13#10 + 'Shift + S - ����� ������' + #13#10 + 'Shift + C - ����� ����'
              + #13#10 + 'Shift + R - ����� �������' + #13#10 + 'Del - ������� ������� ������';
end;

end.
