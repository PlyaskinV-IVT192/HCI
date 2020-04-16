unit U136E;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit136E, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
      ZapMas: TMenuItem;
        Hands: TMenuItem;
        Random: TMenuItem;
      Write: TMenuItem;
        WriteTxt: TMenuItem;
        WriteType: TMenuItem;
      Result: TMenuItem;
      Open: TMenuItem;
        OpenTxt: TMenuItem;
        OpenType: TMenuItem;
      Close: TMenuItem;
        CloseTxt: TMenuItem;
        CloseType: TMenuItem;
      Delete: TMenuItem;
      OpenDialog1: TOpenDialog;
    procedure OpenTxtClick(Sender: TObject);
    procedure CloseTxtClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure HandsClick(Sender: TObject);
    procedure WriteTxtClick(Sender: TObject);
    procedure ResultClick(Sender: TObject);
    procedure RandomClick(Sender: TObject);
    procedure OpenTypeClick(Sender: TObject);
    procedure CloseTypeClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  r: string;
  dm: DinMas;
  fDM: Tipfile;
  ftxt: text;

implementation

{$R *.dfm}

procedure TForm1.OpenTxtClick(Sender: TObject);
var  s:string;
begin
if not OpenDialog1.Execute then exit;
s:= OpenDialog1.FileName;
AssignFile(ftxt,s);
Append(ftxt);
end;

procedure TForm1.CloseTxtClick(Sender: TObject);
begin
CloseFile(ftxt);
end;

procedure TForm1.DeleteClick(Sender: TObject);
begin
SetLength(dm,0);
end;

procedure TForm1.HandsClick(Sender: TObject);
begin
ZapMassHand(dm);
end;

procedure TForm1.WriteTxtClick(Sender: TObject);
begin
WriteMassText(dm,ftxt);
end;

procedure TForm1.ResultClick(Sender: TObject);
begin
Obrabotka(dm,r);
WriteResText(r, ftxt);
end;

procedure TForm1.RandomClick(Sender: TObject);
begin
ZapMassRandom(dm);
end;

procedure TForm1.OpenTypeClick(Sender: TObject);
var  s:string;
begin
if not OpenDialog1.Execute then exit;
s:= OpenDialog1.FileName;
AssignFile(fDM,s);
Reset(fDM);
end;

procedure TForm1.CloseTypeClick(Sender: TObject);
begin
CloseFile(fDM);
end;

end.

