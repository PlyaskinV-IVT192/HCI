unit U506b;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit506b, Menus;

type
  TF506b = class(TForm)
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    MFile: TMenuItem;
    OpenTxtFile: TMenuItem;
    CloseTxtFile: TMenuItem;
    List: TMenuItem;
    Build: TMenuItem;
    SaveList: TMenuItem;
    Delete: TMenuItem;
    DeleteList: TMenuItem;
    FindBag: TMenuItem;
    FindBag2: TMenuItem;
    Help: TMenuItem;
    AddUzels: TMenuItem;
    BuildFromFile: TMenuItem;
    BuildList: TMenuItem;
    SaveListTxt: TMenuItem;
    SaveListTip: TMenuItem;
    procedure OpenTxtFileClick(Sender: TObject);
    procedure CloseTxtFileClick(Sender: TObject);
    procedure DeleteListClick(Sender: TObject);
    procedure SaveListTxtClick(Sender: TObject);
    procedure SaveListTipClick(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure FindBagClick(Sender: TObject);
    procedure FindBag2Click(Sender: TObject);
    procedure AddUzelsClick(Sender: TObject);
    procedure BuildListClick(Sender: TObject);
    procedure BuildFromFileClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F506b: TF506b;
  PList: PUzel;
  ftxt: text;
  ftip: FZap;

implementation

{$R *.dfm}

procedure TF506b.OpenTxtFileClick(Sender: TObject);
var
  s: string;
begin
  if not OpenDialog1.Execute then exit;
  s := OpenDialog1.FileName;
  AssignFile(ftxt,s);
  Append(ftxt);
end;

procedure TF506b.CloseTxtFileClick(Sender: TObject);
begin
  CloseFile(ftxt);
end;

procedure TF506b.DeleteListClick(Sender: TObject);
begin
  DelSpisok(PList);
end;

procedure TF506b.HelpClick(Sender: TObject);
begin
ShowMessage('ѕрогорамма находит число пассажиров, имеющих более двух вещей, и число пассажиров, количество вещей которых превосходит среднее чило вещей.');
end;

procedure TF506b.FindBagClick(Sender: TObject);
begin
Find2Bag(PList, ftxt);
end;

procedure TF506b.FindBag2Click(Sender: TObject);
begin
FindSRVBag (PList, ftxt);
end;

procedure TF506b.AddUzelsClick(Sender: TObject);
begin
AppUzels(PList);
end;

procedure TF506b.BuildListClick(Sender: TObject);
begin
  BuildSpTxt(PList);
end;

procedure TF506b.BuildFromFileClick(Sender: TObject);
begin
  BuildSpTip (Plist,ftip);
end;

procedure TF506b.SaveListTxtClick(Sender: TObject);
begin
  writeln(ftxt,'—одержимое двусв€занного списка ');
  WriteSpText(PList,ftxt);
  writeln(ftxt,' ')
end;

procedure TF506b.SaveListTipClick(Sender: TObject);
begin
WriteSpTip(PList,ftip);
end;

initialization
  AssignFile(ftxt,'T506b.txt');
  Append(ftxt);
  AssignFile(ftip,'Tip506b.dat');
  Reset(ftip);

finalization
  Closefile(ftxt);
  Closefile(ftip);
  DelSpisok(PList);

end.
