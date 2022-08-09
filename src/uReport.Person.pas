unit uReport.Person;

{$mode Delphi}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, RLReport, ZDataset,
  uReport.Base;

type

  { TReportPerson }

  TReportPerson = class(TReportBase)
    bandColumnHeader: TRLBand;
    bandDetail: TRLBand;
    dsPerson: TDataSource;
    txtLastName: TRLDBText;
    txtEmail: TRLDBText;
    txtId: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    txtFirstName: TRLDBText;
    txtGender: TRLDBText;
    ZQuery: TZQuery;
    procedure RLReportBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private

  public

  end;

implementation

{$R *.lfm}

{ TReportPerson }

procedure TReportPerson.RLReportBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  ZQuery.Close;
  ZQuery.Connection := Connection;
  ZQuery.Open;
end;

end.

