program zad2_1;

const
  n = 6;
  m = 8;

var
  a: array[1..n, 1..m] of integer;
  b: array[1..n] of integer;

procedure fillArray;
var
  i, j: integer;
begin
  randomize;
  for i := 1 to n do
    for j := 1 to m do
      a[i, j] := random(21) - 10;
end;

procedure printArray2D;
var
  i, j: integer;
begin
  writeln('Двумерный массив:');
  for i := 1 to n do
  begin
    for j := 1 to m do
      write(a[i, j]:4);
    writeln;
  end;
end;

procedure createArrayB;
var
  i, j: integer;
  found: boolean;
begin
  for i := 1 to n do
  begin
    found := false;
    b[i] := 0;
    
    for j := 1 to m do
      if abs(a[i, j]) > 4 then
      begin
        b[i] := a[i, j];
        found := true;
        break;
      end;
  end;
end;

procedure printArray1D;
var
  i: integer;
begin
  writeln('Одномерный массив:');
  for i := 1 to n do
    write(b[i]:4);
  writeln;
end;

begin
  fillArray; 
  printArray2D; 
  createArrayB; 
  printArray1D; 
end.