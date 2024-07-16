unit reportscr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, frxClass, frxDBSet,
  frCoreClasses, frDPIAwareControls, frxDPIAwareBaseControls, frxPreview, FireDAC.Comp.Client, DBUnit,
  Vcl.StdCtrls;

type
  TReport = class(TForm)
    frxPreview1: TfrxPreview;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    lData: TLabel;
    eStart: TEdit;
    eEnd: TEdit;
    lStart: TLabel;
    lEnd: TLabel;
    btGo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btGoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Report: TReport;


implementation

{$R *.dfm}

procedure TReport.btGoClick(Sender: TObject);
var
  ddmmyyyy: TFormatSettings;
begin
  frxReport1.ShowReport;
  ddmmyyyy := FormatSettings;
  ddmmyyyy.ShortDateFormat := 'dd.mm.yyyy';
  ddmmyyyy.ShortTimeFormat := 'hh:mm';
  ddmmyyyy.LongTimeFormat := 'hh:mm:ss';
  ddmmyyyy.DateSeparator := '.';
  ddmmyyyy.TimeSeparator := ':';

  FDQuery.SQL.Text := 'select p.name as Provider, pr.product_name as Product_Name, sum(tid.price) as Total_Price, sum(tid.weight) as Total_weight from tovars_in_deal tid ' +
                                'left join products pr on pr.id = tid.product_id ' +
                                'left join deals d on d.id = tid.deal_id ' +
                                'left join providers p on p.id = d.provider_id ' +
                                'where (d.dt > :p1) and (d.dt < :p2) '+
                                'group by pr.product_name, p.name';


   FDQuery.Params.ParamByName('p1').AsDate := StrToDate(eStart.Text);
   FDQuery.Params.ParamByName('p2').Value := StrToDate(eEnd.Text);
   FDQuery.Open;


end;

procedure TReport.FormCreate(Sender: TObject);
begin
  frxDBDataSet1.DataSet := FDQuery;
end;

end.
