unit Unitlabrab1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormLab1 = class(TForm)
    edtFirstAngle: TEdit;
    edtSecondAngle: TEdit;
    edtThirdAngle: TEdit;
    btnType: TButton;
    tmrCleanResult: TTimer;
    lblResult: TLabel;
    procedure edtFirstAngleKeyPress(Sender: TObject; var Key: Char);
    procedure edtFirstAngleKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSecondAngleKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTypeClick(Sender: TObject);
    procedure CheckType(var ValueOfFirstAngle, ValueOfSecondAngle, ValueOfThirdAngle: byte);
    procedure edtSecondAngleKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLab1: TFormLab1;

implementation

{$R *.dfm}




procedure TFormLab1.btnTypeClick(Sender: TObject);
var
   ValueOfFirstAngle, ValueOfSecondAngle, ValueOfThirdAngle: byte;
begin
   tmrCleanResult.Enabled := true;
   CheckType(ValueOfFirstAngle, ValueOfSecondAngle,
  ValueOfThirdAngle);

end;



procedure TFormLab1.CheckType(var ValueOfFirstAngle, ValueOfSecondAngle,
  ValueOfThirdAngle: byte);
begin
   ValueOfFirstAngle := StrToInt(edtFirstAngle.text);
   ValueOfSecondAngle := StrToInt(edtSecondAngle.text);
   ValueOfThirdAngle := 180 - ValueOfFirstAngle - ValueOfSecondAngle;
   edtThirdAngle.Text := IntToStr(ValueOfThirdAngle);
   if (ValueOfFirstAngle = ValueOfSecondAngle) then
       begin
          lblResult.Caption := 'Your triangle is isosceles, first angle is ' + IntToStr(ValueOfFirstAngle) +' and second angle is '+ IntToStr(ValueOfSecondAngle) ;
          ShowMessage('Your triangle is isosceles, first angle is ' + IntToStr(ValueOfFirstAngle) +' and second angle is '+ IntToStr(ValueOfSecondAngle));
       end;
   if (ValueOfSecondAngle = ValueOfThirdAngle) then
       begin
          lblResult.Caption := 'Your triangle is isosceles, second angle is ' + IntToStr(ValueOfSecondAngle) +' and third angle is '+ IntToStr(ValueOfThirdAngle);
          ShowMessage('Your triangle is isosceles, second angle is ' + IntToStr(ValueOfSecondAngle) +' and third angle is '+ IntToStr(ValueOfThirdAngle));
       end;
   if (ValueOfFirstAngle = ValueOfThirdAngle) then
       begin
          lblResult.Caption := 'Your triangle is isosceles, first angle is ' + IntToStr(ValueOfFirstAngle) +' and third angle is '+ IntToStr(ValueOfThirdAngle) ;
          ShowMessage('Your triangle is isosceles, first angle is ' + IntToStr(ValueOfFirstAngle) +' and third angle is '+ IntToStr(ValueOfThirdAngle));
       end;
   if (ValueOfFirstAngle = 90) then
      if (ValueOfSecondAngle = ValueOfThirdAngle) then
         begin
            lblResult.Caption := 'Your triangle is isosceles and right, second angle is ' + IntToStr(ValueOfSecondAngle) +' and third angle is '+ IntToStr(ValueOfThirdAngle);
            ShowMessage('Your triangle is isosceles and right, second angle is ' + IntToStr(ValueOfSecondAngle) +' and third angle is '+ IntToStr(ValueOfThirdAngle));
         end
      else
         begin
            lblResult.Caption := 'Your triangle is right, your first angle is ' + IntToStr(ValueOfFirstAngle);
            ShowMessage('Your triangle is right, your first angle is ' + IntToStr(ValueOfFirstAngle));
         end;
   if (ValueOfSecondAngle = 90) then
      if (ValueOfFirstAngle = ValueOfThirdAngle) then
         begin
            lblResult.Caption := 'Your triangle is isosceles and right, first angle is ' + IntToStr(ValueOfFirstAngle) +' and third angle is '+ IntToStr(ValueOfThirdAngle) ;
            ShowMessage('Your triangle is isosceles and right, first angle is ' + IntToStr(ValueOfFirstAngle) +' and third angle is '+ IntToStr(ValueOfThirdAngle));
         end
      else
         begin
            lblResult.Caption := 'Your triangle is right, your second angle is ' + IntToStr(ValueOfSecondAngle);
            ShowMessage('Your triangle is right, your second angle is ' + IntToStr(ValueOfSecondAngle));
         end;
   if (ValueOfThirdAngle = 90) then
      begin
         lblResult.Caption := 'Your triangle is right, your third angle is ' + IntToStr(ValueOfThirdAngle);
         ShowMessage('Your triangle is right, your third angle is ' + IntToStr(ValueOfThirdAngle));
      end;
end;

procedure TFormLab1.edtFirstAngleKeyPress(Sender: TObject; var Key: Char);
begin
   if (Length(edtFirstAngle.Text) = 0) then
       if (Key ='0') then
          Key := #0;
   if (Length(edtFirstAngle.Text) = 0) then
      edtSecondAngle.Enabled := False;
end;



procedure TFormLab1.edtFirstAngleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   Value: integer;
begin
   if (Length(edtFirstAngle.Text) <> 0) then
      edtSecondAngle.Enabled := True
   else
      edtSecondAngle.Enabled := false;
   Value := StrToInt(edtFirstAngle.text);
   if (Value > 178) then
      begin
         ShowMessage('please,repeat your input(first angle can''t be more, than 178 degrees)');
         edtFirstAngle.Text := '';
         edtSecondAngle.Enabled := false;
      end;
end;

procedure TFormLab1.edtSecondAngleKeyPress(Sender: TObject; var Key: Char);
begin
   if (Length(edtSecondAngle.Text) = 0) then
       if (Key ='0') then
          Key := #0;
   if (Length(edtSecondAngle.Text) = 0) then
      btnType.Enabled := False
   else
      btnType.Enabled := true;
end;

procedure TFormLab1.edtSecondAngleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   ValueOfFirstAngle, ValueOfSecondAngle: integer;
begin
   ValueOfFirstAngle := StrToInt(edtFirstAngle.text);
   ValueOfSecondAngle := StrToInt(edtSecondAngle.text);
   if (ValueOfFirstAngle = 178) then
      if (ValueOfSecondAngle > 1) then
         begin
            ShowMessage('please,repeat your input(second angle can''t be more, than 1 degree(when first angle is 178 degrees))');
            edtSecondAngle.Text := '';
         end;
   if (ValueOfSecondAngle + ValueOfFirstAngle >= 180) then
      begin
         ShowMessage('please,repeat your input(sum of angles can''t be more,than 179 degrees)');
         edtSecondAngle.Text := '';
      end;
   if (Length(edtSecondAngle.Text) = 0) then
      btnType.Enabled := False
   else
      btnType.Enabled := true;
end;
end.
