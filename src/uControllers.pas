unit uControllers;

{$mode Delphi}

interface

uses
  Classes,
  SysUtils,

  Horse,
  Horse.OctetStream,

  uReport.Person;

procedure Registry;

implementation

procedure GetHome(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
begin
  Res.Send('Container report in Lazarus');
end;


procedure GetStream(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  LStream: TFileStream;
begin
  try
    LStream := TFileStream.Create('reports/report.pdf', fmOpenRead);
    Res.SendFile(LStream, 'report.pdf', 'application/pdf');
  finally
    LStream.Free;
  end;
end;

procedure DoReportPersonFile(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  LReport: TReportPerson;
  LStream: TFileStream;
begin
  try
    LReport := TReportPerson.Create(nil);
    LStream := TFileStream.Create(LReport.GetReportFile, fmOpenRead);
    Res.SendFile(LStream, 'report.pdf', 'application/pdf');
  finally
    LStream.Free;
    LReport.Free;
  end;
end;

procedure DoReportPersonStream(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  LReport: TReportPerson;
begin
  try
    LReport := TReportPerson.Create(nil);
    Res.SendFile(LReport.GetReportStream, 'report.pdf', 'application/pdf');
  finally
    LReport.Free;
  end;
end;

procedure Registry;
begin
  THorse
    .Get('/', GetHome)
    .Get('/stream', GetStream)
    .Get('/person-file', DoReportPersonFile)
    .Get('/person-stream', DoReportPersonStream);
end;

end.


