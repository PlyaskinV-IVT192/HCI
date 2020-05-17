unit unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, Grids, Logic;

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
    StringGrid1: TStringGrid;
    Ugol: TEdit;
    LUgol: TLabel;
    procedure FormCreate(Sender: TObject);
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
  fi, S: real;
  calculations: array [1..128] of Calculation;
  last_ind: integer;

implementation

{$R *.lfm}

{ TZ26 }
procedure TZ26.FormCreate(Sender: TObject);
begin
  last_ind := 0;
end;

procedure TZ26.ButtonClick(Sender: TObject);
var
last_calc: Calculation;
begin
DataFromForm();
S:= calc(fi);
last_calc.fi:=fi;
last_calc.S:=S;
inc(last_ind);
calculations[last_ind]:=last_calc;
StringGrid1.RowCount:= last_ind + 1;
StringGrid1.Cells[1, last_ind] := '13.7';
StringGrid1.Cells[2, last_ind] := floattostr(fi);
StringGrid1.Cells[3, last_ind] := floattostr(round(S*100)/100);
end;

procedure TZ26.HelpClick(Sender: TObject);
begin
ShowMessage('Программа находит площадь сектора, радиус которого равен 13.7, а дуга содержит заданное число радиан. Автор: Пляскин В. В.');
end;

procedure TZ26.OpenClick(Sender: TObject);
begin
if OpenDialog1.Execute then
begin
if OpenDialog1.FileName <> '' then
begin
load_params(fi, OpenDialog1.FileName);
Ugol.Text:= floattostr(fi);
end;
end;
end;

procedure TZ26.QuitClick(Sender: TObject);
begin
  close;
end;

procedure TZ26.SaveClick(Sender: TObject);
begin
if SaveDialog1.Execute then
if SaveDialog1.FileName <> '' then
begin
DataFromForm();
save_params(fi, SaveDialog1.FileName);
end;
end;

procedure TZ26.SaveResultClick(Sender: TObject);
begin
 //Memo.Lines.SaveToFile('Отчет.txt');
end;

procedure TZ26.DataFromForm();
begin
if TryStrToFloat(Ugol.Text, fi) = false then
begin
Ugol.Color:= clGradientActiveCaption;
ShowMessage('Неправильно введён параметр Fi');
exit;
end;
end;

end.

