program Lab_OOP_2;

uses
  Vcl.Forms,
  main in 'main.pas' {MainForm},
  FigureClass in 'FigureClass.pas',
  Vcl.Themes,
  Vcl.Styles,
  HotkeyInfo in 'HotkeyInfo.pas' {HotkeyInfoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(THotkeyInfoForm, HotkeyInfoForm);
  Application.Run;
end.
