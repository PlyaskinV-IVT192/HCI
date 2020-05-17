unit Logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  Calculation = record
    fi, r: Real;
    S: Real;
  end;


  function calc(fi: Real): real;
  procedure save_params(Fi: Real; filename: string);
  procedure load_params(var Fi: Real; filename: string);

implementation

  function calc(fi: Real): real;
  var r, s: real;
  begin
  r:=13.7;
  s := (r * r * fi) / 2;
  calc:=s;
  end;

  procedure save_params(fi: Real; filename: string);
  var
    f: text;
  begin
       assign(f, filename);
       rewrite(f);
       writeln(f, fi);
       close(f);
  end;

  procedure load_params(var fi: Real; filename: string);
  var
    f: text;
  begin
      assign(f, filename);
      reset(f);
      readln(f, fi);
      close(f);
  end;

end.

