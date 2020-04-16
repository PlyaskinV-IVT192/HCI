unit unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls;

type

  { TZ26 }

  TZ26 = class(TForm)
    Button: TButton;
    Image: TImage;
    MainMenu1: TMainMenu;
    FileMenu: TMenuItem;
    Help: TMenuItem;
    Open: TMenuItem;
    Save: TMenuItem;
    SaveResult: TMenuItem;
    N1: TMenuItem;
    Quit: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Ugol: TEdit;
    LUgol: TLabel;
    Memo: TMemo;
    procedure ButtonClick(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure QuitClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SaveResultClick(Sender: TObject);
    procedure DataFromForm();
  private

  public

  end;

var
  Z26: TZ26;
  f: real;

implementation

{$R *.lfm}

{ TZ26 }

procedure TZ26.ButtonClick(Sender: TObject);
var
  s, f, r: real;
begin
  DataFromForm();
  r:=13.7;
  f:=StrToFloat(Ugol.Text);
  s := (r * r * f) / 2;
  Memo.Lines.Add('При F= '+FloatToStr(f)+' Площадь равна - '+FloatToStr(round(s*100)/100));
end;

procedure TZ26.HelpClick(Sender: TObject);
begin
ShowMessage('Программа находит площадь сектора, радиус которого равен 13.7, а дуга содержит заданное число радиан. Автор: Пляскин В. В.');
end;

procedure TZ26.OpenClick(Sender: TObject);
var f:textfile;
  FName, s: string;
begin
if OpenDialog1.Execute then
begin
FName:= OpenDialog1.FileName;
AssignFile(f,FName);
Reset(f);
readln(f,s);
Ugol.Text:=s;
end;
closeFile(f);
end;

procedure TZ26.QuitClick(Sender: TObject);
begin
  close;
end;

procedure TZ26.SaveClick(Sender: TObject);
var f: textfile;
  FName, s: string;
begin
if SaveDialog1.Execute then
FName := SaveDialog1.FileName;
AssignFile(f,FName);
Rewrite(f);
s:=Ugol.Text;
writeln(f,s);
closeFile(f);
end;

procedure TZ26.SaveResultClick(Sender: TObject);
begin
  Memo.Lines.SaveToFile('Отчет.txt');
end;

procedure TZ26.DataFromForm();
begin
  if TryStrToFloat(Ugol.Text, f) = false then
    begin
    Ugol.Color:= clGradientActiveCaption;
    ShowMessage('Неправильно введён параметр F');
    exit;
    end;
end;


end.

