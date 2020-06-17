unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls, logic;

type

  { TZ11b }

  TZ11b = class(TForm)
    Button: TButton;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Memo: TMemo;
    FileMenu: TMenuItem;
    Help: TMenuItem;
    Open: TMenuItem;
    FOpenDialog: TOpenDialog;
    Save: TMenuItem;
    FSaveDialog: TSaveDialog;
    SaveResult: TMenuItem;
    N1: TMenuItem;
    Quit: TMenuItem;
    XE: TEdit;
    YE: TEdit;
    ZE: TEdit;
    XL: TLabel;
    YL: TLabel;
    ZL: TLabel;
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
  Z11b: TZ11b;
  x, y, z: real;

implementation

{$R *.lfm}

{ TZ11b }

procedure TZ11b.ButtonClick(Sender: TObject);
var a, b: real;
begin
DataFromForm();
a:= calc_a(x, y, z);
b:= calc_b(x, y, z);
Memo.Lines.Add('При X= '+FloatToStr(x)+', Y= '+FloatToStr(y)+', Z= '+FloatToStr(z)+', A= '+FloatToStr(round(a*100)/100)+', B= '+FloatToStr(round(b*100)/100));
end;

procedure TZ11b.HelpClick(Sender: TObject);
begin
ShowMessage('Программа считает A и B, используя X, Y, Z, по формулам. Автор: Пляскин В. В.');
end;

procedure TZ11b.OpenClick(Sender: TObject);
begin
if FSaveDialog.Execute then
begin
if FSaveDialog.FileName <> '' then
begin
load_params(x, y, z, FSaveDialog.FileName);
XE.Text:= FloatToStr(x);
YE.Text:= FloatToStr(y);
ZE.Text:= FloatToStr(z);
end;
end;
end;

procedure TZ11b.QuitClick(Sender: TObject);
begin
 close;
end;

procedure TZ11b.SaveClick(Sender: TObject);
begin
if FSaveDialog.Execute then
        if FSaveDialog.FileName <> '' then
        begin
          DataFromForm();
          save_params(x, y, z, FSaveDialog.FileName);
          end;
end;

procedure TZ11b.SaveResultClick(Sender: TObject);
begin
  Memo.Lines.SaveToFile('Result.txt');
end;

procedure TZ11b.DataFromForm();
begin
  if TryStrToFloat(XE.Text, x) = false then
     begin
     XE.Color:= clGradientActiveCaption;
     ShowMessage('Неправильно введён параметр X');
     exit;
     end
  else XE.Color:= clDefault;

  if TryStrToFloat(YE.Text, y) = false then
     begin
      YE.Color:= clGradientActiveCaption;
      ShowMessage('Неправильно введён параметр Y');
      exit;
      end
  else YE.Color:= clDefault;

  if TryStrToFloat(ZE.Text, z) = false then
      begin
      ZE.Color:= clGradientActiveCaption;
      ShowMessage('Неправильно введён параметр Z');
      exit;
      end
  else ZE.Color:= clDefault;
end;

end.

