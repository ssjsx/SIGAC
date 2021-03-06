unit uConnect;

interface

uses StdCtrls,types,inifiles, DBTables, Controls, Dialogs, SysUtils, Windows, printers,
  Messages, Forms, Winsock, spin, mask,  DBCtrls, dbgrids, Classes, Math;

var
  sLocalHost : string;
  sLocalUser : string;
  sLocalPwd  : string;
  sLocalPwdC : string;
  sLocalDb   : string;

  sWebHost   : string;
  sWebUser   : string;
  sWebPwd    : string;
  sWebPwdC   : string;
  sWebDb     : string;

  Procedure IniFileRead;
  Function TestConnectLocal(bCrypto:Boolean) : Boolean;
  Function TestConnectWeb(bCrypto:Boolean) : Boolean;
  Procedure TestCryptoIni;
  Procedure IniFileWrite(nLocal:Integer); // 0 - Local / 1 - Web

implementation

uses Funcoes, dmTestConnect, udm, ZConnection;

Procedure IniFileRead;
Var
  ini : TIniFile;
begin
  ini := TInifile.Create(conf_local);
  try
    sLocalHost := ini.Readstring('Rede', 'Host', 'localhost');
    sLocalUser := ini.Readstring('Rede', 'user', 'root');
    sLocalPwd := ini.Readstring('Rede', 'Password', '');
//    sLocalPwd  := Crypt('D', ini.Readstring('Rede', 'Password', ''));
    sLocalDb   := ini.Readstring('Rede', 'databasename', '');
  finally
    ini.Free;
  end;

  ini := TInifile.Create(CONF_GLOBAL);
  try
    sWebHost   := ini.Readstring('mysqld', 'ipnet', '');
    sWebUser   := ini.Readstring('mysqld', 'usernet', '');
    sWebPwd   := ini.Readstring('mysqld', 'pwdnet', '');
//    sWebPwd    := Crypt('D', ini.Readstring('mysqld', 'pwdnet', ''));
    sWebDb     := ini.Readstring('mysqld', 'databasenet', '');
  finally
    ini.Free;
  end;
end;

Function TestConnectLocal(bCrypto:Boolean) : Boolean;
begin
  if bCrypto then
  begin
    sLocalPwdC := sLocalPwd;
    sLocalPwd  := Crypt('D', sLocalPwdC);
  end;

  dtmTestConnect.cnLocal.HostName := sLocalHost;
  dtmTestConnect.cnLocal.Database := sLocalDb;
  dtmTestConnect.cnLocal.User     := sLocalUser;
  dtmTestConnect.cnLocal.Password := sLocalPwd;

  try
    dtmTestConnect.cnLocal.Connect;
  except
  end;

  Result := dtmTestConnect.cnLocal.Connected;

  dtmTestConnect.cnLocal.Disconnect;
end;

Function TestConnectWeb(bCrypto:Boolean) : Boolean;
begin
  if bCrypto then
  begin
    sWebPwdC := sWebPwd;
    sWebPwd  := Crypt('D',sWebPwdC);
  end;

  dtmTestConnect.cnWeb.HostName := sWebHost;
  dtmTestConnect.cnWeb.Database := sWebDb;
  dtmTestConnect.cnWeb.User     := sWebUser;
  dtmTestConnect.cnWeb.Password := sWebPwd;

  try
    dtmTestConnect.cnWeb.Connect;
  except
  end;

  Result := dtmTestConnect.cnWeb.Connected;

  dtmTestConnect.cnWeb.Disconnect;
end;

procedure TestCryptoIni;
var
  bCryptoL,
  bCryptoW : Boolean;
begin
  // 1 - Ler o arquivo INI e guardar as vari�veis
  IniFileRead;

  // 2 - Testa com a conex�o local com as variaveis inicialmente carregadas
  if TestConnectLocal(False) then
  begin // Funcionou, preciso criptografar a senha e salv�-la.
    if trim(sLocalPwd) <> '' then
      sLocalPwdC := Crypt('C',sLocalPwd)
    else
      sLocalPwdC := sLocalPwd;
    Password   := sLocalPwd;
    bCryptoL   := True;
  end
  else
  begin // Se n�o funcionou � por que j� est� criptografado
    TestConnectLocal(True);
    bCryptoL   := False;
  end;

  // 3 - Testa com a conex�o local com as variaveis inicialmente carregadas
  if TestConnectWeb(False) then
  begin // Funcionou, preciso criptografar a senha e salv�-la.
    if Trim(sWebPwd) <> '' then
      sWebPwdC  := Crypt('C',sWebPwd)
    else
      sWebPwdC  := sWebPwd;
    Passwordnet := sWebPwd;
    bCryptoW    := True;
  end
  else
  begin // Se n�o funcionou � por que j� est� criptografado
    TestConnectWeb(True);
    bCryptoW := False;
  end;

  // 4 - Escreve o arquivo com a variavel criptografada
  if bCryptoL then
    IniFileWrite(0);

  if bCryptoW then
    IniFileWrite(1);
end;

Procedure IniFileWrite(nLocal:Integer);
Var
  iniL,
  iniW : TIniFile;
begin
  iniL := TInifile.Create(conf_local);
  iniW := TInifile.Create(CONF_GLOBAL);
  try
    case nLocal of
      0 : iniL.WriteString('Rede'  , 'Password', sLocalPwdC);
//      1 : iniW.WriteString('mysqld', 'pwdnet'  , sWebPwdC);
    end;
  finally
    iniL.Free;
    iniW.Free;
  end
end;

end.
