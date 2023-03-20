unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, DBAccess, MyAccess;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    id_voiture: TEdit;
    matricule: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Add_voiture: TButton;
    Annuler: TButton;
    DBGrid1: TDBGrid;
    edit: TButton;
    supp: TButton;
    Edit1: TEdit;
    rech: TEdit;
    Label3: TLabel;
    rech_btn: TButton;
    marque: TEdit;
    type_voiture: TEdit;
    masse: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    puissance: TEdit;
    Label4: TLabel;
    MyDataSource1: TMyDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit3;

end.
