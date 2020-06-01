program P531;

uses
  Forms,
  U531 in 'U531.pas' {Form1},
  UnitZ531 in 'UnitZ531.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
