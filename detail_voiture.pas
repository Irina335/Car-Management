unit detail_voiture;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList;

type
  TForm_detail_voiture = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    id_voiture: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    marque: TEdit;
    masse: TEdit;
    matricule: TEdit;
    puissance: TEdit;
    type_voiture: TEdit;
    Label3: TLabel;
    save: TButton;
    Annuler: TButton;
    ImageList1: TImageList;
    lbl_titre: TLabel;
    procedure saveClick(Sender: TObject);
    procedure AnnulerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_detail_voiture: TForm_detail_voiture;

implementation

{$R *.dfm}

uses DataModule, voiture, principale;

 procedure TForm_detail_voiture.AnnulerClick(Sender: TObject);
begin
id_voiture.Text := '';
matricule.Text := '';
marque.Text := '';
type_voiture.Text := '';
masse.Text := '';
puissance.Text := '';

end;

procedure TForm_detail_voiture.saveClick(Sender: TObject);
begin
       if (self.Caption = 'Détails voiture - Ajout') then
         begin
            if (marque.Text='') or (masse.Text='') or (matricule.Text ='') or (Type_voiture.Text ='') or
            (puissance.Text='') then
            begin
             MessageDlg('Veuillez remplir tous les champs!' , mtInformation,  [mbOk],0);
            end
            else
            begin
              with DM.QryInsert do
              begin
                active := False;
                sql.Clear;
                sql.Text := 'INSERT INTO voiture(Matricule,Marque,Masse,Type,Puissance)' +
                'VALUES (' +quotedstr(matricule.Text) + ',' +
                            quotedstr(marque.Text) + ',' +
                             quotedstr(masse.Text) + ',' +
                              quotedstr(Type_voiture.Text) + ',' +
                               quotedstr(puissance.Text) + ')'    ;
               ExecSql;
              end;
              ShowMessage('Ajouté avec succès!');
              close;
            end;

         end
         else if (self.Caption = 'Détails voiture - Modifier') then
            begin
                if (marque.Text='') or (masse.Text='') or (matricule.Text ='') or (Type_voiture.Text ='') or
            (puissance.Text='') then
                  begin
                    Showmessage('Veuillez renseignez tout les champs!')
                  end
                  else
            begin
              with DM.QryUpdate do
              begin
                active := False;
                sql.Clear;
                sql.Text := 'UPDATE  voiture SET  Matricule = '+quotedstr(matricule.Text) +
                ', Marque = '+quotedstr(marque.Text) + ', Masse = '+quotedstr(masse.Text) +
                ', Type = '+ quotedstr(Type_voiture.Text) + ', Puissance =  ' + quotedstr(puissance.Text)+
                  'WHERE ID_Voiture = '+ quotedstr(id_voiture.Text);
               ExecSql;
              end;
              ShowMessage('Modifié avec succès!');
              close;
            end;
            end;
            principale.Accueil.refresh_car;



end ;



end.
