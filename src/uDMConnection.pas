unit uDMConnection;

{$mode Delphi}

interface

uses
  Classes, SysUtils, ZConnection;

type

  { TDMConnection }

  TDMConnection = class(TDataModule)
    ZConnection: TZConnection;
    procedure ZConnectionBeforeConnect(Sender: TObject);
  private

  public

  end;

var
  DMConnection: TDMConnection;

implementation

{$R *.lfm}

{ TDMConnection }

procedure TDMConnection.ZConnectionBeforeConnect(Sender: TObject);
begin
  ZConnection.Protocol := 'sqlite';
  ZConnection.ClientCodepage := 'UTF-8';
  ZConnection.Database := '.\database.db3';
  if not FileExists(ZConnection.Database) then
    ZConnection.Properties.Add('CreateNewDatabase=true');
end;

end.

