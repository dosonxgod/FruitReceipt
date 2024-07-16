unit receipt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.VarUtils, System.Generics.Collections, classes;

type
  TreceiptScreen = class(TForm)
    lProvider: TLabel;
    lProduct: TLabel;
    lWeight: TLabel;
    eWeight: TEdit;
    lPrice: TLabel;
    ePrice: TEdit;
    btAccept: TButton;
    btAddProd: TButton;
    liProviders: TComboBox;
    liProducts: TComboBox;
    mTovarList: TMemo;
    liPrice: TComboBox;
    lJourName: TLabel;
    lHandText: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btAcceptClick(Sender: TObject);
    procedure btAddProdClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure eChange(Sender: TObject);
    procedure liPriceDropDown(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetProviders();
    procedure GetProducts();
    procedure GetPrice();

    procedure GetFieldData(const ID: int64);
    procedure AddTovarInMemo();
    procedure ClearFillData(needChangeProv: Boolean);
    procedure PrepareToFloatToStr(Edit: TEdit);

    function CheckTruePrice(const ePrice: TEdit): String;
    function CheckFillExist(): Boolean;



    { Public declarations }
  end;

var
  receiptScreen: TreceiptScreen;
  tovarsList: TList<TTovarsInDeals>;

const
  liText  = 'Выбрать';
  mesComplete  = 'Поставка успешно добавлена!';
  errorMes = 'Пожалуйста, заполните все поля!';
  errorNotCorrectData = 'Укажите число!';
  errorFillData = 'Заполните все поля!';
  errorAddInDB = 'Ошибка добавления записи.';

implementation

uses
   DBUnit;

var
  ID: int64;
  tovarsCnt: integer;
  head: THeaderPrice;

{$R *.dfm}

{ TreceiptScreen }

procedure TreceiptScreen.AddTovarInMemo();
begin
  mTovarList.Lines.Add(Format('Поставщик: %s | Продукт: %s | ' +
                       ' Кол-во : %s | ' + ' Цена: %s', [liProviders.Items[liProviders.ItemIndex], liProducts.Items[liProducts.ItemIndex],
                                                                                                  eWeight.Text, CheckTruePrice(ePrice)]));
  ClearFillData(False);
end;

procedure TreceiptScreen.btAcceptClick(Sender: TObject);
var
  i: integer;
  curPrice, curWeight: String;
begin
  FDQuery := SelectTransaction('select id from SP_GEN_DEAL_ID');
  ID := FDQuery.FieldByName('ID').AsInteger;

  try
    if tovarsList.Count > 0 then
    begin
      InsertTransaction('DEALS', ['ID','PROVIDER_ID', 'DT'], [ID.ToString, TProviders(liProviders.Items.Objects[liProviders.ItemIndex]).ID.ToString, DateToStr(Now())]);
      for i := 0 to tovarsList.Count - 1 do
      begin
        curWeight := StringReplace(FloatToStr(TTovarsInDeals(tovarsList[i]).weight), ',', '.', [rfReplaceAll, rfIgnoreCase]);
        curPrice := StringReplace(FloatToStr(TTovarsInDeals(tovarsList[i]).price), ',', '.',[rfReplaceAll, rfIgnoreCase]);
        InsertTransaction('TOVARS_IN_DEAL', ['DEAL_ID', 'PRODUCT_ID', 'WEIGHT', 'PRICE'], [ID.ToString,IntToStr(TTovarsInDeals(tovarsList[i]).product_id), CurWeight, curPrice]);
      end;
      ShowMessage(mesComplete);
    end
    else
      ShowMessage(errorMes);
  finally

  end;
  liProviders.Enabled := True;
  mTovarList.Lines.Clear;
  ClearFillData(True);
end;

procedure TreceiptScreen.btAddProdClick(Sender: TObject);
begin
  if CheckFillExist then
  begin
    GetFieldData(ID);
    inc(tovarsCnt);
    if tovarsCnt >= 1 then
      liProviders.Enabled := False;
  end
  else
    ShowMessage(errorFillData);

end;

function TreceiptScreen.CheckFillExist;
begin
  Result := (liProviders.ItemIndex >= 0) and (liProducts.ItemIndex >= 0) and (eWeight.Text <> '') and (CheckTruePrice(ePrice) <> '');
end;

function TreceiptScreen.CheckTruePrice(const ePrice: TEdit): String;
begin
  if ePrice.Text <> '' then
    Result := ePrice.Text
  else
    Result := liPrice.Items[liPrice.ItemIndex];
end;

procedure TreceiptScreen.ClearFillData(needChangeProv: Boolean);
begin
  if needChangeProv then
  begin
    liProviders.Enabled := True;
    liProviders.Text := liText;
  end;

  liProducts.Text := liText;
  eWeight.Text := '';
  ePrice.Text := '';
  liPrice.Text := '';
end;

procedure TreceiptScreen.eChange(Sender: TObject);
var
  num: double;
begin
  if TEdit(Sender).Text <> '' then
  begin
    try
      PrepareToFloatToStr(TEdit(Sender));
      num := StrToFloat(TEdit(Sender).Text);
    except
      TEdit(Sender).Text := '';
      ShowMessage(errorNotCorrectdata);
    end;
  end;

end;

procedure TreceiptScreen.FormCreate(Sender: TObject);
begin
  tovarsCnt := 0;
  GetProviders;
  GetProducts;
  GetPrice;
end;

procedure TreceiptScreen.FormDestroy(Sender: TObject);
begin
  FreeAndNil(tovarsList);
  FreeAndNil(head);
end;

procedure TreceiptScreen.GetFieldData(const ID: int64);
var
  tovar: TTovarsInDeals;
begin
  tovar := TTovarsInDeals.Create;
  try
    tovar := tovar.CreateNewTovarDeal(ID, Integer(TProducts(liProducts.Items.Objects[liProducts.ItemIndex]).ID), StrToFloat(eWeight.Text), StrToFloat(CheckTruePrice(ePrice)));
    if not assigned(tovarsList) then
      tovarsList := TList<TTovarsInDeals>.Create();

    tovarsList.Add(tovar);
  except
    ShowMessage(errorAddInDB);
  end;

  AddTovarInMemo();
end;

procedure TreceiptScreen.GetPrice;
var
  i: integer;
  price: TPrice;
begin
  if liPrice.Items.Count = 0 then
  begin
    FDQuery := SelectTransaction('SELECT ID, PRODUCT_ID, PROVIDER_ID, PRICE_VALUE, DATE_START, DATE_END FROM PRICE');
    for i := 0 to FDQuery.RecordCount - 1 do
    begin
      price := TPrice.Create;
      try
        price.product_id := FDQuery.FieldByName('PRODUCT_ID').AsInteger;
        price.provider_id := FDQuery.FieldByName('PROVIDER_ID').AsInteger;
        price.value := FDQuery.FieldByName('PRICE_VALUE').AsInteger;
        price.date_start := FDQuery.FieldByName('DATE_START').AsDateTime;
        price.date_end := FDQuery.FieldByName('DATE_END').AsDateTime;
        FDQuery.Next;
      finally
        if not Assigned(head) then
          head := THeaderPrice.Create;
        head.PriceList.Add(price);
      end;
    end;
  end;
end;

procedure TreceiptScreen.GetProducts;
var
  i: integer;
  product: TProducts;
begin
  if liProducts.Items.Count = 0 then
  begin
    FDQuery := SelectTransaction('SELECT ID, PRODUCT_TYPE_ID, PRODUCT_NAME FROM PRODUCTS');
    for i  := 0 to FDQuery.RecordCount - 1 do
    begin
      product := TProducts.Create;
      try
        product.ID := FDQuery.FieldByName('ID').AsInteger;
        product.product_type_id := FDQuery.FieldByName('PRODUCT_TYPE_ID').AsInteger;
        product.product_name := FDQuery.FieldByName('PRODUCT_NAME').AsString;
        FDQuery.Next;
      finally
        liProducts.AddItem(product.product_name, product);
      end;
    end;
  end;

  liProducts.Text := liText;
end;

procedure TreceiptScreen.GetProviders;
var
  i: integer;
  provider: TProviders;
begin
  if liProviders.Items.Count = 0 then
  begin
    FDQuery := SelectTransaction('SELECT ID, NAME FROM PROVIDERS');
    for i  := 0 to FDQuery.RecordCount - 1 do
    begin
      provider := TProviders.Create;
      try
        provider.ID := FDQuery.FieldByName('ID').AsInteger;
        provider.Name := FDQuery.FieldByName('NAME').AsString;
        FDQuery.Next;
      finally
        liProviders.AddItem(provider.Name, provider);
      end;
    end;
  end;
  liProviders.Text := liText;
end;

procedure TreceiptScreen.liPriceDropDown(Sender: TObject);
var
  priceTree: TList<TPrice>;
  i: Integer;
begin
  liPrice.Items.Clear;
  liPrice.ItemIndex := -1;
  liPrice.Text := '';

  priceTree := head.GetPriceByProd(TProducts(liProducts.Items.Objects[liProducts.ItemIndex]), TProviders(liProviders.Items.Objects[liProviders.ItemIndex]));
  for I := 0 to priceTree.Count - 1 do
    liPrice.AddItem(Tprice(priceTree.Items[i]).value.ToString, Tprice(priceTree.Items[i]));
end;

procedure TreceiptScreen.PrepareToFloatToStr(Edit: TEdit);
var
  str, str_new: String;
  i: integer;
begin
  str := edit.Text;
  str_new := '';
  for i := 1 to Length(str) do
  begin
    if CharInSet(str[i], ['0'..'9']) or (str[i] = ',') then
      str_new := str_new + str[i]
    else
      str_new := str_new + '';
  end;

  edit.Text := str_new;
end;
end.
