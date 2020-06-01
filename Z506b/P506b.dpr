program P506b;

uses
  Forms,
  U506b in 'U506b.pas' {F506b},
  Unit506b in 'Unit506b.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TF506b, F506b);
  Application.Run;
end.
