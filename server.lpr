program server;

{$MODE DELPHI}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Horse,
  Horse.Compression,
  Horse.OctetStream,
  SysUtils,
  Classes;

procedure GetHome(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
begin
  Res.Send('REST server with Horse + Lazarus + Alpine in Docker');
end;

procedure GetStream(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
var
  LStream: TFileStream;
begin
  try
    if FileExists(ExtractFilePath(ParamStr(0)) + 'report.pdf') then
      LStream := TFileStream.Create(ExtractFilePath(ParamStr(0)) + 'report.pdf', fmOpenRead)
    else
      LStream := TFileStream.Create('../report.pdf', fmOpenRead);
    Res.SendFile(LStream, 'report.pdf', 'application/pdf');
  finally
    LStream.Free;
  end;
end;

procedure OnListen(Horse: THorse);
begin
  Writeln(Format('Server running on port: %d', [Horse.Port]));
end;

begin
  THorse
    .Use(Compression())
    .Use(OctetStream);

  THorse.Get('/', GetHome);

  THorse.Get('/stream', GetStream);

  THorse.Listen(5000, OnListen);
end.
