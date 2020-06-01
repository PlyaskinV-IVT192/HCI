unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    EditFam: TEdit;
    EditIm: TEdit;
    EditOtch: TEdit;
    EditGod: TEdit;
    EditData: TEdit;
    EditGoal: TEdit;
    EditNak: TEdit;
    OK: TButton;
    Cancel: TButton;
    LabelFam: TLabel;
    LabelIm: TLabel;
    LabelOtch: TLabel;
    LabelGod: TLabel;
    LabelData: TLabel;
    LabelGoal: TLabel;
    LabelNak: TLabel;
    procedure CancelClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses UK;

{$R *.dfm}

procedure TForm2.CancelClick(Sender: TObject);    //кнопка "отмена"
begin
Form2.Close;
end;

procedure TForm2.OKClick(Sender: TObject);      //кнопка "ОК"
var i, k, c: integer;
begin
Form1.SG.RowCount:= Form1.SG.RowCount + 1;
Form1.SG.Cells[1 ,Form1.SG.RowCount - 1]:= Form2.EditFam.Text;
Form1.SG.Cells[2 ,Form1.SG.RowCount - 1]:= Form2.EditIm.Text;
Form1.SG.Cells[3 ,Form1.SG.RowCount - 1]:= Form2.EditOtch.Text;
Form1.SG.Cells[4 ,Form1.SG.RowCount - 1]:= Form2.EditGod.Text;
Form1.SG.Cells[5 ,Form1.SG.RowCount - 1]:= Form2.EditData.Text;
Form1.SG.Cells[6 ,Form1.SG.RowCount - 1]:= Form2.EditGoal.Text;
Form1.SG.Cells[7 ,Form1.SG.RowCount - 1]:= Form2.EditNak.Text;
k:=0;
c:=0;
for i:= 1 to Form1.SG.RowCount - 1 do begin
k:= k + StrToInt(Form1.SG.Cells[6,i]);
c:= c + StrToInt(Form1.SG.Cells[7,i]);
end;
Form1.EditGoal.Text:= IntToStr(k);
Form1.EditNak.Text:= IntToStr(c);
Form1.EditIgrok.Text:= IntToStr(Form1.SG.RowCount - 1);
Form2.EditFam.Text:= '';
Form2.EditIm.Text:= '';
Form2.EditOtch.Text:= '';
Form2.EditGod.Text:= '';
Form2.EditData.Text:= '';
Form2.EditGoal.Text:= '';
Form2.EditNak.Text:= '';
Form2.Close;
end;

end.
