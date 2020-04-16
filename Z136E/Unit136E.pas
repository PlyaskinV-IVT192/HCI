unit Unit136E;

interface
uses SysUtils, Dialogs;
type
  DinMas = array of integer;
  Tipfile = file of integer;
procedure ZapMassHand(var a: DinMas);
procedure ZapMassRandom(var a: DinMas);
procedure WriteMassText(var a: DinMas; var f: text);
procedure Obrabotka(var a: DinMas; var r: string);
procedure WriteResText(var r: string; var f: text);
procedure WriteMassType(var a: DinMas; var f: text);

implementation
procedure ZapMassHand(var a: DinMas);
  var
    n,i : word;
    k: string[10];
  begin
    n:= StrToInt(InputBox('Количество элементов в массиве ',' ',' '));
    SetLength(a,n);
    for i:=0 to n-1 do
      begin
        k:= IntToStr(i);
        a[i]:= StrToInt(Inputbox('Введите ' + k + '-й элемент',' ',' '));
      end;
  end;
procedure WriteMassText(var a: DinMas; var f: text);
  var
    n,i: integer;
  begin
    n:= StrToInt(InputBox('Введите количество элементов в строке ',' ',' '));
    writeln(f, 'Заданный массив');
    write(f, a[0]:5,'  ');
    for i:=1 to High(a) do
      if (i mod n = 0) then writeln(f, a[i]:5)
      else write(f, a[i]:5,'  ');
    writeln(f,' ');
  end;
procedure Obrabotka(var a: DinMas; var r: string);
  var
    n, i, s, p: integer;
    sum, pr: string;
  begin
    s:=0;
    p:=1;
    n:= StrToInt(InputBox('Количество элементов в массиве ',' ',' '));
    SetLength(a,n);
    for i:= 0 to n-1 do
      begin
        s:= s + a[i];
        p:= p * a[i];
      end;
    sum:=IntToStr(s);
    pr:=IntToStr(p);
    r:='Сумма элементов равна: '+sum+'; Произведение элементов равно: '+pr;
  end;
procedure WriteResText(var r: string; var f: text);
  var
    i: integer;
  begin
    writeln(f, 'Результат:');
    write(f, r);
    writeln(f,' ');
  end;
procedure ZapMassRandom(var a: DinMas);
var
    n,i : word;
  begin
    randomize;
    n:= StrToInt(InputBox('Количество элементов в массиве ',' ',' '));
    SetLength(a,n);
    for i:=0 to n-1 do
        a[i]:=-50 + random(101);
  end;
procedure WriteMassType(var a: DinMas; var f: text);
  var
    n,i: integer;
  begin
    n:= StrToInt(InputBox('Введите количество элементов в строке ',' ',' '));
    write(f, 'Заданный массив');
    write(f, a[0]:5,'  ');
    for i:=1 to High(a) do
      if (i mod n = 0) then write(f, a[i]:5)
      else write(f, a[i]:5,'  ');
    write(f,' ');
  end;

end.
