unit U531;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitZ531, Menus, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Build: TMenuItem;
    Delete: TMenuItem;
    OpenTxtFile: TMenuItem;
    CloseTxtFile: TMenuItem;
    WriteSpTextFile: TMenuItem;
    OpenDialog1: TOpenDialog;
    BuildSp1: TMenuItem;
    BuildSp2: TMenuItem;
    EndElem: TMenuItem;
    DeleteSp1: TMenuItem;
    DeleteSp2: TMenuItem;
    Image1: TImage;
    procedure OpenTxtFileClick(Sender: TObject);
    procedure CloseTxtFileClick(Sender: TObject);
    procedure WriteSpTextFileClick(Sender: TObject);
    procedure BuildSp1Click(Sender: TObject);
    procedure BuildSp2Click(Sender: TObject);
    procedure EndElemClick(Sender: TObject);
    procedure DeleteSp1Click(Sender: TObject);
    procedure DeleteSp2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Sp1,Sp2: PUzel;
  ftxt: text;

implementation

{$R *.dfm}

procedure TForm1.OpenTxtFileClick(Sender: TObject);
var
 s: string;
begin
 if not OpenDialog1.Execute then exit;
 s := OpenDialog1.FileName;
 AssignFile(ftxt,s);
 Append(ftxt);
end;

procedure TForm1.CloseTxtFileClick(Sender: TObject);
begin
CloseFile(ftxt);
end;

procedure TForm1.WriteSpTextFileClick(Sender: TObject);
 var
  n, i: integer;
  p: PUzel;
begin
  n:= StrToInt(InputBox('Для нач-го списка n=1, для результата n=2',' ',' '));
  if (n=1) then p:=Sp1 else p:=Sp2;
  if (n = 1) then writeln(ftxt,'Begin spisok')
           else writeln(ftxt,'Rezult spisok');
  while not (p = nil) do
   begin
   for i:= 1 to 7 do begin
    write(ftxt, p^.x:5:2,'  ');
    p:= p^.next;
    if p = nil then break;
    end;
    writeln(ftxt,'');
   end;
end;

procedure TForm1.BuildSp1Click(Sender: TObject);
begin
BuildSpisok(Sp1);
end;

procedure TForm1.BuildSp2Click(Sender: TObject);
begin
NewSpisok(Sp1,Sp2);
end;

procedure TForm1.EndElemClick(Sender: TObject);
var n: real;
begin
 n:= EndElemSp(Sp1);
 ShowMessage('n=' + FloatToStr(n));
end;

procedure TForm1.DeleteSp1Click(Sender: TObject);
begin
  DelSpisok(Sp1);
end;

procedure TForm1.DeleteSp2Click(Sender: TObject);
begin
DelSpisok(Sp2);
end;

end.
