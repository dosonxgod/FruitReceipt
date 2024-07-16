unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  FireDAC.Phys.FBDef, FireDAC.Stan.Intf;

type
  TmainScreen = class(TForm)
    btAcceptReceipt: TButton;
    btAddNewProvider: TButton;
    btAddNewProduct: TButton;
    btAdd: TButton;
    eAdd: TEdit;
    lAdd: TLabel;
    btReport: TButton;
    liTypes: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btAddNewProviderClick(Sender: TObject);
    procedure btAddNewProductClick(Sender: TObject);
    procedure btAcceptReceiptClick(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btReportClick(Sender: TObject);
  private
    { Private declarations }
    FMode: Integer;
    procedure SetMode(const Value: Integer);

  public
    procedure GetproductTypes();

    { Public declarations }
  end;

var
  mainScreen: TmainScreen;


const
  defaultMode = 'Приём поставок';
  receceiptMode = 'Приём поставок (Режим приёма товара)';
  prodMode = 'Приём поставок (Режим добавления продукта)';
  provMode = 'Приём поставок (Режим добавления поставщика)';
  provAddMes = 'Поставщик успешно добавлен!';
  prodAddMes = 'Продукт успешно добавлен!';
  dataFillMes = 'Заполинте все поля!';


implementation

{$R *.dfm}

uses
  DBUnit, receipt, classes, reportscr;



procedure TmainScreen.SetMode(const Value: Integer);
begin
  FMode := Value;
  // default Mode
  if (Value = 1) then
  begin
    btAcceptReceipt.Visible := True;
    btAddNewProduct.Visible := True;
    btAddNewProvider.Visible := True;

    liTypes.Visible := False;
    lAdd.Visible := False;
    eAdd.Visible := False;
    btAdd.Visible := False;
  end;
  // add provider mode
  if (Value = 2) then
  begin
    lAdd.Visible := True;
    eAdd.Visible := True;
    btAdd.Visible := True;
    liTypes.Visible := False;

    eAdd.Text := '';
  end;
  // add product mode
  if (Value = 3) then
  begin
    lAdd.Visible := True;
    eAdd.Visible := True;
    btAdd.Visible := True;
    liTypes.Visible := True;

    eAdd.Text := '';
  end;
end;

procedure TmainScreen.btAcceptReceiptClick(Sender: TObject);
begin
  SetMode(1);
  receipt.receiptScreen.ShowModal;
end;

procedure TmainScreen.btAddClick(Sender: TObject);
begin
  if (eAdd.Text <> '') then
  begin
    if (FMode = 2) then
    begin
      InsertTransaction('PROVIDERS', ['NAME'], [eAdd.Text]);
      ShowMessage(provAddMes);

    end
    else
    if (FMode = 3) then
    begin
      InsertTransaction('PRODUCTS', ['PRODUCT_TYPE_ID', 'PRODUCT_NAME'], [TProductTypes(liTypes.Items.Objects[liTypes.ItemIndex]).ID.ToString, eAdd.Text]);
      liTypes.ItemIndex := -1;
      liTypes.Text := '';
      ShowMessage(prodAddMes);
    end;
    SetMode(1);
  end
  else
    ShowMessage(dataFillMes);

  liTypes.Items.Clear;
end;

procedure TmainScreen.btAddNewProductClick(Sender: TObject);
begin
  SetMode(3);
  GetproductTypes();
end;

procedure TmainScreen.btAddNewProviderClick(Sender: TObject);
begin
  SetMode(2);
end;

procedure TmainScreen.btReportClick(Sender: TObject);
begin
  report.ShowModal;
end;

procedure TmainScreen.FormCreate(Sender: TObject);
begin
  SetMode(1);
  DBUnit.ConnectToDB();
end;

procedure TmainScreen.FormDestroy(Sender: TObject);
begin
  DestroyDBData();
end;

procedure TmainScreen.GetproductTypes;
var
  i: integer;
  typeProd: TProductTypes;
begin
  if LiTypes.Items.Count = 0 then
  begin
    FDQuery := SelectTransaction('SELECT ID, PRODUCT_TYPE_NAME FROM PRODUCT_TYPE');
    for i  := 0 to FDQuery.RecordCount - 1 do
    begin
      typeProd := TProductTypes.Create;
      try
        typeProd.ID := FDQuery.FieldByName('ID').AsInteger;
        typeProd.Name := FDQuery.FieldByName('PRODUCT_TYPE_NAME').AsString;
        FDQuery.Next;
      finally
        liTypes.AddItem(typeProd.Name, typeProd);
      end;
    end;
  end;
end;

end.
