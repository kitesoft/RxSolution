unit RxSolutionSecurityChangePasswordUFrm;


interface

uses
  Windows, StdCtrls, Forms, Mask, Controls, Buttons, Classes, ExtCtrls,
  Variants, SysUtils, Dialogs,

  RxSolutionSecurityClass, RzBckgnd, RzLabel, Graphics, RzDlgBtn, ActnList,
  dmpDataObjectBaseModule;

type
  TSecurity_ChangePasswordFrm = class(TForm)

    shpFormFrame: TShape;
    txtPasswordErrorText: TStaticText;
    edtPassword: TMaskEdit;

    lblCaptionPassword: TLabel;
    lblCaptionDetails: TLabel;
    RzDialogButtons1: TRzDialogButtons;
    img: TImage;
    rzlDisplay: TRzLabel;
    RzSeparator1: TRzSeparator;
    ActionList1: TActionList;
    atnLogOn: TAction;
    atnCancel: TAction;
    txtPasswordNoMatchErrorText: TStaticText;
    Label1: TLabel;
    edtNewPassword01: TMaskEdit;
    Label2: TLabel;
    edtNewPassword02: TMaskEdit;
    Panel1: TPanel;
    imgLogo: TImage;
    StaticText1: TStaticText;
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtPasswordChange(Sender: TObject);
    procedure edtNewPassword01Change(Sender: TObject);
    procedure edtNewPassword02Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtNewPassword01Exit(Sender: TObject);
    procedure edtNewPassword02Exit(Sender: TObject);
  private
    FAccessLevel: Integer;
    FActiveUser: Integer;
    FUserList: TUserList;
    FPwdLength: integer;
    function FindActiveUser(const prmActiveUser : Variant): Integer;
    function Password_NewPasswordMatch(prmPassWordA : string ; prmPassWordB :
        string): Boolean;
    procedure Password_SwitchOffErrorMsg;
    procedure Password_SwitchOffNoMatchMsg;
    procedure Password_SwitchOnNoMatchMsg;
    { Public declarations }
    procedure Password_SwitchOnErrorMsg;
    function Password_UserMatch(const prmPassword : string): Boolean;
    procedure CheckPassowrdsLength;

  public
    procedure CollectData(const prmSession : TSQLSession ; const prmUserID :
        Variant ; const prmAccessLevel : integer);
    procedure SetupAccess(const prmAccessLevel : integer);
  end;

  TSecurityPasswordManager = class(TObject)
  public
    class function ChangePassword(const prmSession : TSQLSession ; var prmUserID :
        Variant ; const prmUserLevel : integer; pwdLength: integer): Boolean;
  end;


implementation

{$R *.dfm}

procedure TSecurity_ChangePasswordFrm.CollectData(const prmSession :
    TSQLSession ; const prmUserID : Variant ; const prmAccessLevel : integer);
begin
  FUserList := TUserList.Create(prmSession, 'tblSystem_User', 'UserID', '', null);
  FUserList.Load;
  FActiveUser   := FindActiveUser(prmUserID);
  FAccessLevel  := prmAccessLevel;
  SetupAccess(FAccessLevel);

end;

function TSecurity_ChangePasswordFrm.FindActiveUser(const prmActiveUser :
    Variant): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FUserList.RecordsCount -1 do
    if TUser(FUserList.Records[i]).OID.Value = prmActiveUser then
      Result := i;
end;

{ TSystemSecurityFrmLogOn }

procedure TSecurity_ChangePasswordFrm.Password_SwitchOffErrorMsg;

begin
  txtPasswordErrorText.Visible := False;
end;



procedure TSecurity_ChangePasswordFrm.Password_SwitchOnErrorMsg;
begin
  txtPasswordErrorText.Visible := True;
end;

procedure TSecurity_ChangePasswordFrm.FormDestroy(Sender: TObject);
begin
  if Assigned(FUserList) then FUserList.Free;
end;

function TSecurity_ChangePasswordFrm.Password_UserMatch(const prmPassword :
    string): Boolean;
begin

  // All that is required here is true or false.
  Result := False;
  if Trim(TUser(FUserList.Records[FActiveUser]).Password.Value) = Trim(prmPassword) then
    Result := True;

end;

procedure TSecurity_ChangePasswordFrm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  pswdOkay : boolean;
  mtchOkay : boolean;
begin

  mtchOkay  := False;
  pswdOkay  := True;
  if ModalResult = mrOk then
    begin

    if FAccessLevel < 3 then pswdOkay := Password_UserMatch(edtPassword.Text);

    if pswdOkay then
      mtchOkay := Password_NewPasswordMatch(edtNewPassword01.Text, edtNewPassword02.Text);

    if not pswdOkay then Password_SwitchOnErrorMsg
      else if not mtchOkay then Password_SwitchOnNoMatchMsg;

    CanClose  := mtchOkay;
    if CanClose then
      begin
      TUser(FUserList.Records[FActiveUser]).Password.Value := Trim(edtNewPassword01.Text);
      TUser(FUserList.Records[FActiveUser]).UserPasswordSet_dat.Value := Now();
      TUser(FUserList.Records[FActiveUser]).Save;
      end;

    end;

end;

function TSecurity_ChangePasswordFrm.Password_NewPasswordMatch(prmPassWordA :
    string ; prmPassWordB : string): Boolean;
begin

  Result := Trim(prmPassWordA) = Trim(prmPassWordB)

end;


procedure TSecurity_ChangePasswordFrm.Password_SwitchOffNoMatchMsg;

begin
  txtPasswordNoMatchErrorText.Visible := False;
end;

{ TSystemSecurityFrmLogOn }

procedure TSecurity_ChangePasswordFrm.Password_SwitchOnNoMatchMsg;

begin
  txtPasswordNoMatchErrorText.Visible := True;
end;

procedure TSecurity_ChangePasswordFrm.edtPasswordChange(Sender: TObject);
begin
  Password_SwitchOffErrorMsg;
  Password_SwitchOffNoMatchMsg;
end;

procedure TSecurity_ChangePasswordFrm.edtNewPassword01Change(
  Sender: TObject);
begin
  Password_SwitchOffErrorMsg;
  Password_SwitchOffNoMatchMsg;
  CheckPassowrdsLength;
end;

procedure TSecurity_ChangePasswordFrm.edtNewPassword02Change(
  Sender: TObject);
begin
  Password_SwitchOffErrorMsg;
  Password_SwitchOffNoMatchMsg;
  CheckPassowrdsLength;
end;

procedure TSecurity_ChangePasswordFrm.SetupAccess(const prmAccessLevel :
    integer);
begin

  lblCaptionPassword.Visible  := prmAccessLevel < 3;
  edtPassword.Visible         := prmAccessLevel < 3;
  Password_SwitchOffErrorMsg;
  Password_SwitchOffNoMatchMsg;

end;

class function TSecurityPasswordManager.ChangePassword(const prmSession :
    TSQLSession ; var prmUserID : Variant ; const prmUserLevel : integer; pwdLength: integer):
    Boolean;
var
  LogOnFrm: TSecurity_ChangePasswordFrm;
begin

  Result      := False;
  LogOnFrm := TSecurity_ChangePasswordFrm.Create(nil);
  try
  with LogOnFrm do
    try
    FPwdLength := pwdLength;
    CollectData(prmSession, prmUserID, prmUserLevel);
    if LogOnFrm.ShowModal = mrOK then Result    := True;

    except
      on E:Exception do raise Exception.Create(e.Message);
    end;
  finally
    LogOnFrm.Free
  end;

end;


procedure TSecurity_ChangePasswordFrm.FormCreate(Sender: TObject);
begin
  edtPassword.Text  := '';
  edtNewPassword01.Text  := '';
  edtNewPassword02.Text  := '';
end;

procedure TSecurity_ChangePasswordFrm.CheckPassowrdsLength;
begin

 if (FPwdLength > 0) then
  RzDialogButtons1.EnableOk := (Length(edtNewPassword01.Text) > FPwdLength - 1) and  (Length(edtNewPassword02.Text) > FPwdLength - 1)
 else
  RzDialogButtons1.EnableOk := (Length(edtNewPassword01.Text) > 0) and  (Length(edtNewPassword02.Text) > 0);

end;

procedure TSecurity_ChangePasswordFrm.edtNewPassword01Exit(
  Sender: TObject);
var
 ErrMsg : string;
begin

 ErrMsg := 'Password length needs to be at least ' + IntToStr(FPwdLength) + ' characters';

 if (FPwdLength > 0) then
   begin

   if (Length(edtNewPassword01.Text) < FPwdLength) then
     begin
     StaticText1.Caption := ErrMsg;
     StaticText1.Visible := True;
     end
   else
    begin
     StaticText1.Visible := False;
    end;
   end;

end;

procedure TSecurity_ChangePasswordFrm.edtNewPassword02Exit(
  Sender: TObject);
var
 ErrMsg : string;
begin

 ErrMsg := 'Password length needs to be at least ' + IntToStr(FPwdLength) + ' characters';

 if (FPwdLength > 0) then
   begin

   if (Length(edtNewPassword02.Text) < FPwdLength) then
     begin
     StaticText1.Caption := ErrMsg;
     StaticText1.Visible := True;
     end
   else
    begin
     StaticText1.Visible := False;
    end;
   end;
end;

end.
