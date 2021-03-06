unit ufinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DBClient, Provider, DB,  Grids, DBGrids,
  ExtCtrls, StdCtrls, Buttons, ActnList, DBCtrls, ExtDlgs, Inifiles, zlib,
  jpeg,RLReport,RLFilters, RLDraftFilter, Menus, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, RLBoleto,shellapi;

type
  Tffinanceiro = class(TForm)
    DBGrid1: TDBGrid;
    panel2: TPanel;
    ActionList1: TActionList;
    Label2: TLabel;
    elocalizar: TEdit;
    filtro: TAction;
    Panel3: TPanel;
    tc: TAction;
    opendialog: TOpenPictureDialog;
    image: TAction;
    Action1: TAction;
    formatar: TAction;
    rcampo: TRadioGroup;
    focus: TAction;
    lqtd: TLabel;
    Label11: TLabel;
    DBText5: TDBText;
    total: TAction;
    pg: TAction;
    Label9: TLabel;
    lbc: TLabel;
    lemp: TLabel;
    ljuro: TLabel;
    StaticText2: TStaticText;
    grafico: TAction;
    qpromissoria: TRLReport;
    RLBand1: TRLBand;
    RLDBText8: TRLDBText;
    lvencimento: TRLLabel;
    RLLabel31: TRLLabel;
    ldata: TRLLabel;
    lpagarei: TRLLabel;
    lmemo: TRLMemo;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLDBText15: TRLDBText;
    RLLabel22: TRLLabel;
    lnumero: TRLAngleLabel;
    lvalor: TRLAngleLabel;
    lnpromissoria: TRLAngleLabel;
    lcidade: TRLLabel;
    RLBand2: TRLBand;
    RLLabel4: TRLLabel;
    lavalista: TRLMemo;
    RLLabel1: TRLLabel;
    Label1: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    panel1: TPanel;
    btnnovo: TSpeedButton;
    btnapagar: TSpeedButton;
    btnimprimir: TSpeedButton;
    SpeedButton3: TSpeedButton;
    btndeletado: TSpeedButton;
    SpeedButton1: TSpeedButton;
    StaticText1: TStaticText;
    Panel4: TPanel;
    rpg: TRadioGroup;
    btnmenu: TSpeedButton;
    menu: TPopupMenu;
    Emitidosdeumperodo1: TMenuItem;
    ComVencimentoem1: TMenuItem;
    Relatrioporvencimentobanco1: TMenuItem;
    BaixarImprimirparcelas1: TMenuItem;
    SpeedButton2: TSpeedButton;
    Isentar1: TMenuItem;
    Clientes1: TMenuItem;
    sqld: TZQuery;
    ds: TDataSource;
    Bloquearparcela1: TMenuItem;
    envemail: TAction;
    Desbloquearparcela1: TMenuItem;
    SpeedButton4: TSpeedButton;
    rtipo: TRadioGroup;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    Lanarmensalidades1: TMenuItem;
    N5: TMenuItem;
    Importardosite1: TMenuItem;
    N6: TMenuItem;
    rmensalidades: TCheckBox;
    mensalidades: TAction;
    provedor: TDataSetProvider;
    tabela: TClientDataSet;
    Cadastrocedente1: TMenuItem;
    ImprimirExportarboleto1: TMenuItem;
    GerarRemessa1: TMenuItem;
    N8: TMenuItem;
    Alterarvencimentos1: TMenuItem;
    RelatrioCarteiras1: TMenuItem;
    N9: TMenuItem;
    ClientessemEMail1: TMenuItem;
    Gerarboletoparaossememail1: TMenuItem;
    exportarparaosite1: TMenuItem;



    procedure boletovital(m:boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure elocalizarKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure elocalizarChange(Sender: TObject);
    procedure elocalizarKeyPress(Sender: TObject; var Key: char);
    procedure elocalizarEnter(Sender: TObject);
    procedure elocalizarExit(Sender: TObject);
    procedure codfabricanteExecute(Sender: TObject);
    procedure filtroExecute(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure tcExecute(Sender: TObject);
    procedure btnapagarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure formatarExecute(Sender: TObject);
    procedure focusExecute(Sender: TObject);
    procedure totalExecute(Sender: TObject);
    procedure btndeletadoClick(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure sqldAfterScroll(DataSet: TDataSet);
    procedure pgExecute(Sender: TObject);
    procedure bfiltroClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure graficoExecute(Sender: TObject);
    procedure qpromissoriaBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure rpgClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnmenuClick(Sender: TObject);
    procedure Emitidosdeumperodo1Click(Sender: TObject);
    procedure ComVencimentoem1Click(Sender: TObject);
    procedure Relatrioporvencimentobanco1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BaixarImprimirparcelas1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Isentar1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Bloquearparcela1Click(Sender: TObject);
    procedure envemailExecute(Sender: TObject);
    procedure Desbloquearparcela1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Lanarmensalidades1Click(Sender: TObject);
    procedure Importardosite1Click(Sender: TObject);
    procedure DBText5Click(Sender: TObject);
    procedure mensalidadesExecute(Sender: TObject);
    procedure rmensalidadesClick(Sender: TObject);
    procedure GerarRemessa1Click(Sender: TObject);
    procedure Cadastrocedente1Click(Sender: TObject);
    procedure ImprimirExportarboleto1Click(Sender: TObject);
    procedure Alterarvencimentos1Click(Sender: TObject);
    procedure RelatrioCarteiras1Click(Sender: TObject);
    procedure ClientessemEMail1Click(Sender: TObject);
    procedure Gerarboletoparaossememail1Click(Sender: TObject);
    procedure exportarparaosite1Click(Sender: TObject);
  private
  PN,PA,PD,PC:string;
  plano : boolean;

    { Private declarations }
  public

  script,codigo,controleimpressao,nome,socio,promocao,nbanco,codigogp,carteira,mov,gp_:string;

    { Public declarations }
  end;

var
  ffinanceiro: Tffinanceiro;
  function dtfin:string;


implementation

uses  udm, mapimail,funcoes, umanu,  ufinanceirovalor, ufiltrocad, uclientelocaliza;

{$R *.dfm}





procedure Tffinanceiro.boletovital(m:boolean);
var
imagem,loc,str,str2,chave:string;
qr,qr2:tzquery;
list:tstringlist;
begin

        if not (rtipo.ItemIndex in [4,5]) then msg('#Clique em boleto ou mens/rec!!!',0);
        
        abortaacao(tabela,nil,'chave','','','','',0);
        //tabela.IndexFieldNames := 'codigo';
        loc:= tabela.fieldbyname('chave').AsString;
        if Pred(dbgrid1.SelectedRows.Count) < 0 then begin
           if not msg('Voc� n�o fez uma sele��o. Deseja enviar para todos listados?',2) then abort;
        end else

           filtrar(DBGrid1,tabela,nil,'chave');

        list:=tstringlist.Create;
        fdm.tbempresa.Open;
        list.Add(fdm.tbempresa.fieldbyname('fantasia').AsString);
        list.Add(fdm.tbempresa.fieldbyname('email').AsString);
        list.Add('Fone: '+ fdm.tbempresa.fieldbyname('fone1').AsString + '   -   '+
                           fdm.tbempresa.fieldbyname('fax').AsString);
        list.Add(fdm.tbempresa.fieldbyname('Endereco').AsString + ' - '+
                 fdm.tbempresa.fieldbyname('numero').AsString + '   '+
                 fdm.tbempresa.fieldbyname('Complemento').AsString + ' - '+
                 fdm.tbempresa.fieldbyname('bairro').AsString + ' - '+
                 '  CEP: '+ fdm.tbempresa.fieldbyname('cep').AsString   + ' - '+
                 fdm.tbempresa.fieldbyname('municipio').AsString+  ' - '+
                 fdm.tbempresa.fieldbyname('uf').AsString);
        list.Add('');
        fdm.tbempresa.close;


        if rpg.ItemIndex<>1 then  msg('#Escolha n�o pago.',0);




        str :='';
        tabela.First;
        while not tabela.Eof do begin
              if str = '' then str := ' and (f.chave = '+ quotedstr(tabela.fieldbyname('chave').AsString)
              else str := str +       ' or  f.chave = '+ quotedstr(tabela.fieldbyname('chave').AsString);
              tabela.Next;
        end;
        if str<>'' then str := str + ') ';


        Qr := tzquery.Create(self);
        qr.Connection := fdm.conector;
        Qr2 := tzquery.Create(self);
        qr2.Connection := fdm.conector;


        if m then str2:= ' and (c.email is null or c.email = "sac@vitalcred.com.br" or c.email = "SAC@VITALCRED.COM.BR")'
             else str2:= ' and (c.email is not null and c.email <> "sac@vitalcred.com.br" and c.email <> "SAC@VITALCRED.COM.BR")';

        with Qr do begin
             sql.Add('select f.chave from tbfinanceiro f, tbcliente c where c.codigo=f.codigo '+ str+str2+ ' order by chave');
             open;
        end;
        tabela.Filtered := false;


        Qr.First;
        while not Qr.Eof do begin
              qr2.SQL.Clear;
              qr2.SQL.add('select c.email, c.cnpj, c.nome, c.endereco, c.numero, c.complemento, c.bairro, c.cep, c.municipio, c.uf, '+
                  ' f.nboleto, f.chave, f.dtvencimento, if (f.vrcliente >0,f.vrcliente,  f.vrcliente*(-1)) as  vrdocumento from tbcliente c, tbfinanceiro f '+
                  ' where (f.vrcliente<>0 and f.vrcliente is not null) and c.codigo=f.codigo '+
                  ' and f.chave = '+ quotedstr(qr.fieldbyname('chave').AsString));
              qr2.open;

              Qr.Next;
              geraboleto(qr2,0,'tbfinanceiro',m);

              if fileexists (pchar('c:\_'+qr2.fieldbyname('chave').AsString+'.pdf'))then
                 imagem:= pchar('c:\_'+qr2.fieldbyname('chave').AsString+'.pdf')
              else imagem :='';


              try
              if not m then
              sendMail(qr2.fieldbyname('nome').AsString,
                       qr2.fieldbyname('email').AsString,
                       qr2.fieldbyname('nome').AsString,
                       qr2.fieldbyname('email').AsString,
                       'Boleto Vitalcred',
                       list.Text +
                       'Boleto referente a '+ formatdatetime('mmmm/yyyy',qr2.fieldbyname('dtvencimento').AsDateTime),
                       imagem,false);
              except end;

              sleep(300);
        end;

      qr.Destroy;
      qr2.Destroy;
      tabela.Filtered := false;
      tabela.Locate('chave',loc,[]);
end;



function dtfin:string;
var
imp,DataIni,DataFin:string;
begin
            if ffinanceiro.Active then begin
            imp := msgi('Entre com o per�odo(Pagar em):',3);

            DataIni := copy(imp,1,10);
            DataFin := copy(imp,11,10);

            if DataIni <> '' then
               result := ' and dtvencimento between '+ quotedstr(formatdatetime('yyyy-mm-dd', strtodate(DataIni)))+
                         ' and ' + quotedstr(formatdatetime('yyyy-mm-dd', strtodate(DataFin)));
            end;             

end;







procedure Tffinanceiro.FormShow(Sender: TObject);
begin


         try
          // selecione('alter table tbfinanceirop add tp2 integer');
         except end;

         try
           selecione('update tbfinanceirop set totalempresa = if(LiqEmpresa is null,0,LiqEmpresa) + '+
                     '                if(adiantamento is null,0,adiantamento) where totalempresa is null');

         except end;

         try
           selecione('update tbfinanceiro set totalempresa = if(LiqEmpresa is null,0,LiqEmpresa) + '+
                     '                if(adiantamento is null,0,adiantamento) where totalempresa is null');
         except end;


             caption := 'Controle Financeiro';

          elocalizar.Text := '  ';
          filtroexecute(self);
          elocalizar.Text := '%';


          if fileexists(PChar(ExtractFilePath(ParamStr(0)) + 'imagem\barra.jpg')) then
                              imagepanel('imagemenu1', altop, panel1,
                             (PChar(ExtractFilePath(ParamStr(0)) + 'imagem\barra.jpg')),nil);


end;

procedure Tffinanceiro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fdm.tbquery2.Filtered := false;
  Release;
  ffinanceiro := nil;

end;

procedure Tffinanceiro.DBGrid1TitleClick(Column: TColumn);
begin
     indexar(Column, tabela, nil, elocalizar, label2);
end;

procedure Tffinanceiro.elocalizarKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin

            if (key = 40) or (key = 34)  then
              tabela.Next;
            if (key = 38) or (key = 33) then
              tabela.prior;

            if key = 13 then
               filtroexecute(self);
end;

procedure Tffinanceiro.elocalizarChange(Sender: TObject);
begin      
       if Active then
        loctabela(tabela,nil,elocalizar);
end;

procedure Tffinanceiro.elocalizarKeyPress(Sender: TObject; var Key: char);
begin
           if (tabela.fieldbyname(indtz(tabela.IndexFieldNames)).ClassName = 'TIntegerField') or
              (tabela.fieldbyname(indtz(tabela.IndexFieldNames)).ClassName = 'TFloatField')  then
              if not (key in ['0'..'9', #8,',']) then abort;

           if (tabela.fieldbyname(indtz(tabela.IndexFieldNames)).ClassName = 'TDateField')  then
              if not (key in ['0'..'9', #8,'/']) then abort;
end;

procedure Tffinanceiro.elocalizarEnter(Sender: TObject);
begin
  elocalizar.Color := clinfobk;
end;

procedure Tffinanceiro.elocalizarExit(Sender: TObject);
begin
  elocalizar.Color := clwhite;
end;

procedure Tffinanceiro.codfabricanteExecute(Sender: TObject);
begin
  elocalizar.Clear;
  tabela.IndexFieldNames := 'codigofornecedor';
  elocalizar.SetFocus;
  label2.Caption := 'Localizar por C�d. Fab.';
end;

procedure Tffinanceiro.filtroExecute(Sender: TObject);
var
  localizar,filtro,indice,tp,pago,cpplano,scr2: string;
begin
        rmensalidades.Checked := false;

        ds.DataSet.Filtered:=false;
        fechatg;
                          
        if plano then cpplano := ',  if(tp="0","CDC", '+
                                 '  if(tp="1","CONSIG",'+
                                 '  if(tp="2","CART C",'+
                                 '  if(tp="3","BOLETO",'+
                                 '  if(tp="4","MENSAL",'+
                                 '  if(tp="5","ADIANT", '+
                                 '  if(tp="6","CRED PESSOAL",'+
                                 '  if(tp="7","GNATUS",'+
                                 '  if(tp="8","CART D",'+
                                 '  if(tp="9","CHEQUE", "tp")))))))))) as Modalidades';

        if tabela.IndexFieldNames='' then
            tabela.IndexFieldNames := 'nome';
           indice := indtz(tabela.IndexFieldNames);


  tabela.Filtered := false;
  if rcampo.ItemIndex = 0 then
     localizar:=  quotedstr(elocalizar.Text + '%')
  else
     localizar:=  quotedstr('%'+elocalizar.Text + '%');

  filtro := ' and ' + indice + ' like ' +localizar;



        if rtipo.ItemIndex>0 then
           tp := ' and tp= '+ quotedstr(inttostr(rtipo.ItemIndex-1));

        if rpg.ItemIndex=0 then
           tp :=tp + ' and tp2 is null '
        else if rpg.ItemIndex=2 then
           tp := tp + ' and tp2= "1" '
        else if rpg.ItemIndex=3 then
           tp := tp + ' and (tp2= "1") or (tp2 is null) ';


        if (rpg.ItemIndex=0) or (rpg.ItemIndex=2) then
           pago:='p';

        script := 'select  tbfinanceiro'+pago+'.* '+cpplano+'  from tbfinanceiro'+pago+' where chave > 0 ';

        if pago <> '' then scr2 :=dtfin;

        sqld.sql.Clear;
        sqld.SQL.Add(script + scr2+ filtro + tp);
        //debugstr(sqld);
        tabela.close;
        tabela.Open;

        formatarexecute(self);

        lqtd.Caption := inttostr(tabela.RecordCount) + ' Contas:';
        totalExecute(self);
end;

procedure Tffinanceiro.btnnovoClick(Sender: TObject);
var
st,campo,imp,codigo,total:string;
begin

              permissao(PN,'PN','Financeiro');

              imp :='2';
              inputquery('Tipo de conta','1 = Cheque:'+#13+'2 = Outros',imp);
              if (imp <>'1') and (imp <>'2') then imp :='2';


              if imp = '1' then begin
                 codigo := msgi('Digite (s� n�meros): O C�digo, ou o CNPJ/CPF ou o Fone, ou as iniciais do nome para pesquisa',0);
                 listagem(achacp('nome',codigo),codigo,'',4,0);

                 if fdm.sg.Active = false then abort;

                 codigo := fdm.sg.fieldbyname('codigo').AsString;
                 fechatg;

                 total := msgi('Digite o valor total',2); if total = '' then abort;
                 vf := false;
                 contarecpg(strtoint(codigo),1,2,0,strtofloat(total),0, 0,date,'','v');


              end else begin

                    codigo := '';
                    if inputquery('Localiza Clientes','Digite o c�digo, ou o CNPJ/CPF(s� n�meros), ou as iniciais do nome do cliente:',st) then else abort;

                    campo :='nome';

                    if StrIsfloat(st)  then
                       if length(st) > 9 then begin
                          campo :='cnpj';
                          st :=  formatacpf_cnpj(st);
                       end else
                          campo :='codigo';

                    listagem(campo,st,' and ctp is null ',4,0);

                    if fdm.sg.Active then begin
                       codigo := fdm.sg.fieldbyname('codigo').AsString;
                       nome := fdm.sg.FieldByName('nome').AsString;
                       socio := fdm.sg.FieldByName('socio').AsString;
                       promocao := fdm.sg.FieldByName('promocao').AsString;
                       nbanco := fdm.sg.FieldByName('nbanco').AsString;
                       codigogp := fdm.sg.fieldbyname('codigogp').AsString;
                       carteira := fdm.sg.fieldbyname('msn').AsString;
                       gp_ := fdm.sg.fieldbyname('gp').AsString;
                       mov := fdm.sg.fieldbyname('mov').AsString;


                       fechatg;


                 if codigo = '' then
                    msg('#Verifique o cadastro deste cliente',0);

                    application.CreateForm(tffinanceirovalor,ffinanceirovalor);

                    ffinanceirovalor.codigo := codigo;
                    ffinanceirovalor.nome := nome;
                    ffinanceirovalor.socio := socio;
                    ffinanceirovalor.promocao := promocao;
                    ffinanceirovalor.nbanco := nbanco;
                    ffinanceirovalor.codigogp := codigogp;
                    ffinanceirovalor.carteira := carteira;
                    ffinanceirovalor.gp_ := gp_;
                    ffinanceirovalor.mov := mov;

                    ffinanceirovalor.canal := 'POS';
                    ffinanceirovalor.ura := TRUE;
                    ffinanceirovalor.showmodal;

                    //filtroExecute(self);
                    //tabela.Last;
                    GALTERA('17',tabela.fieldbyname('documento').asstring,'i');
               end;
           end;
end;

procedure Tffinanceiro.tcExecute(Sender: TObject);
begin
  btnnovoClick(self);
end;

procedure Tffinanceiro.btnapagarClick(Sender: TObject);
var
pago:string;
begin

        if (rpg.ItemIndex=0) or(rpg.ItemIndex=2) then  pago:='p';

        permissao(PD,'PD','Financeiro');
        abortaacao(tabela,nil,'chave','','','','',0);

       if Pred(dbgrid1.SelectedRows.Count) < 0 then msg('#Voc� precisa selecionar (CTRL) a(s) parcela(s)!',0);


        if msg('',1) then begin

           GALTERA('17',tabela.fieldbyname('documento').asstring,'d');

          filtrar(dbgrid1,tabela,nil,'chave');

          tabela.First;
          while not tabela.Eof do begin
             selecione( 'delete from tbfinanceiro'+pago+' where chave =  ' +
                         QuotedStr(tabela.FieldByName('chave').AsString));
             tabela.next;
          end;

          tabela.Filtered:= false;
          tabela.cancel;
          tabela.refresh;
          totalExecute(self);
  end;
end;

procedure Tffinanceiro.btnimprimirClick(Sender: TObject);
var
loc,imp,indice:string;

lt:tstringlist;
begin

  abortaacao(tabela,nil,'chave','','','','',0);

  if tabela.IndexFieldNames  <> '' then
           indice := indtz(tabela.IndexFieldNames);

        imp:='1';
        if inputquery('Imprimir', 'Digite uma op��o de impress�o:' + #13 + #13 +
                      '1 = Conta(s) selecionada(s) '+#13+
                      '2 = Gr�fico '+#13+
                      '3 = Envia E-Mail '+#13+
                      '4 = Fluxo de caixa'+#13+
                      'Esc = Cancela ', imp) then  else abort;

    loc:= tabela.fieldbyname('chave').AsString;
    if ds.DataSet.Filtered = true then else filtrar(DbGrid1,tabela,nil,'chave');


          if imp = '1' then
             impgrade(tabela,nil,ds,dbgrid1,'Financeiro', 'Financeiro','',true)

          else if imp = '2'  then
             graficoExecute(self)

          else if imp = '3'  then
             envemailExecute(self)

          else if imp='4' then begin

             plano := imp = '4';
             if imp = '4' then filtroexecute(self);

             lt := tstringlist.Create;
             lt.Assign(sqld.SQL);

             with fdm.Query1 do begin
                  close;
                  sql.Clear;
                  sql.Add(lt.Text);
                  fdm.tbquery1.Close;
                  fdm.tbquery1.IndexFieldNames := 'modalidades';
                  fdm.tbquery1.open;
                  //debugstr(fdm.Query1);
             end;

             reltb(fdm.tbquery1,'Plano de contas','','VrCliente','LiqEmpresa','Adiantamento','TotalEmpresa','','','','','','','','','');
             plano := false;
             fdm.tbquery1.IndexFieldNames := '';
             fdm.tbquery1.Close;
             if imp = '4' then filtroexecute(self);
          end;


   tabela.filtered := false;

   tabela.locate('chave',loc,[]);
   tabela.IndexFieldNames:=indice;

end;

procedure Tffinanceiro.FormCreate(Sender: TObject);

begin

 //permissoes
            PN := sqlacesso.fieldbyname('inserir').AsString;
            PA :=sqlacesso.fieldbyname('alterar').AsString;
            PD := sqlacesso.fieldbyname('apagar').AsString;
            PC := sqlacesso.fieldbyname('consultar').AsString;
            sqlacesso.Destroy;


end;

procedure Tffinanceiro.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 39 then
  begin
    SendMessage(dbgrid1.Handle, WM_HSCROLL, SB_LINERIGHT, 0);
    Abort;
  end;

  //esquerda
  if key = 37 then
  begin
    SendMessage(dbgrid1.Handle, WM_HSCROLL, SB_LINELEFT, 0);
    Abort;
  end;

end;

procedure Tffinanceiro.formatarExecute(Sender: TObject);
begin
    tabela.FieldByName('dtvencimento').EditMask :='99/99/9999';
    tabela.FieldByName('dtemissao').EditMask :='99/99/9999';
    tabela.FieldByName('dtpagamento').EditMask :='99/99/9999';

    (tabela.FieldByName('codigo') as tintegerfield).displayformat := '000000';

    (tabela.FieldByName('vrtitulo') as tfloatfield).displayformat := '###,##0.00';
    (tabela.FieldByName('vrcliente') as tfloatfield).displayformat := '###,##0.00';
    (tabela.FieldByName('LiqEmpresa') as tfloatfield).displayformat := '###,##0.00';
    (tabela.FieldByName('adiantamento') as tfloatfield).displayformat := '###,##0.00';
    (tabela.FieldByName('totalempresa') as tfloatfield).displayformat := '###,##0.00';
    (tabela.FieldByName('LiqBanco') as tfloatfield).displayformat := '###,##0.00';
    (tabela.FieldByName('cpmf') as tfloatfield).displayformat := '###,##0.00';
    (tabela.FieldByName('txem') as tfloatfield).displayformat := '###,##0.00';
    (tabela.FieldByName('txbc') as tfloatfield).displayformat := '###,##0.00';
    (tabela.FieldByName('vrem') as tfloatfield).displayformat := '###,##0.00';
    (tabela.FieldByName('vrbc') as tfloatfield).displayformat := '###,##0.00';
    (tabela.FieldByName('retorno') as tfloatfield).displayformat := '###,##0.00';


end;

procedure Tffinanceiro.focusExecute(Sender: TObject);
begin
        if rcampo.ItemIndex = 0 then
           rcampo.ItemIndex :=1
        else
           rcampo.ItemIndex:= 0;

       elocalizar.SetFocus;

end;

procedure Tffinanceiro.totalExecute(Sender: TObject);
var
liqempresa,liqbanco,qtd:double;
begin
    tabela.First;
    tabela.DisableControls;
    liqempresa :=0;
    liqbanco:=0;
    qtd:=0;

    while not tabela.Eof do begin
           liqempresa:=liqempresa  + tabela.fieldbyname('liqempresa').AsFloat;
           liqbanco:=liqbanco  + tabela.fieldbyname('liqbanco').AsFloat;
           qtd:=qtd  + 1;
           tabela.Next;
    end;
    tabela.First;

    tabela.EnableControls;

    lbc.caption := format('%n',[liqbanco]);
    lemp.caption := format('%n',[liqempresa]);

end;

procedure Tffinanceiro.btndeletadoClick(Sender: TObject);
begin
       if Pred(dbgrid1.SelectedRows.Count) < 0 then
       begin
            Application.MessageBox('Voc� precisa selecionar (CTRL) a(s) parcela(s)!', 'Aten��o', 0 + MB_ICONerror);
            abort;
       end;

        baixa_estorna(1,dbgrid1,tabela,nil,'');
        lqtd.Caption := inttostr(tabela.RecordCount) + ' Contas:';
        totalExecute(self);
end;

procedure Tffinanceiro.Label14Click(Sender: TObject);
begin

         cadp ('tbcontaposicao', '', '',       //tabela que vai usar ou cod sql na 2� + titulo
              'descricao','',           //campos que nao devem duplicar
              '','','',                 //combo1(campo,tabela,nomecampotabela)
              '','','',                 //combo2(campo,tabela,nomecampotabela)
              '','','',
              'codigo',                     //campo auto incremento
              '',                       //campo auto incremento
              '',                       //campo que nao ser nulo
              '',              
              3,0);                       //onde vai comecar a criar os campos + link

end;

procedure Tffinanceiro.sqldAfterScroll(DataSet: TDataSet);
begin
{        if tabela['bloq'] <> null then
           Bloquearparcela1.Caption := 'Desbloquear parcela'
        else
           Bloquearparcela1.Caption := 'Bloquear parcela';}
end;

procedure Tffinanceiro.pgExecute(Sender: TObject);
begin
        SpeedButton1Click(self);
end;

procedure Tffinanceiro.bfiltroClick(Sender: TObject);
begin
                filtroExecute(self);
end;

procedure Tffinanceiro.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if (Column.FieldName = 'dtvencimento') or
     (Column.FieldName = 'codigo')  then
    with DBGrid1.Canvas do
    begin

    if (tabela.FieldByName('dtvencimento').AsDateTime < date) and
       (tabela['tp']=4) and (rpg.ItemIndex=1) then begin
        Font.Color := clred;
        font.Style := font.Style +[fsbold];

    end else if tabela['flag1'] <> null then begin
        Font.Color := clPurple;
        font.Style := font.Style +[fsbold];

    end else if tabela['bloq'] <> null then begin
        Font.Color := $00004080;
        font.Style := font.Style +[fsbold];

    end else begin
        Font.Color := clblack;
        font.Style := font.Style - [fsbold];
    end;            

  FillRect(Rect);
  TextOut(Rect.Left+2,Rect.Top+2,Column.Field.DisplayText);
  end;

end;

procedure Tffinanceiro.graficoExecute(Sender: TObject);
var
imp,campo,grafico:string;
begin

        if tabela.IndexFieldNames <> '' then
           grafico:= tabela.IndexFieldNames
        else
           grafico:= 'nome';

        imp:='1';
        inputquery('Gr�fico', 'Gerar gr�fico do:' + #13 + #13 +
            '1 = Total' + #13 +
            '2 = A Receber ' + #13 +
            '3 = Recebido'
             ,imp);

        if (imp <>'1') and (imp <>'2') and (imp <>'3') then imp:='1';

        if imp ='1' then
           campo := 'total'
        else if imp ='2' then
           campo := 'diferenca'
        else if imp ='3' then
           campo := 'recebido';

//        fdm.gerafrafico(tabela,grafico,campo,'FINANCEIRO POR '+
  //                      uppercase(grafico) +' E '+ uppercase(campo));

end;

procedure Tffinanceiro.qpromissoriaBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
               fdm.tbempresa.Open;

               lnumero.Caption := 'N�: ' + tabela.fieldbyname('documento').AsString + ' '+
                                           tabela.fieldbyname('letra').AsString;
               lvalor.Caption := 'VALOR: ' + format('%n',[tabela.fieldbyname('total').asfloat]);

               lvencimento.caption := 'VENCIMENTO: ' + formatdatetime('dd',tabela.fieldbyname('dtvencimento').AsDateTime) +
                            ' DE ' +formatdatetime('mmmm',tabela.fieldbyname('dtvencimento').AsDateTime)+
                            ' DE '+formatdatetime('YYYY',tabela.fieldbyname('dtvencimento').AsDateTime);

               ldata.Caption := 'AOS '+
                                  uppercase(extenso(strtofloat(formatdatetime('dd',tabela.fieldbyname('dtvencimento').AsDateTime)),'','') +
                                   ' DE ' +formatdatetime('mmmm',tabela.fieldbyname('dtvencimento').AsDateTime)+
                                   ' DE ' +formatdatetime('yyyy',tabela.fieldbyname('dtvencimento').AsDateTime));


            Lmemo.Lines.Clear;

            lmemo.Lines.Add('A ' +fdm.tbempresa.fieldbyname('nome').AsString);
            lmemo.Lines.Add('OU SUA ORDEM, A QUANTIA DE ' + uppercase(extenso(tabela.fieldbyname('total').Asfloat,'Real','Reais'))+'***');
            lmemo.Lines.Add('EM MOEDA CORRENTE DESTE PA�S, PAG�VEL EM LOCAL DA EMISS�O');


            lcidade.Caption := fdm.tbempresa.fieldbyname('municipio').AsString+ ', '+
                            formatdatetime('dd',date)+ ' de '+
                            formatdatetime('mmmm',date)+ ' de '+
                            formatdatetime('yyyy',date)+ '.';
            fdm.tbempresa.Close;                

end;

procedure Tffinanceiro.rpgClick(Sender: TObject);
begin
//        elocalizar.Text :='#';
        filtroexecute(self);
        btndeletado.Enabled := rpg.ItemIndex =0;
        SpeedButton1.Enabled := (rpg.ItemIndex =1) or (rpg.ItemIndex =2) or (rpg.ItemIndex =3);
        Isentar1.Enabled := rpg.ItemIndex =1 ;
        elocalizar.SetFocus;
end;

procedure Tffinanceiro.SpeedButton3Click(Sender: TObject);
var
i:integer;
pago:string;
begin

        if (rpg.ItemIndex=0) or(rpg.ItemIndex=2) then
           pago:='p';

     if ffiltrocad = nil then begin
        ffiltrocad:=tffiltrocad.Create(self,tabela,sqld,'tbfinanceiro'+pago,name,dbgrid1,0);
        i:=0;

        criaRa('tp','0CDC','1Con','2Car','3Bol','4Men','5Adi','6Emp',i);
        i:=i+60;
        criaMa('dtemissao','Emitidos De: ',i,2);
        i:=i+20;
        criaMa('dtvencimento','Pagos de:',i,2);
        i:=i+20;
        criaMa('dtpagamento','Recebidos de:',i,2);
        i:=i+20;
        criaMCh('gp','Grupo Cart�o: ', 'tbcliente','gp',i,'');
        ffiltrocad.Show;

        end else
        ffiltrocad.Show;

        if tabela.Active then
           lqtd.Caption := inttostr(tabela.RecordCount)+ ' Itens';

end;

procedure Tffinanceiro.btnmenuClick(Sender: TObject);
begin
                menu.Popup(btnmenu.left+100,btnmenu.top+30);
end;

procedure Tffinanceiro.Emitidosdeumperodo1Click(Sender: TObject);
begin
        relatorio('financeiro','dtemissao','nome',
                                       'select chave, Tipoconta, Codigo,Nome, DtEmissao, DtVencimento, '+
                                       ' DtPagamento, VrCliente, LiqEmpresa,'+
                                       ' LiqBanco, TipoConta, Documento, Cliente '+
                                       ' from tbfinanceiro ',
                                       '',
                                       '',
                                       '',


                                        'VrCliente','LiqEmpresa','LiqBanco','','', '','','', '','','', '','','','','','','',
                                        'tbfinanceiro__',
                                        'Relat�rio de Contas por Emiss�o','tbfinanceiro',1,0);

end;

procedure Tffinanceiro.ComVencimentoem1Click(Sender: TObject);
begin
        relatorio('financeiro','dtvencimento','nome',
                                       'select chave, Tipoconta,Codigo,Nome, DtEmissao, DtVencimento, '+
                                       ' DtPagamento, VrCliente, LiqEmpresa,'+
                                       ' LiqBanco, TipoConta, Documento, Cliente '+
                                       ' from tbfinanceiro ',
                                       '',
                                       '',
                                       '',


                                        'VrCliente','LiqEmpresa','LiqBanco','','', '','','', '','','', '','','','','','','',
                                        'tbfinanceiro___',
                                        'Relat�rio de Contas por Vencimento/Pgto','tbfinanceiro',1,9);
end;

procedure Tffinanceiro.Relatrioporvencimentobanco1Click(Sender: TObject);
begin
        relatorio('financeiro','dtpagamento','nome',
                                       'select chave, Tipoconta,Codigo,Nome, DtEmissao, DtVencimento, '+
                                       ' DtPagamento, VrCliente, LiqEmpresa,'+
                                       ' LiqBanco, TipoConta, Documento, Cliente '+
                                       ' from tbfinanceiro ',
                                       '',
                                       '',
                                       '',


                                        'VrCliente','LiqEmpresa','LiqBanco','','', '','','', '','','', '','','','','','','',
                                        'tbfinanceiro_',
                                        'Relat�rio de Contas por Recb Bco','tbfinanceiro',1,0);
end;

procedure Tffinanceiro.SpeedButton1Click(Sender: TObject);
begin
       if Pred(dbgrid1.SelectedRows.Count) < 0 then
       begin
            Application.MessageBox('Voc� precisa selecionar (CTRL) a(s) parcela(s)!', 'Aten��o', 0 + MB_ICONerror);
            abort;
       end;

       periodo('inventario','finvr',188,369);
       baixa_estorna(0,dbgrid1,tabela,nil,'');
       lqtd.Caption := inttostr(tabela.RecordCount) + ' Contas:';
       totalExecute(self);
       dtpgto := strtodate('01/01/1900');
end;

procedure Tffinanceiro.FormActivate(Sender: TObject);
begin
        formatarexecute(self);
        totalExecute(self);        
end;

procedure Tffinanceiro.BaixarImprimirparcelas1Click(Sender: TObject);
begin
        relatorio('financeiro','dtvencimento','nome',
                   'select chave, Codigo,Nome,DtEmissao, DtVencimento, '+
                   ' DtPagamento, VrCliente, LiqEmpresa,'+
                   ' LiqBanco, TipoConta, Documento,Letra, Cliente, '+
                   ' VrTitulo,TxEm, TxBc, VrEm, VrBc, Retorno, tp,tp2,Flag, NBanco, Bloq, Bloqmotivo, Obs'+
                   ' from tbfinanceiro ',
                   '',
                   '',
                   '',
                   'VrCliente','LiqEmpresa','LiqBanco','','', '','','', '','','', '','','','','','','',
                   'tbfinanceiro',
                   'Relat�rio de Contas por Vencimento','tbfinanceiro',1,3);

        exportarparaosite1Click(self);

end;

procedure Tffinanceiro.DBGrid1DblClick(Sender: TObject);

      function fildataset(cp,Ent: string): string;
      var
        Bruto,text,fil: string;
        cont,i: integer;
      begin
        Bruto := Ent;
        fil:='';
        Result :='';

        for cont := 0 to length(Bruto) do begin

            if copy(bruto,cont,1) = ';' then
               i:=1;



            if i = 1 then begin
               fil := fil+ ' or '+cp+' = '+quotedstr(text);
               i:=0;
               text:='';
            end;

               if copy(bruto,cont+1,1)<>';' then
                  text := text + copy(bruto,cont+1,1);


        end;

        fil :=  '('+cp+' = '+ quotedstr(text) + fil+')';

        Result := fil;
      end;


var
loc,tp,st:string;
dt:tdate;
campo, valor,pago:string;
begin


        if rtipo.ItemIndex>0 then
           tp := ' and tp= '+ quotedstr(inttostr(rtipo.ItemIndex-1));


     if (dbgrid1.SelectedIndex = 0) or (dbgrid1.SelectedIndex = 1) then begin

         codloc := ds.DataSet.fieldbyname(dbgrid1.SelectedField.FieldName).AsString;

          st := msgi('Filtrar:'+#13+#13+ 'Digite o(a) '+dbgrid1.SelectedField.FieldName+' e tecle Enter:'+#13+#13+
                     'Obs: Voc� pode filtrar por mais de um item. Ex: Item1;Item2;Item3' ,0);
          ds.DataSet.Filtered := false;


          if dbgrid1.SelectedIndex = 1 then begin
             if (rpg.ItemIndex=0) or (rpg.ItemIndex=2) then  pago:='p';

               with sqld do begin
                  sql.Clear;
                  sql.Add('select * from tbfinanceiro'+pago+' where codigo = '+st);
                  tabela.close;
                  tabela.open;
                  formatarExecute(self);
               end;


          end else begin

                if ds.DataSet.Filter = '' then
                   ds.DataSet.Filter   := fildataset(dbgrid1.SelectedField.FieldName,st)
                else
                   ds.DataSet.Filter   := ds.DataSet.Filter + ' and ' +fildataset(dbgrid1.SelectedField.FieldName,st);

                ds.DataSet.Filtered := true;
                dbgrid1.DataSource :=nil;
                dbgrid1.DataSource :=ds;
          end;

     end else if (dbgrid1.SelectedIndex = 3) then begin
        abortaacao(tabela,nil,'chave','','','','',0);
        dt := strtodate(msgi('Digite o vencimento:',1));
         selecione('update tbfinanceiro'+tp+' set dtvencimento = '+ quotedstr(formatdatetime('yyyy-mm-dd',dt))+
                   ' where chave ='+ quotedstr(tabela.fieldbyname('chave').AsString))



     end else if (dbgrid1.SelectedIndex >= 6) and  (dbgrid1.SelectedIndex <= 14) then begin

        valor:=  tabela.fieldbyname(dbgrid1.SelectedField.FieldName).AsString;
        if valor = '' then valor := '0';
        campo:= dbgrid1.SelectedField.FieldName;

        valor := tabela.fieldbyname(campo).AsString;

        if inputquery(pchar('Alterar ' + campo),'Digite o novo valor:',valor) then begin

           if StrIsFloat(valor) = false then begin
              Application.MessageBox('O valor digitado n�o � um n�mero v�lido!', 'Erro', 0 + MB_ICONerror);
              abort;
           end;

           selecione('update tbfinanceiro'+tp+' set ' + campo +' = '+ realdblstr(strtofloat(valor))+
                     ' where chave ='+ quotedstr(tabela.fieldbyname('chave').AsString));
       end;
     end;

         loc:=tabela.fieldbyname('chave').asstring;
         tabela.cancel;
         tabela.refresh;
         try
         tabela.Locate('chave',loc,[]);
         except end;

end;

procedure Tffinanceiro.SpeedButton2Click(Sender: TObject);
var
st:string;

begin
            abortaacao(tabela,nil,'chave','','','','',0);
            st := '1';
            if inputquery('Altrar Valor', 'Digite o valor da empresa:', st) then else abort;

              if StrIsfloat(st) = False then  begin
                Application.MessageBox('O n�mero n�o � v�lido!',
                                       'Erro', 0 + MB_ICONerror);
                abort;
              end;

              selecione('update tbfinanceiro set LiqEmpresa = (LiqEmpresa + ' + realdblstr(strtofloat(st))+
                        ') where chave = '+ tabela.fieldbyname('chave').AsString);

              st := tabela.fieldbyname('chave').AsString;
              tabela.Cancel;
              tabela.refresh;
              tabela.Locate('chave',st,[]);
end;



procedure Tffinanceiro.Isentar1Click(Sender: TObject);
begin
       if Pred(dbgrid1.SelectedRows.Count) < 0 then
       begin
            Application.MessageBox('Voc� precisa selecionar (CTRL) a(s) parcela(s)!', 'Aten��o', 0 + MB_ICONerror);
            abort;
       end;

        baixa_estorna(3,dbgrid1,tabela,nil,'');
        lqtd.Caption := inttostr(tabela.RecordCount) + ' Contas:';
        totalExecute(self);
end;

procedure Tffinanceiro.Clientes1Click(Sender: TObject);
begin

       acesso1('cliente');
       application.CreateForm(tfclientelocaliza,fclientelocaliza);
       fclientelocaliza.showmodal;;

//        cadg('cliente',cadcli,'nome', 4);
end;

procedure Tffinanceiro.Bloquearparcela1Click(Sender: TObject);
var
st,st2, filtro:string;
i:integer;
begin
        if rpg.ItemIndex = 0 then
           msg('#Voc� s� pode bloquear parcela n�o paga.',0);

       if Pred(dbgrid1.SelectedRows.Count) < 0 then
          msg('#Voc� n�o tem itens selecionados.',0);

     filtro := '';
     with DbGrid1 do  begin
       for i := 0 to Pred(SelectedRows.Count) do    begin
          DataSource.DataSet.Bookmark := SelectedRows[i];

          if filtro = '' then
             filtro := ' where chave = ' + quotedstr(DataSource.DataSet.fieldbyname('chave').AsString)
          else filtro := filtro + ' or chave = ' + quotedstr(DataSource.DataSet.fieldbyname('chave').AsString);
     end;
    end;


       // if Bloquearparcela1.Caption = 'Desbloquear parcela' then begin
         //  st := ' bloq = null, bloqmotivo = null ';
       // end else begin
           inputquery('Bloquear','Digite o motivo:',st2);
           st := ' bloq = "S", bloqmotivo = '+quotedstr(st2);
       // end;

        selecione('update tbfinanceiro set '+st+filtro);
        st := tabela.fieldbyname('chave').AsString;

        tabela.Cancel;
        tabela.Refresh;
        tabela.Locate('chave',st,[]);
end;

procedure Tffinanceiro.envemailExecute(Sender: TObject);
var
block,nome,email,nm,dtvenc:string;
total, totdata:double;
st:tstringlist;

          procedure ncli;
          begin
                numcoluna :=80;
                //seleciona os dados do cliente
                selecione('select email,nome from tbcliente '+
                          ' where codigo = ' + quotedstr(tabela.fieldbyname('codigo').AsString));

                email := sqlpub.fieldbyname('email').AsString;
                nm := sqlpub.fieldbyname('nome').AsString;

                sqlpub:=nil;
                st.add('Nome: ' + tabela.fieldbyname('nome').AsString);
                st.Add(' ');
                st.Add(' ');

                st.Add('Vencimento: '+tabela.fieldbyname('dtvencimento').AsString);
                st.Add('------------------------');
                st.Add(compstr('    VrTitulo       VrCliente', 'Tipo/QtdParc/Cliente    OBS:'));
                st.Add('--------------------------------------------------------------------------------');

                nome:= tabela.fieldbyname('nome').AsString;
                dtvenc := tabela.fieldbyname('dtvencimento').AsString;
          end;



          procedure vrcli;
          begin
                    numcoluna :=80;
                    if tabela.fieldbyname('vrcliente').asfloat >0 then begin

                       if dtvenc <> tabela.fieldbyname('dtvencimento').AsString then begin
                          numcoluna :=32;
                          st.Add(compstr('------------','------------'));
                          st.add(compstr('Total',format('%n',[totdata])));
                          numcoluna :=80;
                          st.Add(' ');
                          st.Add(' ');
                          st.Add('Vencimento: '+tabela.fieldbyname('dtvencimento').AsString);
                          st.Add('------------------------');
                          st.Add(compstr('    VrTitulo       VrCliente', 'Tipo/QtdParc/Cliente    OBS:'));
                          st.Add('--------------------------------------------------------------------------------');

                          dtvenc := tabela.fieldbyname('dtvencimento').AsString;
                          totdata:=0;
                          numcoluna :=80;
                       end;

                       if tabela['bloq'] = 'S' then
                          block := ' - Parc bloqueada: '+tabela.fieldbyname('bloqmotivo').AsString
                       else block := '';


                       st.add( compstr(direita(' ', format('%n',[tabela.fieldbyname('vrtitulo').asfloat]),13)+  '  '+
                               direita(' ', format('%n',[tabela.fieldbyname('vrcliente').asfloat]),13),
                               copy(tabela.fieldbyname('tipoconta').AsString,1,15)+'  '+
                               copy(tabela.fieldbyname('letra').AsString,1,3)+ '  '+
                               tabela.fieldbyname('cliente').AsString + block));

                       if tabela['bloq'] = null then begin
                          total := total + tabela.fieldbyname('vrcliente').asfloat;
                          totdata := totdata + tabela.fieldbyname('vrcliente').asfloat;
                       end;

                       //showmessage(st.Text);
                    end;
end;

begin

                tabela.IndexFieldNames:= 'nome;dtvencimento';
                tabela.First;
                st := tstringlist.Create;
                ncli;
                nome := tabela.fieldbyname('nome').AsString;
                dtvenc := tabela.fieldbyname('dtvencimento').AsString;


                while not tabela.Eof do begin

                     if nome <> tabela.fieldbyname('nome').AsString then begin
                          numcoluna :=32;
                          st.Add(compstr('------------','------------'));
                          st.add(compstr('Total',format('%n',[totdata])));
                          st.add('______________________________');
                          st.add(compstr('TOTAL GERAL',format('%n',[total])));

                        if email ='' then
                           email := 'sememail@';

                        if total >0 then
                        sendMail(nm,
                                 email,
                                 nm,
                                 email,
                                 'Pgto Vitalcred',
                                 st.Text,
                                 '',false);
                        total   := 0;
                        totdata := 0;
                        st.Clear;

                        ncli;
                        vrcli;
                end else begin
                    vrcli;
                end;

                tabela.Next;
             end;


             //if total >0 then begin
                       numcoluna :=32;
                          st.Add(compstr('------------','------------'));
                          st.add(compstr('Total',format('%n',[totdata])));
                          st.add('______________________________');
                          st.add(compstr('TOTAL GERAL',format('%n',[total])));


                if email ='' then
                   email := 'sememail@';

                        sendMail(nm,
                                 email,
                                 nm,
                                 email,
                                 'Pgto Vitalcred',
                                 st.Text,
                                 '',false);
                   total   := 0;
                   totdata := 0;

           // end;

end;

procedure Tffinanceiro.Desbloquearparcela1Click(Sender: TObject);
var
st, filtro:string;
i:integer;
begin
        if rpg.ItemIndex = 0 then
           msg('#Voc� s� pode bloquear parcela n�o paga.',0);

       if Pred(dbgrid1.SelectedRows.Count) < 0 then
          msg('#Voc� n�o tem itens selecionados.',0);

     filtro := '';
     with DbGrid1 do  begin
       for i := 0 to Pred(SelectedRows.Count) do    begin
          DataSource.DataSet.Bookmark := SelectedRows[i];

          if filtro = '' then
             filtro := ' where chave = ' + quotedstr(DataSource.DataSet.fieldbyname('chave').AsString)
          else filtro := filtro + ' or chave = ' + quotedstr(DataSource.DataSet.fieldbyname('chave').AsString);
     end;
    end;


        //if Bloquearparcela1.Caption = 'Desbloquear parcela' then begin
           st := ' bloq = null, bloqmotivo = null ';
      //  end else begin
        //   inputquery('Bloquear','Digite o motivo:',st2);
          // st := ' bloq = "S", bloqmotivo = '+quotedstr(st2);
//        end;

        selecione('update tbfinanceiro set '+st+filtro);
        st := tabela.fieldbyname('chave').AsString;

        tabela.Cancel;
        tabela.Refresh;
        tabela.Locate('chave',st,[]);

end;

procedure Tffinanceiro.SpeedButton4Click(Sender: TObject);
var
cam,taxa,loc,data,link,desc,imp:string;
qtdia,pc,pcdesc,ndoc:integer;
list:tstringlist;
baixar,retencao :boolean;
i:integer;
fator, B, C, D,E,adiant,vrdesc,vrat,perc,txparcela,totgel:double;

        procedure contas;
        begin
               B := fdm.tbquery1['B'];
               C := fdm.tbquery1['C'];
               D := fdm.tbquery1['D'];
               E := fdm.tbquery1['E'];
        end;


begin

        abortaacao(tabela,nil,'chave','','','','',0);
        loc := tabela.fieldbyname('chave').AsString;
        fator :=0;

        if rpg.ItemIndex <> 1 then
           msg('#Apenas n�o pago pode fazer antecipa��o.',0);


        codloc:=datetostr(now);
        data := msgi('Data do pagamento:',1);
        codloc :='1';
        retencao := msgi('Escolha:'+#13+#13+'1 = Antecipa��o'+#13+'2 = Reten��o',2) = '2';


        totgel:=0;

        vf:=false;
        periodo2('vitalcred',tabela.fieldbyname('codigo').AsString,data,'','','',360,395,1);
        if not vf  then abort;
        vf:=false;

        numcoluna :=40;
        codloc :='1';
        imp := msgi('1 = Visualizar o total'+#13+'2 = Processar o adiantamento',2);

        if not (strtoint(imp) in [1,2]) then abort;
        baixar := imp='2';

        if baixar then senhagerencial('Financeiro','DIGITE A SENHA GERENCIAL:', 'Liberar antecipa��o');

        list := tstringlist.Create;
        list.Add('C�lculo cliente: ' + tabela.fieldbyname('nome').AsString);
        list.Add(compstr('Pgto em ' ,data ));
        list.Add('----------------------------------------');
        list.Add('');

        fdm.tbquery2.First;
        while not fdm.tbquery2.Eof do begin

              tabela.Filter := 'bloq is null and documento = ' + fdm.tbquery2.fieldbyname('documento').AsString;
              tabela.Filtered := true;

              pc := 0;
              vrdesc :=0;
              vrat:=0;
              pcdesc :=0;

              //cheque
              if tabela.FieldByName('tp').AsString='9' then begin
                 qtdia := trunc(tabela.fieldbyname('dtvencimento').AsDateTime - strtodate(data));
                 if qtdia > 30 then
                    pc :=  (qtdia div 30)+1
                 else pc :=  1;
                 vrdesc := vrdesc + tabela.fieldbyname('vrcliente').AsFloat;
                 

              //ANTECIPACAO ou RETENCAO
              end else begin
                    tabela.First;
                    while not tabela.Eof do begin

                          if ((strtodate(data) <> date) and
                              (strtodate(data) <= tabela.fieldbyname('dtvencimento').AsDateTime)) or
                             ((strtodate(data) = date) and
                              (strtodate(data) < tabela.fieldbyname('dtvencimento').AsDateTime)) then begin
                             vrdesc := vrdesc + tabela.fieldbyname('vrcliente').AsFloat;
                             pc := pc + 1;

                          end else
                             vrat := vrat + tabela.fieldbyname('vrcliente').AsFloat;



                          tabela.Next;
                    end;

                    if vrdesc <=0 then begin
                       tabela.Filtered := false;
                       msg('#N�o h� valor para adiantar nesta data.',0);
                    end;
               end;



              link :='';
              with fdm.Query1 do begin
                   sql.Clear;
                   if retencao then
                      sql.Add('select chave,taxa from tbconffin where tp = 9 and conta = "S"')
                   else
                      sql.Add('select chave,taxa from tbconffin where tp = 9 and (conta = "N" or conta is null)');
                   open;

                   while not eof do begin
                      if link = '' then
                         link := ' and ( link = '+ quotedstr(fieldbyname('chave').asstring)
                      else
                         link := link + ' or link = '+quotedstr(fieldbyname('chave').asstring);
                      next;
                   end;

                   if link <> '' then link := link + ') ';

                   if fator = 0 then begin
                      fator := fieldbyname('taxa').AsFloat;
                      codloc := floattostr(fator);
                      fator := strtofloat(msgi('Confirme o fator/juro: ' ,2));
                   end;



                   sql.Clear;

                   if pc = 1 then
                      sql.Add('select percent from tbconffini where qt=1 '+link+' and qtdini <= ' + realdblstr(vrdesc))
                   else
                      sql.Add('select percent from tbconffini where qt>1 '+link+' and qtdini <= ' + realdblstr(vrdesc));

                   fdm.Query1.Open;
                   fdm.Query1.Last;
                   taxa := fdm.Query1.fieldbyname('percent').AsString;
                   if taxa = '' then taxa := '15';

                   sql.Clear;
                   sql.Add('select taxa as A, taxa as B, taxa as C, taxa as D, taxa as E from tbconffin limit 0');
                   fdm.tbquery1.Close;
                   fdm.tbquery1.Open;
              end;


              if fator <=0 then begin
                 msg('O fator deve ser maior que 0.',0);
                 tabela.Filtered := false;
                 abort;
              end;

              i:=1;

              fdm.tbquery1.Insert;
              fdm.tbquery1['A'] :=1;
              fdm.tbquery1['B'] :=1;
              fdm.tbquery1['C'] :=fator/100;
              fdm.tbquery1['D'] :=fator/100;
              fdm.tbquery1['E'] :=fator;
              fdm.tbquery1.Post;


              for i := 2 to 10 do begin
                  contas;

                  fdm.tbquery1.Insert;
                  fdm.tbquery1['A'] := i;
                  fdm.tbquery1['B'] :=b+d;
                  fdm.tbquery1['C'] :=c;
                  fdm.tbquery1['D'] := fdm.tbquery1.fieldbyname('b').AsFloat *
                                       fdm.tbquery1.fieldbyname('c').AsFloat;
                  fdm.tbquery1['E'] := (fdm.tbquery1.fieldbyname('d').AsFloat+(e/100))*100;
                  fdm.tbquery1.Post;

              end;


              fdm.tbquery1.IndexFieldNames := 'A';
              if not fdm.tbquery1.Locate('A',inttostr(pc),[]) then
                 fdm.tbquery1.Last;
              e:=fdm.tbquery1.fieldbyname('e').AsFloat;



              if retencao then begin
                 //txparcela := pc *2;
                 case pc of
                      1: e:= 8.5;
                      2: e:= 11.54;
                      3: e:= 14.16 ;
                      4: e:= 16.84;
                      5: e:= 19.59;
                      6: e:= 22.4;
                      7: e:= 25.29;
                      8: e:= 28.25;
                      9: e:= 31.28;
                      10: e:= 34.38;
                 end;

              end;



              desc :=  floattostr((vrdesc * (e)/100)+strtofloat(taxa)+txparcela);

              list.Add('Valores: ' + tabela.fieldbyname('cliente').AsString);
              list.Add('');

              list.Add(compstr('Fator ', format('%n',[fator])));
              list.Add(compstr('Base Adiant ',format('%n',[vrdesc])));
              list.Add(compstr('Valor n/Desc',format('%n',[vrat])));
              list.Add(compstr('Tot Cliente',format('%n',[vrat+vrdesc])));
              list.Add('');
              list.Add(compstr('Taxa a Desc R$',format('%n',[strtofloat(taxa)+txparcela])));
              list.Add(compstr('Percent/Calc %',format('%n',[e])));
              list.Add(compstr('Taxa  +  Desc',format('%n',[strtofloat(desc)])));
              list.Add('');
              list.Add(compstr('Valor Cliente',format('%n',[vrat+vrdesc-strtofloat(desc)])));
              list.Add('----------------------------------------');
              list.Add('');
              list.Add('');

              totgel := totgel + vrat+vrdesc-strtofloat(desc);

              if baixar then begin
                    selecione('select nfinanceiro from tbconfig');
                    ndoc := sqlpub.fieldbyname('nfinanceiro').asinteger+1;
                    selecione('update tbconfig set nfinanceiro = '+quotedstr(inttostr(ndoc)));

                    selecione('Insert into tbfinanceiro(tipoconta, codigoconta, documento, '+
                              ' codigo, nome, dtemissao, dtvencimento, vrtitulo, vrcliente, '+
                              ' tp, obs, cliente, dtpagamento, nbanco, data) values ('+

                                   quotedstr(tabela.fieldbyname('tipoconta').AsString)+
                              ', '+quotedstr(tabela.fieldbyname('codigoconta').AsString)+
                              ', '+quotedstr(inttostr(ndoc))+
                              ', '+quotedstr(tabela.fieldbyname('codigo').AsString)+
                              ', '+quotedstr(tabela.fieldbyname('nome').AsString)+
                              ',now()'+
                              ','+quotedstr(formatdatetime('yyyy-mm-dd',strtodate(data)))+
                              ', '+realdblstr(vrdesc+vrat-strtofloat(desc))+
                              ', '+realdblstr(vrdesc+vrat-strtofloat(desc))+
                              ',5'+
                              ', '+quotedstr('ADIANTAMENTO')+
                              ', '+quotedstr(tabela.fieldbyname('cliente').AsString)+
                              ','+quotedstr(formatdatetime('yyyy-mm-dd',strtodate(data)))+
                              ', '+quotedstr(tabela.fieldbyname('nbanco').AsString)+
                              ',now())');

                    adiant := strtofloat(desc)/tabela.RecordCount;

                    tabela.First;
                    while not tabela.Eof do begin
                          selecione('update tbfinanceiro set '+
                                    'adiantamento = '+ realdblstr(adiant)+
                                    ', vrcliente = 0 '+
                                    ', totalempresa = if(LiqEmpresa is null,0,LiqEmpresa) + '+
                                    '                if(adiantamento is null,0,adiantamento)'+
                                    ' where chave = '+quotedstr(tabela.fieldbyname('chave').AsString));

                          tabela.Next;
                    end;
              end;


              fdm.tbquery2.Next;
        end;

        list.Add('');
        list.Add(compstr('SOMA GERAL = ',format('%n',[totgel])));

        cam := 'c:\'+formatnumeric(datetostr(now) + tabela.fieldbyname('nome').AsString)+'.txt';
        list.SaveToFile(cam);
        ShellExecute(Handle, 'open', pchar(cam), nil, '', Sw_Showmaximized);

        tabela.Filtered := false;
        fdm.tbquery2.Filtered := false;
        tabela.Cancel;
        tabela.Refresh;
        tabela.Locate('chave',loc,[]);
        fdm.tbquery1.IndexFieldNames := '';
        fdm.tbquery1.Close;
        fdm.tbquery2.Close;

end;





{        abortaacao(nil,tabela,'chave','','','','',0);
        loc := tabela.fieldbyname('chave').AsString;

        if rpg.ItemIndex <> 1 then
           msg('#Apenas n�o pago pode fazer antecipa��o.',0);

        tabela.Filter := 'documento = ' + quotedstr(tabela.fieldbyname('documento').AsString);
        tabela.Filtered := true;

        //filtrar(DbGrid1,nil,tabela,'chave');

        pc := tabela.RecordCount;
        totcli :=0;

        tabela.First;
        while not tabela.Eof do begin
              totcli := totcli + tabela.fieldbyname('vrcliente').AsFloat;
              tabela.Next;
        end;

        if totcli <=0 then begin
           tabela.Filtered := false;
           msg('#O valor do cliente n�o pode ser 0',0);
        end;

        vr := msgi('Valor atual do cliente: '+ format('%n',[totcli])+#13+#13+
                   'Digite o valor que o cliente vai receber:',2);

        if (vr='') or (strtofloat(vr)<=0) then abort;

        if strtofloat(vr) >= totcli then begin
           tabela.Filtered := false;
           msg('#O valor do cliente n�o pode ser maior que o total',0);
        end;

        codloc:=datetostr(now);
        data := msgi('Data do pagamento:',1);

        if strisdate(data)=false then begin
           tabela.Filtered := false;
           msg('#A data n�o � v�lida',0);
        end;
                                 
        selecione('select nfinanceiro from tbconfig');
        ndoc := sqlpub.fieldbyname('nfinanceiro').asinteger+1;
        selecione('update tbconfig set nfinanceiro = '+quotedstr(inttostr(ndoc)));

        selecione('Insert into tbfinanceiro(tipoconta, codigoconta, documento, '+
                  ' codigo, nome, dtemissao, dtvencimento, vrtitulo, vrcliente, '+
                  ' tp, obs, cliente, dtpagamento, nbanco, data) values ('+

                       quotedstr(tabela.fieldbyname('tipoconta').AsString)+
                  ', '+quotedstr(tabela.fieldbyname('codigoconta').AsString)+
                  ', '+quotedstr(inttostr(ndoc))+
                  ', '+quotedstr(tabela.fieldbyname('codigo').AsString)+
                  ', '+quotedstr(tabela.fieldbyname('nome').AsString)+
                  ',now()'+
                  ','+quotedstr(formatdatetime('yyyy-mm-dd',strtodate(data)))+
                  ', '+realdblstr(strtofloat(vr))+
                  ', '+realdblstr(strtofloat(vr))+
                  ',5'+
                  ', '+quotedstr('ADIANTAMENTO')+
                  ', '+quotedstr(tabela.fieldbyname('cliente').AsString)+
                  ','+quotedstr(formatdatetime('yyyy-mm-dd',strtodate(data)))+
                  ', '+quotedstr(tabela.fieldbyname('nbanco').AsString)+
                  ',now())');

        adiant := (totcli-strtofloat(vr))/pc;

        tabela.First;
        while not tabela.Eof do begin
              selecione('update tbfinanceiro set '+
                        'adiantamento = '+ realdblstr(adiant)+
                        ', vrcliente = 0 '+
                        ', totalempresa = if(LiqEmpresa is null,0,LiqEmpresa) + '+
                        '                if(adiantamento is null,0,adiantamento)'+
                        ' where chave = '+quotedstr(tabela.fieldbyname('chave').AsString));

              tabela.Next;
        end;

        tabela.Filtered := false;
        tabela.Cancel;
        tabela.Refresh;
        tabela.Locate('chave',loc,[]);}
procedure Tffinanceiro.Lanarmensalidades1Click(Sender: TObject);
var
 f,
 fp,
 sq5,
 sq15,
 sq25    : tzquery;
 anomes,
 ultdia  : string;
 fArq    : TextFile;

//lst:tstringlist;

  function lancado(codigo: string): boolean;
  begin
    result := f.Locate('codigo',codigo,[]);
    if not result then
      result := fp.Locate('codigo',codigo,[]);
   end;

  function dialanca(codigo: string;valor:double): integer;
  begin
    if (sq5.Locate('codigo',codigo,[])) and (sq5.FieldByName('valor').AsFloat >= valor)   then
      result := strtoint(formatdatetime('dd',sq5.fieldbyname('dtvencimento').AsDateTime))
    else
      if (sq15.Locate('codigo',codigo,[])) and (sq15.FieldByName('valor').AsFloat >= valor) then
        result := strtoint(formatdatetime('dd',sq15.fieldbyname('dtvencimento').AsDateTime))
      else
        if (sq25.Locate('codigo',codigo,[])) and (sq25.FieldByName('valor').AsFloat >= valor) then
          result := strtoint(formatdatetime('dd',sq25.fieldbyname('dtvencimento').AsDateTime))
        else
          result :=10;

    if DiaSemana(strtodate(inttostr(result)+'/'+formatdatetime('mm/yyyy',date))) = 'SABADO'  then
      result := result + 2;
    if DiaSemana(strtodate(inttostr(result)+'/'+formatdatetime('mm/yyyy',date))) = 'DOMINGO' then
      result := result + 1;
  end;


  procedure lanca;
  var
    vencimento : string;
    ndoc,
    diavenc    : integer;
  begin
    selecione('select nfinanceiro from tbconfig');
    ndoc := sqlpub.fieldbyname('nfinanceiro').asinteger+1;
    FazQuery('update tbconfig set nfinanceiro = '+quotedstr(inttostr(ndoc)));

    vencimento := formatdatetime('yyyy',date)+ '-'+ formatdatetime('mm',date)+
                  '-'+formatfloat('00', dialanca(fdm.Query1.fieldbyname('codigo').AsString,
                                                 fdm.Query1.fieldbyname('vrmensalidade').AsFloat));

    FazQuery( 'Insert into tbfinanceiro(tipoconta, documento, '+
              'codigo, nome, dtemissao, dtvencimento, vrtitulo, '+
              ' vrcliente, LiqEmpresa, tp, nbanco, data) values  ('+
              '"#MENSAL#"'+
              ','+inttostr(ndoc)+
              ','+quotedstr(fdm.Query1.fieldbyname('codigo').AsString)+
              ','+quotedstr(fdm.Query1.fieldbyname('nome').AsString)+
              ',now()'+
              ','+quotedstr(vencimento)+
              ','+realdblstr(fdm.Query1.fieldbyname('vrmensalidade').AsFloat)+
              ','+realdblstr(fdm.Query1.fieldbyname('vrmensalidade').AsFloat*(-1))+
              ','+realdblstr(fdm.Query1.fieldbyname('vrmensalidade').AsFloat)+
              ',4'+
              ','+quotedstr(fdm.Query1.fieldbyname('nbanco').AsString)+
              ',Now())');
    // Gleyber - 04/07/2012 - In�cio
    //LST.Add(fdm.Query1.fieldbyname('nome').AsString+'	'+
    //        vencimento+'	'+
    //        //formatdatetime('dd-mm-yyyy',strtodate(vencimento))+'	'+
    //        fdm.Query1.fieldbyname('vrmensalidade').AsString);
    Writeln(fArq,fdm.Query1.fieldbyname('nome').AsString+'	'+
            vencimento+'	'+
            fdm.Query1.fieldbyname('vrmensalidade').AsString);
    // Gleyber - 04/07/2012 - Fim
  end;

begin
  senhagerencial('Financeiro','DIGITE A SENHA GERENCIAL:', 'LAN�AR MENSALIDADES');

  // 1 SETEMBRO CANCELADOS NAO LANCAR E
  if not msg('Lan�ar mensalidades?',2) then
    abort;

  // Gleyber - 04/07/2012 - In�cio
  //lst := tstringlist.Create;
  //lst.Add('LAN�AMENTOS EFETUADOS');
  //lst.Add(' ');
  //lst.Add('Nome	Vencto	Valor');
  System.Assign(fArq,'c:\lanc.xls');

  Rewrite(fArq);

  Writeln(fArq,'LAN�AMENTOS EFETUADOS');
  Writeln(fArq,' ');
  Writeln(FArq,'Nome	Vencto	Valor');

  if not fdm.cdsLanc.Active then
    fdm.cdsLanc.CreateDataSet;

  f      := tzquery.Create(application);
  fp     := tzquery.Create(application);
  sq5    := tzquery.Create(application);
  sq15   := tzquery.Create(application);
  sq25   := tzquery.Create(application);
  anomes := formatdatetime('yyyy-mm',date);
  ultdia := IntToStr(UltimodoMes(StrToInt(formatdatetime('mm', date)), StrToInt(formatdatetime('yyyy', date))));


  //soma para ver se o cliente pode lancar
  with sq5 do
  begin
    Connection := fdm.conector;
    sql.Add('select codigo,dtvencimento, sum(vrcliente)as valor from tbfinanceiro '+
            'where dtvencimento between "'+anomes+'-01" and "'+anomes+'-07" group by codigo');
    open;
  end;

  with sq15 do
  begin
    Connection := fdm.conector;
    sql.Add('select codigo,dtvencimento, sum(vrcliente)as valor from tbfinanceiro '+
            'where dtvencimento between "'+anomes+'-08" and "'+anomes+'-17" group by codigo');
    open;
  end;

  with sq25 do
  begin
    Connection := fdm.conector;
    sql.Add('select codigo,dtvencimento, sum(vrcliente)as valor from tbfinanceiro '+
            'where dtvencimento between "'+anomes+'-18" and "'+anomes+'-'+ultdia+'" group by codigo');
    open;
  end;

  //seleciona financeiro nao baixado
  with f do
  begin
    Connection := fdm.conector;
    sql.Add('select codigo from tbfinanceiro where tipoconta = "#MENSAL#" '+
            ' and date_format(dtvencimento,"%m/%Y") = '+ quotedstr(formatdatetime('mm/yyyy',date)));
    open;
  end;

  //seleciona financeiro baixado
  with fp do
  begin
    Connection := fdm.conector;
    sql.Add('select codigo from tbfinanceiro where tipoconta = "#MENSAL#" '+
            ' and date_format(dtvencimento,"%m/%Y") = '+  quotedstr(formatdatetime('mm/yyyy',date)));
    open;
  end;

  //cliente
  with fdm.Query1 do
  begin
    sql.Clear;
    sql.Add('select c.nbanco,c.codigo, c.nome, c.diamensalidade, c.vrmensalidade from tbcliente c '+
            ' where c.vrmensalidade >0 and c.dtval <= now() and ctp is null and codigo >0 '+
            ' and (flag <> "D" or flag is null) and (np <> "C" or np is null)');
    open;

    while not eof do
    begin
      caption :='ANALISANDO/LAN�ANDO, ESPERE...     ' + inttostr(fdm.Query1.RecNo)+ ' DE '+inttostr(fdm.Query1.RecordCount);
      update;
      if not lancado(fieldbyname('codigo').AsString) then
        lanca;

      next;
    end;
  end;

  close;
  f.Destroy;
  fp.Destroy;
  sq5.Destroy;
  sq15.Destroy;
  sq25.Destroy;
  fdm.cdsLanc.Close;

  // Gleyber - 04/07/2012 - In�cio
  //lst.SaveToFile('c:\lanc.xls');
  //lst.Destroy;

  CloseFile(fArq);

  caption := 'Controle Financeiro';
  msg('Lan�adas.',0);

  // Gleyber - 04/07/2012 - Fim
  ShellExecute(Handle, 'open', pchar('c:\lanc.xls'), nil, '', Sw_Show);

end;

procedure Tffinanceiro.Importardosite1Click(Sender: TObject);
begin
         application.CreateForm(tffinanceirovalor,ffinanceirovalor);
         ffinanceirovalor.codigo := '1';
         ffinanceirovalor.FormShow(self);
         periodo2('vitalcred1','','','','','',500,800,1);
         ffinanceirovalor.Release;
end;

procedure Tffinanceiro.DBText5Click(Sender: TObject);
var
loc,st:string;
begin


          if rpg.ItemIndex <> 1 then abort;

          abortaacao(tabela,nil,'chave','','','','',0);

          codloc := tabela.fieldbyname('obs').AsString;
          st := msgi('Digite a observa��o:',0);


          selecione('update tbfinanceiro set obs = '+ quotedstr(st)+
                          ' where chave = '+quotedstr(tabela.fieldbyname('chave').AsString));

          loc := tabela.fieldbyname('chave').asstring;
          tabela.Refresh;
          tabela.Locate('chave',loc,[]);

end;

procedure Tffinanceiro.mensalidadesExecute(Sender: TObject);
var
chave,mes:integer;
data:tdate;
begin

              tabela.IndexFieldNames := '';
              mes := strtoint(formatdatetime('mm',date))+1;

              with fdm.Query1 do begin
                   sql.Clear;
                   sql.Add('select max(chave)as chave from tbfinanceiro');
                   open;
                   chave := fieldbyname('chave').AsInteger+1;

                   sql.Clear;
                   sql.Add('select chave,dtval,codigo,nome,nbanco,msn as carteira,gp,diamensalidade,vrmensalidade from tbcliente where '+
                           ' (codigo >0) and (np <> "C" or np is null) and '+
                           ' (diamensalidade is not null and diamensalidade >0) and '+
                           ' (vrmensalidade is not null and vrmensalidade >0)'+
                           '  order by codigo ');
                   open;

              ds.DataSet := nil;

              caption := 'Processando... Aguarde...  Isso pode demorar alguns minutos.';
              update;

              while mes <= 12 do begin

                   First;
                   while not eof do begin

                      data := strtodate('01/'+formatfloat('00',mes)+'/'+formatdatetime('yyyy',date));
                      if fieldbyname('dtval').AsDateTime  <= data then begin
                         tabela.Insert;
                         tabela['chave'] := chave;
                         tabela['tipoconta'] := '#MENSAL#';
                         tabela['documento'] := '0';
                         tabela['codigo'] := fdm.Query1.fieldbyname('codigo').AsString;
                         tabela['nome'] :=fdm.Query1.fieldbyname('nome').AsString;
                         tabela['dtemissao'] := datetostr(now);
                         tabela['dtvencimento'] := '01/'+formatfloat('00',mes)+'/'+formatdatetime('yyyy',date);
                         tabela['vrtitulo'] := fdm.Query1.fieldbyname('vrmensalidade').AsFloat;
                         tabela['vrcliente'] := fdm.Query1.fieldbyname('vrmensalidade').AsFloat*(-1);
                         tabela['LiqEmpresa'] :=fdm.Query1.fieldbyname('vrmensalidade').AsFloat;
                         tabela['tp'] := '4';
                         tabela['nbanco'] := fdm.Query1.fieldbyname('nbanco').AsString;
                         tabela['data'] := datetostr(now);
                         tabela.Post;
                         inc(chave);
                      end;

                      next;
                   end;

                   inc(mes);
                end;

              end;

          tabela.IndexFieldNames := 'nome;dtvencimento';
          ds.DataSet := tabela;
          caption := 'Controle Financeiro';
          tabela.IndexFieldNames := 'nome';

end;

procedure Tffinanceiro.rmensalidadesClick(Sender: TObject);
begin

        if rmensalidades.Focused then
        if rmensalidades.Checked = true then
           mensalidadesExecute(self)
        else filtroExecute(self);
end;

procedure Tffinanceiro.GerarRemessa1Click(Sender: TObject);
var
loc,str,dir:string;
begin
        abortaacao(tabela,nil,'chave','','','','',0);
        if Pred(dbgrid1.SelectedRows.Count) < 0 then msg('#Selecione os registros.',0);
        loc:= tabela.fieldbyname('chave').AsString;
        filtrar(DBGrid1,tabela,nil,'chave');

        str :='';
        tabela.First;
        while not tabela.Eof do begin
              if str = '' then str := ' and (f.chave = '+ quotedstr(tabela.fieldbyname('chave').AsString)
              else str := str +       ' or  f.chave = '+ quotedstr(tabela.fieldbyname('chave').AsString);
              tabela.Next;
        end;
        if str<>'' then str := str + ') ';

        selecione('select c.cnpj, c.nome, c.endereco, c.numero, c.complemento, c.bairro, c.cep, c.municipio, c.uf, '+
                  ' f.nboleto, f.chave, f.dtvencimento, if (f.vrcliente >0,f.vrcliente,  f.vrcliente*(-1)) as  vrdocumento from tbcliente c, tbfinanceiro f '+
                  ' where (f.vrcliente<>0 and f.vrcliente is not null) and c.codigo=f.codigo '+str);

        fdm.RLBRemessa1.Titulos.Clear;

        geraboleto(sqlpub,1,'tbfinanceiro',true);

        fdm.RLBRemessa1.DataArquivo := Date; //� a data que o arquivo est� sendo gerado
        fdm.RLBRemessa1.LayoutArquivo := laCNAB400; // Layout do arquivo, � necess�rio ver com o banco qual � o indicado.CNAB400 � o mais comum.
        fdm.RLBRemessa1.NomeArquivo := FormatDateTime('yyyymmdd',Date)+'.REM'; // Apenas o nome do arquivo, alguns bancos ipulam regras e outros n�o
        fdm.RLBRemessa1.NumeroArquivo := tabela.fieldbyname('nboleto').AsInteger;  //Sequencia n�merica de quandos arquivos j� foram gerados para este banco
        fdm.RLBRemessa1.TipoMovimento := tmRemessa;

        dir := servpath+'remessa';
        if not DirectoryExists(dir) then ForceDirectories(substitui(dir,'/','\'));

        if lista = nil then begin
           fdm.RLBRemessa1.NomeArquivo := substitui(dir+'\'+fdm.RLBRemessa1.NomeArquivo,'/','\');    // Apenas colocando um caminho para o arquivo
           fdm.RLBRemessa1.GerarRemessa;
        end else lista.SaveToFile(pchar(substitui(dir+'\'+fdm.RLBRemessa1.NomeArquivo,'/','\')));

        ShellExecute(Handle, 'open', pchar(substitui(dir,'/','\')), nil, '', Sw_Show);
        if lista <> nil then lista := nil;


        //for i := 0 to fdm.RLBRemessa1.Relatorio.Count-1 do  Memo1.Lines.Add(fdm.RLBRemessa1.Relatorio.Strings[i]);
        fdm.RLBRemessa1.Titulos.Clear;
        fdm.RLBTitulo1.ClearRecords;

        tabela.Filtered := false;
        tabela.Cancel;
        tabela.Refresh;
        tabela.Locate('chave',loc,[]);

end;

procedure Tffinanceiro.Cadastrocedente1Click(Sender: TObject);
begin
        cadg('select * from tbcedente','Banco', 31);
end;

procedure Tffinanceiro.ImprimirExportarboleto1Click(Sender: TObject);
begin
      boletovital(false);
end;


procedure Tffinanceiro.Alterarvencimentos1Click(Sender: TObject);
var
st,dt:string;
begin

        if rpg.ItemIndex <> 1 then msg('#Apenas os n�o pagos podem ser alterados.',0);
        if Pred(dbgrid1.SelectedRows.Count) < 0 then msg('#Voc� precisa selecionar (CTRL) a(s) parcela(s)!',0);

        st := tabela.fieldbyname('chave').AsString;
        codloc := tabela.fieldbyname('dtvencimento').asstring;
        dt := msgi('Digite a nova data(Pagar em):',2);
        GALTERA('17',tabela.fieldbyname('documento').asstring,'d');

        filtrar(dbgrid1,tabela,nil,'chave');

        tabela.First;
        while not tabela.Eof do begin
            selecione('update tbfinanceiro set dtvencimento =' + quotedstr(formatdatetime('yyyy-mm-dd',strtodate(dt)))+
                      ' where chave = '+ tabela.fieldbyname('chave').AsString);
           tabela.next;
        end;

        tabela.Filtered:=false;
        tabela.Cancel;
        tabela.refresh;
        tabela.Locate('chave',st,[]);
end;

procedure Tffinanceiro.RelatrioCarteiras1Click(Sender: TObject);
var
tb:string;
begin

//        if (rpg.ItemIndex=0) or(rpg.ItemIndex=2) then  tb := ' tbfinanceirop '  else
                                                 tb := ' tbfinanceirop ';

                relatorio('financeiro',tb+'.dtvencimento','nome',
                          'select ' + tb + '.chave,' + tb + '.data, ' + tb + '.dtvencimento, ' + tb + '.tipoconta, ' + tb + '.codigo, ' + tb + '.nome,'+
                          tb + '.vrcliente, ' + tb + '.LiqEmpresa, tbcliente.msn as carteira',

                          ' from '+tb+', tbcliente ',

                          ' and '+tb+'.codigo = tbcliente.codigo and ('+tb+'.tp = "2" or '+tb+'.tp="3")',

                          '',
                          'VrCliente','LiqEmpresa','','','', '','','','','','', '','','','','','','',
                          tb,
                          'RELAT�RIO DE CARTEIRA',
                          TB,0,0);
end;

procedure Tffinanceiro.ClientessemEMail1Click(Sender: TObject);
begin
      relatorio('financeiro','','nome',
                ' select c.chave, c.codigo, c.nome, f.tipoconta ',
                '  from tbcliente c, tbfinanceiro f ',
                ' and c.codigo = f.codigo and (c.email = "sac@vitalcred.com.br" or c.email = "SAC@VITALCRED.COM.BR")',
                '',
                '','','','','', '','','','','','', '','','','','','','',
                'tbcliente',
                'Clientes sem Email',
                'f',0,0);


end;

procedure Tffinanceiro.Gerarboletoparaossememail1Click(Sender: TObject);
begin

      boletovital(true);

end;

procedure Tffinanceiro.exportarparaosite1Click(Sender: TObject);
procedure comvital;
begin
        fdm.conectnet.Disconnect;
        ipnet := 'mysql.vitalcred.com.br';
        databasenet := 'odontocred1';
        Usernet := 'odontoc_soft';
        Passwordnet := 'soft1423';
end;

var
cap :string;
scr :WideString;
i:integer;
begin

                            
        if msg('Deseja atualizar o financeiro do site?',2) then else abort;
        ipnet:='';
        databasenet := 'sigac';
        cap := caption;
        comvital;

        try
           fdm.conectnet.Connect;
           ipnet:='';
           databasenet := 'sigac';
        except
             Application.MessageBox('N�o foi poss�vel conectar ao banco de dados do site, verifique se a internet est� OK.',
                                    'Aten��o', 0 + MB_ICONWARNING);
             ativanet('','','','');
             abort;
        end;


        caption := '..... CONECTANDO ... ESPERE...';
        update;
        i:=0;

        //Atualiza do site para o banco local   nome, dtpagamento,
        selecione2('select chave, tipoconta as bandeira,obs, codigo as cod_user,cliente as credenciado, dtemissao,dtvencimento,letra as parcelas, '+
                   'vrtitulo,vrcliente, bloq, bloqmotivo,autorizacao from tbfinanceiro order by chave');

        with fdm.snet do begin
             sql.Clear;
             sql.add('select chave from tbfinanceiro order by chave');
             fdm.tbnet.open;
             comvital;
        end;

        sqlpub2.First;
        while not sqlpub2.Eof do begin

             fdm.snet2.SQL.Clear;

             if not fdm.tbnet.Locate('chave',sqlpub2.fieldbyname('chave').AsString,[]) then
                      fdm.snet2.sql.Add('insert into tbfinanceiro( '+
                              'chave, bandeira,cod_user,credenciado,parcelas,obs,dtemissao,dtvencimento,vrtitulo,vrcliente, bloq, bloqmotivo,autorizacao) values('+
//
                              quotedstr(sqlpub2.fieldbyname('chave').AsString)+
                              ','+quotedstr(sqlpub2.fieldbyname('bandeira').AsString)+
                              ','+quotedstr(sqlpub2.fieldbyname('cod_user').AsString)+
                              ','+quotedstr(sqlpub2.fieldbyname('credenciado').AsString)+
                              ','+quotedstr(sqlpub2.fieldbyname('parcelas').AsString)+
                              ','+quotedstr(sqlpub2.fieldbyname('obs').AsString)+
                              ','+quotedstr(formatdatetime('yyyy-mm-dd',sqlpub2.fieldbyname('dtemissao').AsDateTime))+
                              ','+quotedstr(formatdatetime('yyyy-mm-dd',sqlpub2.fieldbyname('dtvencimento').AsDateTime))+
                              ','+ realdblstr(sqlpub2.fieldbyname('vrtitulo').AsFloat)+
                              ','+ realdblstr(sqlpub2.fieldbyname('vrcliente').AsFloat)+
                              ','+quotedstr(sqlpub2.fieldbyname('bloq').AsString)+
                              ','+quotedstr(sqlpub2.fieldbyname('bloqmotivo').AsString) +
                              ','+quotedstr(sqlpub2.fieldbyname('autorizacao').AsString) +')')
             else
                      fdm.snet2.sql.Add('update tbfinanceiro set'+
                              ' bloq = '+ quotedstr(sqlpub2.fieldbyname('bloq').AsString)+
                              ' ,bloqmotivo = '+ quotedstr(sqlpub2.fieldbyname('bloqmotivo').AsString)+
                              ' ,vrcliente = '+ realdblstr(sqlpub2.fieldbyname('vrcliente').AsFloat)+
                              ' where chave = '+ quotedstr(sqlpub2.fieldbyname('chave').AsString));
                      fdm.snet2.ExecSQL;

                      inc(i);
              caption := '..... ATUALIZANDO PARA O SITE ... ESPERE...      ' +  inttostr(sqlpub2.RecNo) +'    DE    '+  inttostr(sqlpub2.RecordCount);
              update;

              if i = 10 then begin
                 comvital;
                 i:=0;
              end;   
              sqlpub2.Next;
        end;


        comvital;

        //apaga os baixados
        caption := '..... ATUALIZANDO PAGOS - ESPERE...';
        update;

        scr:='';
        fdm.tbnet.First;
        while not fdm.tbnet.Eof do begin

             if not sqlpub2.Locate('chave',fdm.tbnet.fieldbyname('chave').AsString,[]) then
                if scr ='' then scr := ' where chave = '+ quotedstr(fdm.tbnet.fieldbyname('chave').AsString)
                           else scr := ' or chave = '+ quotedstr(fdm.tbnet.fieldbyname('chave').AsString);

              fdm.tbnet.Next;
        end;

        with fdm.snet2 do begin
           SQL.Clear;
           sql.Add('insert into tbfinanceirop (select * from tbfinanceiro)' +scr);
           execsql;
        end;

        fdm.conectnet.Disconnect;
        caption := cap;
        msg('Atualizado!!!',0);
        ativanet('','','','');
        ipnet:='';
        databasenet := 'sigac';
        fdm.tbnet2.Close;


end;

end.





{sqld.SQL.Clear;
sqld.SQL.Add('select * from tbfinanceirop group by codigo');
tabela.Close;
tabela.open;
tabela.First;
while not tabela.Eof do begin
selecione('update tbcliente set mov = "S" where (mov is null or mov="N") and codigo ='+quotedstr(tabela.fieldbyname('codigo').AsString));
tabela.Next;
end;

}
