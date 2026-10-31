program zad1_2;

var 
  n, i: integer;            // глобальные переменные
  arr: array of real;       // глобальный массив

procedure FindMax(
  a: array of real;         // формальный параметр, передача по значению
  var maxVal: real;         // формальный параметр, передача по ссылке
  var maxIndex: integer     // формальный параметр, передача по ссылке
);
var
  i: integer;               // локальная переменная процедуры
begin
  maxVal := a[0];
  maxIndex := 0;
  
  for i := 1 to High(a) do
    if a[i] > maxVal then
    begin
      maxVal := a[i];
      maxIndex := i;
    end;
end;

procedure FindMinAbs(
  a: array of real;         // формальный параметр, передача по значению
  var minAbsVal: real;      // формальный параметр, передача по ссылке
  var minAbsIndex: integer  // формальный параметр, передача по ссылке
);
var
  i: integer;               // локальная переменная процедуры
begin
  minAbsVal := abs(a[0]);
  minAbsIndex := 0;
  
  for i := 1 to High(a) do
    if abs(a[i]) < minAbsVal then
    begin
      minAbsVal := abs(a[i]);
      minAbsIndex := i;
    end;
  
  minAbsVal := a[minAbsIndex];
end;

procedure FindMaxNegative(
  a: array of real;         // формальный параметр, передача по значению
  var maxNegVal: real;      // формальный параметр, передача по ссылке
  var maxNegIndex: integer  // формальный параметр, передача по ссылке
);
var
  i: integer;               // локальная переменная процедуры
  found: boolean;           // локальная переменная процедуры
begin
  found := false;
  maxNegIndex := -1;
  
  for i := 0 to High(a) do
    if a[i] < 0 then
    begin
      maxNegVal := a[i];
      maxNegIndex := i;
      found := true;
      break;
    end;
  
  if found then
    for i := maxNegIndex + 1 to High(a) do
      if (a[i] < 0) and (a[i] > maxNegVal) then
      begin
        maxNegVal := a[i];
        maxNegIndex := i;
      end;
  
  if not found then
    maxNegVal := 0;
end;

var
  maxVal, minAbsVal, maxNegVal: real;        // глобальные переменные основной программы
  maxIndex, minAbsIndex, maxNegIndex: integer; // глобальные переменные основной программы
begin
  write('Введите размер массива: ');
  readln(n);
  
  SetLength(arr, n);
  
  writeln('Введите элементы массива:');
  for i := 0 to n - 1 do
    read(arr[i]);
  
  //ФАКТИЧЕСКИЕ ПАРАМЕТРЫ
  FindMax(arr, maxVal, maxIndex);         // фактические параметры
  writeln('Максимальный элемент: ', maxVal:0:2, ' с индексом ', maxIndex);
  
  FindMinAbs(arr, minAbsVal, minAbsIndex); // фактические параметры
  writeln('Минимальный по модулю элемент: ', minAbsVal:0:2, ' с индексом ', minAbsIndex);
  
  FindMaxNegative(arr, maxNegVal, maxNegIndex); // фактические параметры
  if maxNegIndex <> -1 then
    writeln('Максимальный отрицательный элемент: ', maxNegVal:0:2, ' с индексом ', maxNegIndex)
  else
    writeln('Отрицательных элементов нет');
end.