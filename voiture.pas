unit voiture;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, DBAccess, MyAccess, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    Panel1: TPanel;
    username: TEdit;
    mdp: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Panel3: TPanel;
    Image4: TImage;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    valider: TSpeedButton;
    eye: TSpeedButton;
    reg: TSpeedButton;
    procedure validerClick(Sender: TObject);
    procedure eyeClick(Sender: TObject);
    procedure clrUser(Sender: TObject);
    procedure clrMdp(Sender: TObject);
    procedure regClick(Sender: TObject);

  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DataModule, detail_voiture, principale, register;

procedure TForm1.eyeClick(Sender: TObject);
begin
if (mdp.PasswordChar ='*') then
begin
 mdp.PasswordChar := #0;
eye.ImageIndex := 3;
end
else
begin
  mdp.PasswordChar := '*';
  eye.ImageIndex := 4;
end;



end;

procedure TForm1.regClick(Sender: TObject);
begin
Panel3.Visible:=True;
Form1.Width := 759;
Form1.Height :=447;
Form1.Left := 410;


reg.Visible := False;
end;

procedure TForm1.validerClick(Sender: TObject);
begin
with DM.QrySelectUser do
    begin
    active := False;
    sql.Clear;
    sql.Text := 'SELECT * FROM user WHERE username like '+quotedstr(username.Text) +' and '+
    'mdp like  '+quotedstr(mdp.Text);
    Open;
    active := True;
    if (DM.QrySelectUser.Eof) then
    begin
     MessageDlg('Information erroné' , mtError,  [mbOk],0);
      username.Text:='';
      mdp.Text:='';
    end
    else
    begin
      Accueil.ShowModal;
      self.Hide;
    end;

    end;
end;
procedure TForm1.clrUser(Sender: TObject);
begin
if username.Text='Nom d''utilisateur' then
begin
 username.Text:='';
end;

end;

procedure TForm1.clrMdp(Sender: TObject);
begin
if mdp.Text='Mot de passe' then
  begin
    mdp.Text:='';
   mdp.PasswordChar := '*';
   eye.Visible := True;
  end;
end;
end.
