unit Unit506b;

interface

  uses SysUtils, Dialogs;
  type
    Bag = record
          Fam, Nam, Otch : string[20];
          ColV: byte;
          VesV: real;
          Npasp: string[20];
          end;
    PUzel = ^Zp2;
    Zp2 = record
          x: Bag;
          next: PUzel;
          pred: PUzel;
          end;
    FZap = file of Bag;
  procedure AddFirst(var f: PUzel; a: PUzel);
  procedure AddAfter(var old:PUzel; a: PUzel);
  procedure BuildSpTxt(var f: PUzel);
  procedure BuildSpTip(var f: PUzel; var ftip: FZap);
  procedure WriteSpText(var f: PUzel;var ftxt:Text);
  procedure WriteSpTip(var f: PUzel; var ftip: FZap);
  procedure DelFirstElement(var f,a: PUzel);
  procedure DelElement(var old,a: PUzel);
  procedure DelSpisok(var f: PUzel);
  procedure FindSRVBag(var f: PUzel; var ftxt: text);
  procedure Find2Bag(var f: PUzel; var ftxt: text);
  procedure AppUzels(var f: PUzel);
  function SRV (var f: PUzel): real;

implementation

  procedure AddFirst(var f: PUzel; a: PUzel);
    begin
      a^.next := f;
      if f<> nil then f^.pred := a;
      f:=a;
    end;

  procedure AddAfter(var old:PUzel; a: PUzel);
    begin
      a^.next := old^.next;
      old^.next := a;
      if a^.next <> nil then a^.next^.pred := a;
      a^.pred := old;
    end;

  procedure BuildSpTxt(var f: PUzel);
    var
      a,d :PUzel;
      ch: char;
    begin
      f:= nil;
      repeat
        new(a);
        with a^.x do
          begin
            Fam := InputBox('Введите фамилию',' ',' ');
            Nam := InputBox('Введите имя',' ',' ');
            Otch := InputBox('Введите отчество',' ',' ');
            Npasp:= InputBox('Введите серию и номер паспорта',' ',' ');
            ColV:= StrToInt(InputBox('Введите количество вещей',' ',' '));
            VesV:= StrToFloat(InputBox('Введите вес вещей',' ',' '));
          end;
        a^.next := nil;
        a^.pred := nil;
        if (f = nil) then
          begin
            AddFirst(f,a);
            d:= f;
          end
        else
          begin
            AddAfter(d,a);
            d := a;
          end;
        ch:= InputBox('Для завершения ввода нажмите Y',' ',' ')[1];
      until (ch = 'Y') or (ch ='y');
    end;

  procedure BuildSpTip(var f: PUzel; var ftip: FZap);
    var
      a:PUzel;
  begin
  seek (ftip, 0);
  while not(eof(ftip)) do
    begin
    new(a);
    read(ftip, a^.x);
    end;
  end;

  procedure WriteSpText(var f: PUzel; var ftxt:Text);
    var
      p: PUzel;
      s: string;
      y: Bag;
    begin
      p:= f;
      while not(p = nil) do
        begin
          y:= p^.x;
          s:=y.Fam +' ' + y.Nam +' '+ y.Otch + ' '+ y.Npasp +' '+IntToStr(y.ColV) + ' '+ FloatToStr(y.VesV);
          writeln(ftxt, s);
          p:= p^.next;
        end;
    end;

  procedure WriteSpTip(var f: PUzel; var ftip: FZap);
    var
      p: PUzel;
      y: Bag;
    begin
      p:= f;
      while not(p = nil) do
        begin
          y:= p^.x;
          write(ftip, y);
          p:= p^.next;
        end;
    end;

  procedure DelFirstElement(var f,a: PUzel);
    begin
      a := f;
      f := f^.next;
      a^.next := nil;
      if f<>nil then f^.pred := nil;
    end;

  procedure DelElement(var old,a: PUzel);
    begin
      if (old^.next = nil) then a:= nil
      else
        if (old^.next^.next = nil) then
          begin
            a := old^.next;
            a^.pred:= nil;
            old^.next:= nil;
          end
        else
          begin
            a := old^.next;
            old^.next := a^.next;
            old^.next^.pred:= old;
            a^.next := nil;
            a^.pred:= nil;
          end;
    end;

  procedure DelSpisok(var f: PUzel);
    var
      a: PUzel;
    begin
      while (f <> nil) do
        begin
          DelFirstElement(f,a);
          Dispose(a);
        end;
    end;

  function SRV (var f: PUzel): real;
    var
      p: PUzel;
      n: integer;
      c: integer;
    begin
      p:=f;
      n:=0;
      c:= StrToInt(InputBox('Введите число пассажиров','',''));
      while (p <> nil) do
        begin
          n:= n + p^.x.ColV;
          p:=p^.next;
        end;
      SRV:= n/c;                                                                           //средний вес вещей в списке
    end;

  procedure FindSRVBag(var f: PUzel; var ftxt: text);
    var
      p: PUzel;
      SRi, SR: real;
      Count: integer;
    begin
    Count:= 0;
      SR:= SRV(f);
      p:=f;
      while (p <> nil) do
        begin
          SRi:= p^.x.ColV;
          if(SRi > SR) then
            Count:= Count+1;
            p:= p^.next;
        end;
      ShowMessage('Число пассажиров, количество вещей которых превосходит среднее чило вещей: '+IntToStr(Count));
    end;

  procedure Find2Bag(var f: PUzel; var ftxt: text);
    var
      p: PUzel;
      SRi: real;
      Count: integer;
    begin
    Count:= 0;
      p:=f;
      while (p <> nil) do
        begin
          SRi:= p^.x.ColV;
          if(SRi > 2) then
            Count:= Count+1;
            p:= p^.next;
        end;
      ShowMessage('Число пассажиров, имеющих более двух вещей: '+IntToStr(Count));
    end;

  procedure AppUzels(var f: PUzel);
    var
      a,p,d: PUzel;
      i,n: byte;
    begin
      p:= f;
      while (p <> nil) do
        begin
          d:=p;
          p:= p^.next;
        end;
        n:= StrToInt(InputBox('Введите число вставляемых узлов',' ',' '));
        for i:=1 to n do
          begin
            new(a);
            with a^.x do
              begin
                Fam := InputBox('Введите фамилию',' ',' ');
                Nam := InputBox('Введите имя',' ',' ');
                Otch := InputBox('Введите отчество',' ',' ');
                Npasp:= InputBox('Введите серию и номер паспорта',' ',' ');
                ColV:= StrToInt(InputBox('Введите количество вещей',' ',' '));
                VesV:= StrToFloat(InputBox('Введите вес вещей',' ',' '));
              end;
            a^.next := nil;
            a^.pred := nil;
            AddAfter(d,a);
            d := a;
          end;
    end;

end.
