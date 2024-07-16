unit classes;

interface

uses
  System.Generics.Collections, SysUtils, Rtti, System.Types, System.Math;

type
  TProductTypes = class(TObject)
    ID: int64;
    Name: String;

    constructor Create;
    destructor Destroy; override;
  end;

  TProviders = class(TObject)
    ID: int64;
    Name: String;

    constructor Create;
    destructor Destroy; override;
  end;

  TProducts = class(TObject)
    ID: int64;
    product_type_id: int64;
    product_name: String;

    constructor Create;
    destructor Destroy; override;

  end;

  TDeal = class(TObject)
  private
  public
    ID: int64;
    provider_id: int64;
    DT: TDate;
  end;

  TTovarsInDeals = class(TObject)
  public
    deal_id: int64;
    product_id: int64;
    weight: double;
    price: double;

    constructor Create;
    destructor Destroy; override;
    function CreateNewTovarDeal(const deal_id: int64; const product_id: int64;
      const weight: double; const price: double): TTovarsInDeals;
  end;


  TPrice = class(Tobject)
  public
    product_id: int64;
    provider_id: int64;
    value: double;
    date_start: TDate;
    date_end: TDate;

    constructor Create;
    destructor Destroy; override;

  end;

  THeaderPrice = class(TPrice)
  public
    FPriceList: TList<TPrice>;
    function GetList(): TList<TPrice>;
  public
    constructor Create;
    destructor Destroy; override;

    property PriceList: TList<TPrice> read GetList;
    function GetPriceByProd(prod: TProducts; prov: TProviders): TList<TPrice>;
    procedure AddPriceItem(price: TPrice);

  end;



implementation

{ TProductTypes }

constructor TProductTypes.Create;
begin
  ID := 0;
  name := '';
end;

destructor TProductTypes.Destroy;
begin
  inherited;
end;

{ TProviders }

constructor TProviders.Create;
begin
  ID := 0;
  name := '';
end;

destructor TProviders.Destroy;
begin

  inherited;
end;

{ TProducts }

constructor TProducts.Create;
begin
  ID := 0;
  product_type_id := 0;
  product_name := '';
end;

destructor TProducts.Destroy;
begin
  inherited;
end;

{ TTovarsInDeals }

constructor TTovarsInDeals.Create;
begin
  inherited;
  deal_id := 0;
  product_id := 0;
  weight := 0;
  price := 0;
end;



function TTovarsInDeals.CreateNewTovarDeal(const deal_id, product_id: int64;
  const weight, price: double): TTovarsInDeals;
begin
  Result := nil;

  if not assigned(Result) then
    Result := TTovarsInDeals.Create;

  Result.deal_id := deal_id;
  Result.product_id := product_id;
  Result.weight := weight;
  Result.price := price;
end;

destructor TTovarsInDeals.Destroy;
begin
  inherited;
end;

{ TPrice }

procedure THeaderPrice.AddPriceItem(price: TPrice);
begin
  FPriceList.Add(price);
end;

constructor TPrice.Create;
begin
  inherited;
  product_id := 0;
  provider_id := 0;
  value := 0;
  date_start := 0;
  date_end := 0;
end;

destructor TPrice.Destroy;
begin
  inherited;
end;

constructor THeaderPrice.Create;
begin
  inherited;
end;

destructor THeaderPrice.Destroy;
begin
  inherited;
end;

function THeaderPrice.GetList: TList<TPrice>;
begin
  if not assigned(FPriceList) then
    FPriceList := TList<TPrice>.Create;
  Result := FPriceList;
end;

function THeaderPrice.GetPriceByProd(prod: TProducts; prov: TProviders)
  : TList<TPrice>;
var
  i: integer;
  test: TPrice;
begin
  Result := nil;
  for i := 0 to FPriceList.Count - 1 do
  begin
    test := TPrice(FPriceList.Items[i]);
    if (test.product_id = prod.ID) and (test.provider_id = prov.ID) then
    begin
       if not assigned(result) then
         Result := TList<TPrice>.Create;
       Result.Add(test)
    end
    else
      continue;
  end;
end;

end.
