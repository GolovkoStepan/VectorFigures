unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ButtonGroup, FigureClass, Vcl.Tabs, Vcl.DockTabSet, Vcl.AppEvnts;

type
  TMainForm = class(TForm)
    PaintBox1: TPaintBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    ListBox1: TListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    TrackBar1: TTrackBar;
    Label4: TLabel;
    Button9: TButton;
    Button10: TButton;
    TrackBar2: TTrackBar;
    Label5: TLabel;
    Button11: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Button12: TButton;
    Panel4: TPanel;
    Button13: TButton;
    ListBox2: TListBox;
    ListBox3: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
  private
    procedure WMHotKey(var a:TWMHotKey);
    message WM_HOTKEY;
    procedure FillBGColors(LB: TListBox);
    procedure FillPеnColors(LB: TListbox);
    function GetColorByName(s: string): TColor;
    function GetNameByColor(cl: TColor): string;
    function GetItemIndexByName(name: string; lb: TListBox): integer;
  public

  end;

var
  MainForm: TMainForm;
  pm: TPaintManager;
  item_count: integer;
  selected: integer;

implementation

{$R *.dfm}

uses HotkeyInfo;

procedure TMainForm.Button10Click(Sender: TObject);
begin
  if selected <> -1 then
  begin
    pm.ItemsList[selected].Size := pm.ItemsList[selected].Size - trackbar1.Position;
    label10.Caption := inttostr(pm.ItemsList[selected].Size);
    pm.Update;
  end;
end;

procedure TMainForm.Button11Click(Sender: TObject);
var
  item: TFigure;
begin
  if selected <> -1 then
  begin
  if listbox1.Count <> 0 then
  begin
    pm.ItemsList.Delete(selected);
    listbox1.Items.Clear;
    item_count := 0;
    for item in pm.ItemsList do
    begin
      if item is TCircle then
      begin
        inc(item_count);
        listbox1.Items.Add('Круг ' + inttostr(item_count));
      end else
      if item is TStar then
      begin
        inc(item_count);
        listbox1.Items.Add('Звезда ' + inttostr(item_count));
      end else
      if item is TTriangle then
      begin
        inc(item_count);
        listbox1.Items.Add('Треугольник ' + inttostr(item_count));
      end else
      if item is TSquere then
      begin
        inc(item_count);
        listbox1.Items.Add('Квадрат ' + inttostr(item_count));
      end;
    end;
    label6.Caption := '';
    label8.Caption := '';
    label10.Caption := '';
    label12.Caption := '';
    if pm.ItemsList.Count > 0 then
    begin
      pm.ItemsList.Items[0].Checked := true;
      panel2.Enabled := true;
      listbox3.Enabled := true;
      pm.Update;
    end else
    begin
      panel2.Enabled := false;
      listbox3.Enabled := false;
      pm.Update;
      showmessage('В списке нет фигур для удаления.');
    end;
    listbox1.ItemIndex := 0;
    selected := 0;
  end;
  end;
end;

procedure TMainForm.Button12Click(Sender: TObject);
begin
  HotkeyInfoForm.Show;
end;

procedure TMainForm.Button13Click(Sender: TObject);
begin
  showmessage('Векторный графический редактор. Версия: 1.0 Разработал: Головко С.В. ПРО 209 сз');
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
  item: TFigure;
begin
  inc(item_count);
  listbox1.Items.Add('Звезда ' + inttostr(item_count));
  pm.ItemsList.Add(TStar.Create(PaintBox1.Width, Paintbox1.Height));
  for item in pm.ItemsList do
    item.Checked := false;
  pm.ItemsList.Items[pm.ItemsList.Count - 1].Checked := true;
  listbox1.ItemIndex := listbox1.Count - 1;
  selected := listbox1.Count - 1;
  pm.Update;
  panel2.Enabled := true;
  listbox3.Enabled := true;
end;

procedure TMainForm.Button2Click(Sender: TObject);
var
  item: TFigure;
begin
  inc(item_count);
  listbox1.Items.Add('Круг ' + inttostr(item_count));
  pm.ItemsList.Add(TCircle.Create(PaintBox1.Width, Paintbox1.Height));
  for item in pm.ItemsList do
    item.Checked := false;
  pm.ItemsList.Items[pm.ItemsList.Count - 1].Checked := true;
  listbox1.ItemIndex := listbox1.Count - 1;
  selected := listbox1.Count - 1;
  pm.Update;
  panel2.Enabled := true;
  listbox3.Enabled := true;
end;

procedure TMainForm.Button3Click(Sender: TObject);
var
  item: TFigure;
begin
  inc(item_count);
  listbox1.Items.Add('Квадрат ' + inttostr(item_count));
  pm.ItemsList.Add(TSquere.Create(PaintBox1.Width, Paintbox1.Height));
  for item in pm.ItemsList do
    item.Checked := false;
  pm.ItemsList.Items[pm.ItemsList.Count - 1].Checked := true;
  listbox1.ItemIndex := listbox1.Count - 1;
  selected := listbox1.Count - 1;
  pm.Update;
  panel2.Enabled := true;
  listbox3.Enabled := true;
end;

procedure TMainForm.Button4Click(Sender: TObject);
var
  item: TFigure;
begin
  inc(item_count);
  listbox1.Items.Add('Треугольник ' + inttostr(item_count));
  pm.ItemsList.Add(TTriangle.Create(PaintBox1.Width, Paintbox1.Height));
  for item in pm.ItemsList do
    item.Checked := false;
  pm.ItemsList.Items[pm.ItemsList.Count - 1].Checked := true;
  listbox1.ItemIndex := listbox1.Count - 1;
  selected := listbox1.Count - 1;
  pm.Update;
  panel2.Enabled := true;
  listbox3.Enabled := true;
end;

procedure TMainForm.Button5Click(Sender: TObject);
begin
  if selected <> -1 then
  begin
  if (pm.ItemsList[selected] is TSquere) and (pm.ItemsList[selected].X - pm.ItemsList[selected].Size * 1.5 >= 0) then
  begin
    pm.ItemsList[selected].X := pm.ItemsList[selected].X - 10;
    label8.Caption := inttostr(pm.ItemsList[selected].X) + ', ' + inttostr(pm.ItemsList[selected].Y);
    pm.Update;
  end;
  if not(pm.ItemsList[selected] is TSquere) and (pm.ItemsList[selected].X - pm.ItemsList[selected].Size - 10 >= 0) then
  begin
      pm.ItemsList[selected].X := pm.ItemsList[selected].X - 10;
      label8.Caption := inttostr(pm.ItemsList[selected].X) + ', ' + inttostr(pm.ItemsList[selected].Y);
      pm.Update;
  end;
  end;
end;

procedure TMainForm.Button6Click(Sender: TObject);
begin
  if selected <> -1 then
  begin
  if (pm.ItemsList[selected] is TSquere) and (pm.ItemsList[selected].Y - pm.ItemsList[selected].Size * 1.5 >= 0) then
  begin
    pm.ItemsList[selected].Y := pm.ItemsList[selected].Y - 10;
    label8.Caption := inttostr(pm.ItemsList[selected].X) + ', ' + inttostr(pm.ItemsList[selected].Y);
    pm.Update;
  end;
  if not(pm.ItemsList[selected] is TSquere) and (pm.ItemsList[selected].Y - pm.ItemsList[selected].Size - 10 >= 0) then
  begin
      pm.ItemsList[selected].Y := pm.ItemsList[selected].Y - 10;
      label8.Caption := inttostr(pm.ItemsList[selected].X) + ', ' + inttostr(pm.ItemsList[selected].Y);
      pm.Update;
  end;
  end;
end;

procedure TMainForm.Button7Click(Sender: TObject);
begin
  if selected <> -1 then
  begin
  if (pm.ItemsList[selected] is TSquere) and (pm.ItemsList[selected].Y + pm.ItemsList[selected].Size * 1.5 <= paintbox1.Height) then
  begin
    pm.ItemsList[selected].Y := pm.ItemsList[selected].Y + 10;
    label8.Caption := inttostr(pm.ItemsList[selected].X) + ', ' + inttostr(pm.ItemsList[selected].Y);
    pm.Update;
  end;
  if not(pm.ItemsList[selected] is TSquere) and (pm.ItemsList[selected].Y + pm.ItemsList[selected].Size + 10 <= paintbox1.Height) then
  begin
      pm.ItemsList[selected].Y := pm.ItemsList[selected].Y + 10;
      label8.Caption := inttostr(pm.ItemsList[selected].X) + ', ' + inttostr(pm.ItemsList[selected].Y);
      pm.Update;
  end;
  end;
end;

procedure TMainForm.Button8Click(Sender: TObject);
begin
  if selected <> -1 then
  begin
  if (pm.ItemsList[selected] is TSquere) and (pm.ItemsList[selected].X + pm.ItemsList[selected].Size * 1.5 <= paintbox1.Width) then
  begin
    pm.ItemsList[selected].X := pm.ItemsList[selected].X + 10;
    label8.Caption := inttostr(pm.ItemsList[selected].X) + ', ' + inttostr(pm.ItemsList[selected].Y);
    pm.Update;
  end;
  if not(pm.ItemsList[selected] is TSquere) and (pm.ItemsList[selected].X + pm.ItemsList[selected].Size + 10 <= paintbox1.Width) then
  begin
      pm.ItemsList[selected].X := pm.ItemsList[selected].X + 10;
      label8.Caption := inttostr(pm.ItemsList[selected].X) + ', ' + inttostr(pm.ItemsList[selected].Y);
      pm.Update;
  end;
  end;
end;

procedure TMainForm.Button9Click(Sender: TObject);
begin
  if selected <> -1 then
  begin
    if not(pm.ItemsList[selected] is TSquere)
        and (pm.ItemsList[selected].Size < pm.ItemsList[selected].X)
        and (pm.ItemsList[selected].Size < pm.ItemsList[selected].Y)
        and (paintbox1.Width - pm.ItemsList[selected].X >= pm.ItemsList[selected].Size)
        and (paintbox1.Height - pm.ItemsList[selected].Y >= pm.ItemsList[selected].Size)
      then
      begin
        pm.ItemsList[selected].Size := pm.ItemsList[selected].Size + trackbar1.Position;
        label10.Caption := inttostr(pm.ItemsList[selected].Size);
        pm.Update;
      end;
    if (pm.ItemsList[selected] is TSquere)
        and (pm.ItemsList[selected].Size * 1.5 < pm.ItemsList[selected].X)
        and (pm.ItemsList[selected].Size * 1.5 < pm.ItemsList[selected].Y)
        and (paintbox1.Width - pm.ItemsList[selected].X >= pm.ItemsList[selected].Size * 1.5)
        and (paintbox1.Height - pm.ItemsList[selected].Y >= pm.ItemsList[selected].Size * 1.5)
      then
      begin
        pm.ItemsList[selected].Size := pm.ItemsList[selected].Size + trackbar1.Position;
        label10.Caption := inttostr(pm.ItemsList[selected].Size);
        pm.Update;
      end;
  end;
end;

procedure TMainForm.FillBGColors(LB: TListBox);
begin
  lb.Items.Clear;
  lb.Items.Add('Красный');
  lb.Items.Add('Ярко-зелёный');
  lb.Items.Add('Жёлтый');
  lb.Items.Add('Синий');
  lb.Items.Add('Бирюзовый');
  lb.Items.Add('Серый');
end;

procedure TMainForm.FillPеnColors(LB: TListbox);
begin
  lb.Items.Clear;
  lb.Items.Add('Чёрный');
  lb.Items.Add('Белый');
  lb.Items.Add('Серебряный');
  lb.Items.Add('Фиолетовый');
  lb.Items.Add('Тёмно-красный');
  lb.Items.Add('Оливковый');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  application.Title := 'Графический редактор';
  selected := -1;
  panel2.Enabled := false;
  pm := TPaintManager.Create(PaintBox1.Canvas, PaintBox1.Width, Paintbox1.Height);
  button5.Caption := #9668;
  button6.Caption := ' ' + #9650;
  button7.Caption := ' ' + #9660;
  button8.Caption := ' ' + #9658;
  label6.Caption := '';
  label8.Caption := '';
  label10.Caption := '';
  label12.Caption := '';
  RegisterHotKey(Handle, 1, 0, VK_UP);
  RegisterHotKey(Handle, 2, 0, VK_DOWN);
  RegisterHotKey(Handle, 3, 0, VK_LEFT);
  RegisterHotKey(Handle, 4, 0, VK_RIGHT);
  RegisterHotKey(Handle, 5, 0, VK_DELETE);
  RegisterHotKey(Handle, 6, MOD_SHIFT, VK_UP);
  RegisterHotKey(Handle, 7, MOD_SHIFT, VK_DOWN);
  RegisterHotKey(Handle, 8, MOD_SHIFT, VK_LEFT);
  RegisterHotKey(Handle, 9, MOD_SHIFT, VK_RIGHT);
  RegisterHotKey(Handle, 10, MOD_ALT, VK_UP);
  RegisterHotKey(Handle, 11, MOD_ALT, VK_DOWN);
  RegisterHotKey(Handle, 12, MOD_SHIFT, $53);
  RegisterHotKey(Handle, 13, MOD_SHIFT, $52);
  RegisterHotKey(Handle, 14, MOD_SHIFT, $43);
  RegisterHotKey(Handle, 15, MOD_SHIFT, $54);
  FillBGCOlors(listbox2);
  FillPеnColors(listbox3);
  listbox3.Enabled := false;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(pm);
  UnregisterHotKey(Handle, 1);
  UnregisterHotKey(Handle, 2);
  UnregisterHotKey(Handle, 3);
  UnregisterHotKey(Handle, 4);
  UnregisterHotKey(Handle, 5);
  UnregisterHotKey(Handle, 6);
  UnregisterHotKey(Handle, 7);
  UnregisterHotKey(Handle, 8);
  UnregisterHotKey(Handle, 9);
  UnregisterHotKey(Handle, 10);
  UnregisterHotKey(Handle, 11);
  UnregisterHotKey(Handle, 12);
  UnregisterHotKey(Handle, 13);
  UnregisterHotKey(Handle, 14);
  UnregisterHotKey(Handle, 15);
end;

function TMainForm.GetColorByName(s: string): TColor;
begin
  if s = 'Красный' then
    result := clRed;
  if s = 'Ярко-зелёный' then
    result := clLime;
  if s = 'Жёлтый' then
    result := clYellow;
  if s = 'Синий' then
    result := clBlue;
  if s = 'Бирюзовый' then
    result := clAqua;
  if s = 'Серый' then
    result := clGray;
  if s = 'Чёрный' then
    result := clBlack;
  if s = 'Белый' then
    result := clWhite;
  if s = 'Серебряный' then
    result := clSilver;
  if s = 'Фиолетовый' then
    result := clFuchsia;
  if s = 'Тёмно-красный' then
    result := clMaroon;
  if s = 'Оливковый' then
    result := clOlive;
end;

function TMainForm.GetItemIndexByName(name: string; lb: TListBox): integer;
var
  i: integer;
begin
  for i := 0 to lb.Count - 1 do
    if lb.Items[i] = name then
      result := i;
end;

function TMainForm.GetNameByColor(cl: TColor): string;
begin
  if cl = clRed  then
    result := 'Красный';
  if cl = clLime then
    result := 'Ярко-зелёный';
  if cl = clYellow then
    result := 'Жёлтый';
  if cl = clBlue then
    result := 'Синий';
  if cl = clAqua then
    result := 'Бирюзовый';
  if cl = clGray then
    result := 'Серый';
  if cl = clBlack then
    result := 'Чёрный';
  if cl = clWhite then
    result := 'Белый';
  if cl = clSilver then
    result := 'Серебряный';
  if cl = clFuchsia then
    result := 'Фиолетовый';
  if cl = clMaroon then
    result := 'Тёмно-красный';
  if cl = clOlive then
    result := 'Оливковый';
end;

procedure TMainForm.ListBox1Click(Sender: TObject);
var
  item: TFigure;
begin
  selected := listbox1.ItemIndex;
  if selected <> -1 then
  begin
    if pm.ItemsList[selected] is TCircle then
    begin
      trackbar2.Visible := false;
      label5.Visible := false;
    end else
    begin
      trackbar2.Visible := true;
      label5.Visible := true;
    end;
    for item in pm.ItemsList do
      item.Checked := false;
    pm.ItemsList[selected].Checked := true;
    pm.Update;
    listbox3.ItemIndex := GetItemIndexByName(GetNameByColor(pm.ItemsList[selected].Color), listbox3);
    trackbar2.Position := pm.ItemsList[selected].Delta;
    label6.Caption := listbox1.Items[selected];
    label8.Caption := inttostr(pm.ItemsList[selected].X) + ', ' + inttostr(pm.ItemsList[selected].Y);
    label10.Caption := inttostr(pm.ItemsList[selected].Size);
    label12.Caption := inttostr(pm.ItemsList[selected].Delta);
  end;
end;

procedure TMainForm.ListBox2Click(Sender: TObject);
begin
  pm.ChangeColor(GetColorByName(listbox2.Items[listbox2.ItemIndex]));
end;

procedure TMainForm.ListBox3Click(Sender: TObject);
begin
  if selected <> -1 then
  begin
    pm.ItemsList[selected].Color := GetColorByName(listbox3.Items[listbox3.ItemIndex]);
    pm.Update;
  end;
end;

procedure TMainForm.TrackBar2Change(Sender: TObject);
begin
  if selected <> -1 then
  begin
    pm.ItemsList[selected].Delta := trackbar2.Position;
    label12.Caption := inttostr(pm.ItemsList[selected].Delta);
    pm.Update;
  end;
end;

procedure TMainForm.WMHotKey(var a: TWMHotKey);
var
  item: TFigure;
begin
  if (a.HotKey = 1) then
    Button6.Click;
  if (a.HotKey = 2) then
    Button7.Click;
  if (a.HotKey = 3) then
    Button5.Click;
  if (a.HotKey = 4) then
    Button8.Click;
  if (a.HotKey = 5) then
    Button11.Click;
  if (a.HotKey = 6) then
    Button9.Click; 
  if (a.HotKey = 7) then
    Button10.Click; 
  if (a.HotKey = 8) then
    trackbar2.Position := trackbar2.Position - 1;
  if (a.HotKey = 9) then
    trackbar2.Position := trackbar2.Position + 1;
  if (a.HotKey = 10) then
  begin
    listbox1.ItemIndex := listbox1.ItemIndex - 1;
    selected := listbox1.ItemIndex;
    if selected <> -1 then
    begin
      if pm.ItemsList[selected] is TCircle then
      begin
        trackbar2.Visible := false;
        label5.Visible := false;
      end else
      begin
        trackbar2.Visible := true;
        label5.Visible := true;
      end;
      for item in pm.ItemsList do
        item.Checked := false;
      pm.ItemsList[selected].Checked := true;
      pm.Update;
      listbox3.ItemIndex := GetItemIndexByName(GetNameByColor(pm.ItemsList[selected].Color), listbox3);
      trackbar2.Position := pm.ItemsList[selected].Delta;
      label6.Caption := listbox1.Items[selected];
      label8.Caption := inttostr(pm.ItemsList[selected].X) + ', ' + inttostr(pm.ItemsList[selected].Y);
      label10.Caption := inttostr(pm.ItemsList[selected].Size);
      label12.Caption := inttostr(pm.ItemsList[selected].Delta); 
    end;
  end;
  if (a.HotKey = 11) then
  begin
    listbox1.ItemIndex := listbox1.ItemIndex + 1; 
    selected := listbox1.ItemIndex;
    if selected <> -1 then
    begin
      if pm.ItemsList[selected] is TCircle then
      begin
        trackbar2.Visible := false;
        label5.Visible := false;
      end else
      begin
        trackbar2.Visible := true;
        label5.Visible := true;
      end;
      for item in pm.ItemsList do
        item.Checked := false;
      pm.ItemsList[selected].Checked := true;
      pm.Update;
      listbox3.ItemIndex := GetItemIndexByName(GetNameByColor(pm.ItemsList[selected].Color), listbox3);
      trackbar2.Position := pm.ItemsList[selected].Delta;
      label6.Caption := listbox1.Items[selected];
      label8.Caption := inttostr(pm.ItemsList[selected].X) + ', ' + inttostr(pm.ItemsList[selected].Y);
      label10.Caption := inttostr(pm.ItemsList[selected].Size);
      label12.Caption := inttostr(pm.ItemsList[selected].Delta); 
    end;   
  end;
  if (a.HotKey = 12) then
    Button1.Click;
  if (a.HotKey = 13) then
    Button3.Click;  
  if (a.HotKey = 14) then
    Button2.Click; 
  if (a.HotKey = 15) then
    Button4.Click;  
end;

end.
