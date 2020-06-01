unit UK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, UnitK, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Rec: TMenuItem;
    Help: TMenuItem;
    Save: TMenuItem;
    DelEl: TMenuItem;
    SG: TStringGrid;
    App: TMenuItem;
    LabelGoal: TLabel;
    EditGoal: TEdit;
    LabelNak: TLabel;
    EditNak: TEdit;
    LabelIgrok: TLabel;
    EditIgrok: TEdit;
    Copy: TMenuItem;
    procedure HelpClick(Sender: TObject);
    procedure AppClick(Sender: TObject);
    procedure DelElClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure FormCreate (Sender: TObject);
    procedure CopyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  PList: PUzel;
  ftxt: text;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.FormCreate (Sender: TObject);     //�������� �������
begin
SG.Cells[1, 0] := '�������';
SG.Cells[2, 0] := '���';
SG.Cells[3, 0] := '��������';
SG.Cells[4, 0] := '��� ��������';
SG.Cells[5, 0] := '���� ����';
SG.Cells[6, 0] := '����';
SG.Cells[7, 0] := '���������';
end;

procedure TForm1.HelpClick(Sender: TObject);     //�������
begin
ShowMessage ('���������, � ������� ��������� ���� ������, ���������� �������� �� ������� ���������� �������. � �������� ������: �.�.�. ������, ��� ��������, ���� ����, ���������� ������� �����, ���������.');
end;

procedure TForm1.AppClick(Sender: TObject);     //�������� �������
begin
Form2.Show;
end;

procedure TForm1.DelElClick(Sender: TObject);    //������� �������
var n, i, k, c: integer;
begin
  n:= StrToInt(InputBox('����� ��������','',''));
  for n:= n to SG.RowCount - 1 do
  for i:= 1 to 7 do
  SG.Cells[i, n]:= SG.Cells[i, n + 1];
  SG.RowCount:= SG.RowCount - 1;
  k:=0;
  c:=0;
  for i:= 1 to SG.RowCount - 1 do begin
  k:= k + StrToInt(SG.Cells[6,i]);
  c:= c + StrToInt(SG.Cells[7,i]);
  end;
  EditGoal.Text:= IntToStr(k);
  EditNak.Text:= IntToStr(c);
  EditIgrok.Text:= IntToStr(SG.RowCount - 1);
end;

procedure TForm1.SaveClick(Sender: TObject);     //��������� �� � ��������� ����
var i: integer;
begin
  PList:= nil;
  writeln(ftxt, '������ �� �������:');
  for i:= 1 to SG.RowCount - 1 do begin
  new(PList);
    PList^.x.Fam := SG.Cells[1,i];
    PList^.x.Im := SG.Cells[2,i];
    PList^.x.Otch := SG.Cells[3,i];
    PList^.x.God := SG.Cells[4,i];
    PList^.x.Igra := SG.Cells[5,i];
    PList^.x.Gol := SG.Cells[6,i];
    PList^.x.Nak := SG.Cells[7,i];
    PList^.next := nil;
    PList^.pred := PList;
    WriteSpText(PList,ftxt);
  end;
end;

procedure TForm1.CopyClick(Sender: TObject);     //����������� �������
var n, i, j, k, c: integer;
begin
  n:= StrToInt(InputBox('������� ����� ����������� ��������','',''));
  SG.RowCount:= SG.RowCount + 1;
  for j:= SG.RowCount - 1 to SG.RowCount - 1 do begin
  for i:= 1 to 7 do
  SG.Cells[i,j]:= SG.Cells[i,n];
  end;
  k:=0;
  c:=0;
  for i:= 1 to SG.RowCount - 1 do begin
  k:= k + StrToInt(SG.Cells[6,i]);
  c:= c + StrToInt(SG.Cells[7,i]);
  end;
  EditGoal.Text:= IntToStr(k);
  EditNak.Text:= IntToStr(c);
  EditIgrok.Text:= IntToStr(SG.RowCount - 1);
end;

initialization

  AssignFile(ftxt,'TK.txt');
  Append(ftxt);

finalization

  Closefile(ftxt);
  DelSpisok(PList);

end.
