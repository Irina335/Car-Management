unit register;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.Buttons;

type
  TRegisterForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ImageList1: TImageList;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    con: TLabel;
    contact: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    mdp: TEdit;
    mdp_1: TEdit;
    nom: TEdit;
    nom_user: TLabel;
    prenom_user: TEdit;
    username: TEdit;
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterForm: TRegisterForm;

implementation

{$R *.dfm}

uses voiture;

procedure TRegisterForm.SpeedButton2Click(Sender: TObject);
begin
 ShowMessage('Ajouté avec succès!');
 close
end;

end.
