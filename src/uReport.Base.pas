unit uReport.Base;

{$mode Delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, RLReport, RLPDFFilter,

  Horse.OctetStream,
  uDMConnection,
  ZConnection;

type

  { TReportBase }

  TReportBase = class(TFrame)
    lblTime: TRLLabel;
    bandHeader: TRLBand;
    bandFooter: TRLBand;
    lblDate: TRLLabel;
    lblTitle: TRLLabel;
    RLPDFFilter: TRLPDFFilter;
    RLReport: TRLReport;
  protected
    Connection: TZConnection;
    ReportFileName: String;
  public
    function GetReportFile: String;
    function GetReportStream: TMemoryStream;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.lfm}

{ TReportBase }

constructor TReportBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DMConnection := TDMConnection.Create(nil);
  DMConnection.ZConnection.Connected := True;
  Connection := DMConnection.ZConnection;
end;

destructor TReportBase.Destroy;
begin
  if FileExists(ReportFileName) then
    DeleteFile(ReportFileName);
  DMConnection.ZConnection.Disconnect;
  DMConnection.Free;
  inherited Destroy;
end;

function TReportBase.GetReportFile: String;
begin
  ReportFileName := ExtractFilePath(Application.ExeName) + 'reports\'+Copy(TGUID.NewGuid.ToString(), 2, 36)+'.pdf';
  RLReport.PrintDialog := False;
  RLReport.ShowProgress := False;
  RLPDFFilter.ShowProgress := False;
  RLReport.Prepare;
  RLReport.SaveToFile(ReportFileName);
  Result := ReportFileName;
end;

function TReportBase.GetReportStream: TMemoryStream;
begin
  RLReport.PrintDialog := False;
  RLReport.ShowProgress := False;
  RLPDFFilter.ShowProgress := False;
  RLReport.Prepare;
  Result := TMemoryStream.Create;
  RLReport.SaveToStream(Result);
  Result.Position := 0;
end;

end.

