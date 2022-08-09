program server;

{$MODE DELPHI}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils,
  Classes,
  Interfaces,

  Horse,
  Horse.OctetStream,

  uControllers;


procedure OnListen(Horse: THorse);
begin
  Writeln(Format('Server running on port: %d', [Horse.Port]));
end;

begin
  THorse
    .Use(OctetStream);

  uControllers.Registry;

  THorse.Listen(5000, OnListen);
end.
