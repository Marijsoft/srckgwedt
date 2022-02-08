unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.StdCtrls, fgint;
// libreria richiesta https://github.com/SnakeDoctor/FGInt

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function ricvfisso1: dword;
begin
  result := ($3B9AC9FF + 1) - $3B6ADA29;
end;

function ricvfisso2: dword;
begin
  result := (3 * 11) + 4;
end;

function CalcVal1(s: string): int64;
var
  i, l, y: int64;
  x: integer;
begin
  i := ricvfisso1;
  i := trunc(i / 3);
  l := length(s);
  i := i + ((l * l) * 13);
  x := 13;
  for l := 1 to length(s) do
  begin
    dec(x);
    y := ord(s[l]);
    i := i + ((y * y) * x);
  end;
  i := (i mod ricvfisso1);
  if (i >= $6F) then
    result := i
  else
    result := 11;
end;

function CalcVal2(x: int64): int64;
var
  i, y: int64;
begin
  i := ricvfisso1;
  y := x * x;
  y := y + x;
  y := y + 1;
  i := y mod i;
  if (i >= $11) then
    result := i
  else
    result := 13;
end;

function CalcVal3(s: string; r0: int64): int64;
var
  i, l, y: int64;
  x: integer;
begin
  i := ricvfisso1;
  i := trunc(i / 11);
  x := 33;
  for l := 1 to length(s) do
  begin
    y := ord(s[l]);
    if (y <> $20) then
    begin
      x := -x;
      i := i + ((y * y) * x);
    end;
  end;
  i := abs(i);
  i := (i mod ricvfisso1);
  if (i >= $63) then
    result := i
  else
    result := $1A0A;
  result := result mod r0;
end;

function CalcCRCVal1(s: string): dword;
var
  i, l, x, y: int64;
  r0, r1, r2, r3, r4, mkey, r5: int64;
  i0, i1: integer;
  r6: uint64;
begin
  result := 0;
  i := ricvfisso1;
  r0 := trunc(i / 2);
  r1 := CalcVal1(s);
  x := 2;
  for l := 1 to length(s) do
  begin
    r2 := CalcVal2(x);
    r2 := r2 + 1;
    r2 := r2 + ((x * $AC1) mod $E7B5);
    r2 := r2 * ord(s[l]);
    r1 := r2 + r1;
    if (s[l] <> ' ') then
    begin
      i1 := ord(uppercase(s)[l]);
      inc(x);
      r0 := r0 + ((((x * $AC1) mod $E7B5) + 1) * i1);
    end;
  end;
  i := ricvfisso1;
  r1 := (r1 mod i);
  r0 := (r0 mod i);
  if (r0 = r1) then
    r1 := r1 + CalcVal2(r1);
  mkey := r1;
  r0 := (r1 mod i);
  if (r0 = mkey) then
  begin
    result := mkey;
  end;
end;

function CalcCRCVal2(s: string): dword;
var
  i, l, x, y: int64;
  r0, r1, r2, r3, r4, mkey, r5: int64;
  i0, i1: integer;
  r6: uint64;
begin
  result := 0;
  r0 := ricvfisso2;
  mkey := CalcVal3(s, r0);
  mkey := (mkey mod r0);
  r2 := CalcVal3(s, r0);
  r3 := (r2 mod r0);
  if (r3 = mkey) then
  begin
    result := mkey;
  end;
end;

function ConvFGIToInt(i: TFGint): string;
var
  str256, hexstr: string;
begin
  FGIntToBase10String(i, hexstr);
  result := hexstr;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i1, i2: dword;
  v1, v2, v3: dword;
  s: string;
  Bi1, Bi2, Bi3: TFGint;
  Ni1, Ni2, Ni3: TFGint;
  Mi1, Mi2, Mi3: TFGint;
  Xi1, Xi2, Xi3: TFGint;
  tfgTot, tfgTmp: TFGint;
  Bi1Ni1Xi1, Bi2Ni2Xi2, Bi3Ni3Xi3: TFGint;
  x, XTmp, XTmp2, Ytmp, y, Y2: TFGint;
  minVal, MaxVal, DiffVal, uno: TFGint;
  r3: int64;
begin
  Base10StringToFGInt('1', uno);
  Base10StringToFGInt('1234567890123456789', minVal);
  Base10StringToFGInt('6543211813223561665', MaxVal);
  FGIntSub(MaxVal, minVal, DiffVal);
  s := LabeledEdit1.Text;
  i1 := CalcCRCVal1(s);
  i2 := CalcCRCVal2(s);
  v1 := ricvfisso1;
  v2 := ricvfisso2;
  Base10StringToFGInt(inttostr(i1), Bi1);
  Base10StringToFGInt(inttostr(i2), Bi2);
  Base10StringToFGInt(inttostr(v1), Mi1);
  Base10StringToFGInt(inttostr(v2), Mi2);
  FGIntMul(Mi1, Mi2, tfgTot);
  FGIntDiv(tfgTot, Mi1, Ni1);
  FGIntDiv(tfgTot, Mi2, Ni2);
  FGIntModInv(Ni1, Mi1, Xi1);
  FGIntModInv(Ni2, Mi2, Xi2);
  FGIntMul(Bi1, Ni1, tfgTmp);
  FGIntMul(tfgTmp, Xi1, Bi1Ni1Xi1);
  FGIntMul(Bi2, Ni2, tfgTmp);
  FGIntMul(tfgTmp, Xi2, Bi2Ni2Xi2);
  FGIntAdd(Bi1Ni1Xi1, Bi2Ni2Xi2, XTmp);
  FGIntMod(XTmp, tfgTot, x);
  FGIntDiv(minVal, tfgTot, y);
  repeat
    FGIntMul(tfgTot, y, XTmp);
    FGIntAdd(XTmp, x, XTmp2);
    s := ConvFGIToInt(XTmp2);
    FGIntAdd(y, uno, y);
  until (length(s) = 19);
  s := ConvFGIToInt(XTmp2);
  r3 := strtoint64(s);
  r3 := r3 xor $09AF13BC0D8907FC;
  Memo1.Lines.Add('Codice di registrazione: ' + inttostr(r3));
end;

end.
