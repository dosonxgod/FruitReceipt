program FruitReceipt;

uses
  Vcl.Forms,
  main in 'main.pas' {mainScreen},
  DBUnit in 'DBUnit.pas',
  receipt in 'receipt.pas' {receiptScreen},
  classes in 'classes.pas',
  Vcl.Themes,
  Vcl.Styles,
  reportscr in 'reportscr.pas' {Report};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Dark');
  Application.CreateForm(TmainScreen, mainScreen);
  Application.CreateForm(TreceiptScreen, receiptScreen);
  Application.CreateForm(TReport, Report);
  Application.Run;
end.
