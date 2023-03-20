unit revenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons;

type
  TForm_revenus = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    combo_voiture: TComboBox;
    montant: TEdit;
    Date_r: TDateTimePicker;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    description: TEdit;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure combo(Sender: TObject);
  private


  public
    { Public declarations }
  end;

var
  Form_revenus: TForm_revenus;

implementation

{$R *.dfm}

uses  DM_1, DataModule;

procedure TForm_revenus.SpeedButton1Click(Sender: TObject);
begin
if (self.Caption = 'Revenus - Ajout') then
         begin
            if (description.Text ='') or (montant.Text='')  then
            begin
             MessageDlg('Veuillez remplir tous les champs!' , mtWarning,  [mbOk],0);
            end
            else
            begin
              with DMM.Qry do
              begin
                active := False;
                sql.Clear;
                sql.Text := 'INSERT INTO versement(Date,Montant,Description,id_v)' +
                'VALUES (:p_1,:p_2,:p_3,:p_4)';
                DMM.Qry.ParamByName('p_1').AsString := FormatDateTime('yyy-mm-dd',Date_r.Date);
                DMM.Qry.ParamByName('p_2').AsString := montant.Text;
                DMM.Qry.ParamByName('p_3').AsString := description.Text;
                DMM.Qry.ParamByName('p_4').AsInteger := combo_voiture.ItemIndex;
               ExecSql;
              end;

              ShowMessage('Ajouté avec succès!');
              close;
            end;

            end;
end;
procedure TForm_revenus.combo(Sender: TObject);
begin
   var S: String;
   with DMM.QrySel do
    begin
    Close;
    active := False;
    sql.Clear;
    sql.Text := 'SELECT * FROM voiture';
    active := True;
    Open;
    while not DMM.QrySel.Eof do
    begin
      combo_voiture.Items.Add(DMM.QrySel['Matricule']);
      DMM.QrySel.Next;
    end;

  end;
end;

end.
