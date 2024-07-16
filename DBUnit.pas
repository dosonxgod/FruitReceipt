unit DBUnit;

interface

uses
  System.SysUtils,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.StrUtils, System.Math, System.Variants;

var
  FDConnection: TFDConnection;
  FDQuery: TFDQuery;
  FDriver: TFDPhysFBDriverLink;


procedure ConnectToDB();
procedure DestroyDBData();
function SelectTransaction(sql: String):TFDQuery;
procedure InsertTransaction(tableName: String; const Val: array of string; const Field: array of variant);


implementation

{ DBForm }

procedure ConnectToDB;
var
  AppPath: String;
  LibPath: String;
  DBPath: String;
begin
  AppPath := ExtractFilePath(Application.ExeName);
  DBPath :=  IncludeTrailingPathDelimiter(AppPath) + '..\..\DB\DB_2.fdb';
  LibPath := IncludeTrailingPathDelimiter(AppPath) + '..\..\libs\fbclient.dll';
  LibPath := ExpandFileName(LibPath);
  FDConnection := TFDConnection.Create(nil);
  try
    with FDConnection.Params do
    begin
      DriverID := 'FB';
      DataBase := ExpandFileName(DBPath);
      UserName := 'SYSDBA';
      Password := 'masterkey';
      FDriver := TFDPhysFBDriverLink.Create(nil);
      try
        FDriver.VendorLib := LibPath;
        FDriver.Embedded := True;
      except
        ShowMessage('Не обнаружена библиотека для подключения к БД');
      end;

    end;
  finally
    FDConnection.Connected := True;
  end;


  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := FDConnection;
  except
    ShowMessage('Ошибка подключения к базе данных');
  end;
end;

function SelectTransaction(sql: String):TFDQuery;
begin
  if Assigned(FDConnection) then
  begin
    if not Assigned(FDQuery) then
      FDQuery := TFDQuery.Create(nil);
    try
      FDQuery.Open(sql);
    finally
      Result := FDQuery;
    end;
  end;
end;

procedure InsertTransaction(tableName: String; const Val: array of string; const Field: array of variant);
var
  FieldsSQL, ParamsSQL: String;
  i: Integer;

begin
  FieldsSQL := '';
  ParamsSQL := '';

  if Length(Val) <> Length(Field) then
  begin
    ShowMessage('Ошибка параметров вставки');
    exit;
  end;

 for i := 0 to High(Val) do
 begin
   if i > 0 then
     FieldsSQL := FieldsSQL + ', ';

   FieldsSQL := FieldsSQL + Val[i];
 end;

 for i := 0 to High(Field) do
 begin
   if i > 0 then
     ParamsSQL := ParamsSQL + ', ';

   ParamsSQL := ParamsSQL + '''' + Field[i] + '''';
 end;

  FDQuery.SQL.Text := 'INSERT INTO ' + tableName + ' (' + FieldsSQL + ') VALUES (' + ParamsSQL + ')';
  FDQuery.ExecSQL;
end;

procedure DestroyDBData();
begin
  if Assigned(FDConnection) then
    FDConnection.Free;

  if Assigned(FDQuery) then
    FDQuery.Free;
end;

end.
