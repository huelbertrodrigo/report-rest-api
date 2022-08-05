program server;

{$MODE DELPHI}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Horse,
  SysUtils;

procedure GetHome(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);
begin
  Res.Send('REST server with Horse + Lazarus + Alpine in Docker');
end;

procedure OnListen(Horse: THorse);
begin
  Writeln(Format('Server running on port: %d', [Horse.Port]));
end;

begin
  THorse.Get('/', GetHome);

  THorse.Listen(5000, OnListen);
end.
