unit UnitZ531;

interface

uses SysUtils, Dialogs;

  type
   PUzel = ^Zp2;
   Zp2 = record
         x: real;
         next: PUzel;
        end;
   FZap = file of real;
   procedure AddFirst(var f: PUzel; a: PUzel);
   procedure AddAfter(var old:PUzel; a: PUzel);
   procedure BuildSpisok(var f: PUzel);
   procedure NewSpisok(var f: PUzel; var fn: PUzel);
   procedure DelFirstElement(var f,a: PUzel);
   procedure DelElement(var old,a: PUzel);
   procedure DelSpisok(var f: PUzel);
   function EndElemSp(var f: PUzel):real;

implementation
  procedure AddFirst(var f: PUzel; a: PUzel);
    begin
     a^. next := f;
     f :=a;
     end;

  procedure AddAfter(var old:PUzel; a: PUzel);
    begin
     a^.next := old^.next;
     old^.next := a;
    end;

  procedure BuildSpisok(var f: PUzel);
    var
     a,d :PUzel;
     i : integer;
    begin
    randomize;
     f:= nil;
     for i:= 1 to 105 do begin
      new(a);
      a^.x := -10 + random (21);
      a^.next := nil;
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
         end;
    end;

  procedure NewSpisok(var f: PUzel; var fn: PUzel);
    var
      xn: real;
      p,a,d: PUzel;
    begin
      xn := EndElemSp(f);
      p:= f;
      fn:=nil;
      new(a);
      a^.x := p^.x - xn;
      AddFirst(fn,a);
      d:= fn;
      p:= p^.next;
     while not(p^.next = nil) do
      begin
        new(a);
        a^.x := p^.x - xn;
        AddAfter(d,a);
        d := a;
        p:=p^.next;
      end;
    end;

function EndElemSp(var f: PUzel):real;
     var
      p: PUzel;
     begin
      p:= f;
      while not(p = nil) do
       begin
         if (p^.next = nil) then Result:= p^.x;
         p:=p^.next;
       end;
     end;

  procedure DelFirstElement(var f,a: PUzel);
    begin
      a := f;
      f := f^.next;
      a^.next := nil;
    end;

   procedure DelElement(var old,a: PUzel);
    begin
     a := old^.next;
     old^.next := a^.next;
     a^.next := nil;
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
