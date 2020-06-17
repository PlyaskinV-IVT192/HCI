unit logic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;

type calculation = record
  x, y, z: real;
  a, b: real;
  end;

  function calc_a(x, y, z: real):real;
  function calc_b(x, y, z: real):real;
  procedure save_params(x, y, z: real; filename: string);
  procedure load_params(var x, y, z: real; filename: string);

implementation

 function calc_a(x, y, z: real):real;
 var a: real;
 begin
   a:=(3 + Exp(y - 1))/(1 + x * x * Abs(y - Sin(z)/Cos(z)));
   result:= a;
 end;

 function calc_b(x, y, z: real):real;
 var b: real;
 begin
   b:= 1 + Abs(y - x) + Power(y - x, 2)/2 + Power(Abs(x - y), 3)/3;
   result:= b;
 end;

 procedure save_params(x, y, z: real; filename: string);
  var
    f: text;
  begin
       assign(f, filename);
       rewrite(f);
       writeln(f, x);
       writeln(f, y);
       writeln(f, z);
       close(f);
  end;

 procedure load_params(var x, y, z: real; filename: string);
  var
    f: text;
  begin
      assign(f, filename);
      reset(f);
      readln(f, x);
      readln(f, y);
      readln(f, z);
      close(f);
  end;

end.

