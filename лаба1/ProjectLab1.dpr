program ProjectLab1;

uses
  Vcl.Forms,
  Unitlabrab1 in 'Unitlabrab1.pas' {FormLab1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLab1, FormLab1);
  Application.Run;
end.
