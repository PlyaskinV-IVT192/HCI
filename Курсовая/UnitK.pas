unit UnitK;

interface
  uses SysUtils, Dialogs;

  type Football = record
       Fam, Im, Otch, God, Igra, Gol, Nak: string[20];
       end;
       PUzel = ^Zp2;
       Zp2 = record
       x: Football;
       next: PUzel;
       pred: PUzel;
       end;

   procedure WriteSpText(var f: PUzel;var ftxt:Text);
   procedure DelFirstElement(var f,a: PUzel);
   procedure DelSpisok(var f: PUzel);

implementation

  procedure WriteSpText(var f: PUzel; var ftxt:Text);
    var
      p: PUzel;
      s: string;
      y: Football;
    begin
      p:= f;
      while not(p = nil) do
        begin
          y:= p^.x;
          s:=y.Fam +' '+ y.Im +' '+ y.Otch +' '+ y.God +' Дата игры: '+ y.Igra +' Голов: '+ y.Gol +' Нарушений: '+ y.Nak;
          writeln(ftxt, s);
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

end.
