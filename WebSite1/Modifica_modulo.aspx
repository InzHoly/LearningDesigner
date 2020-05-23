<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modifica_modulo.aspx.cs" Inherits="Inserimento_modulo" %>

<script runat="server">



    protected void Page_Load(object sender, EventArgs p)
    {
        if ((Boolean)Session["firstload"])
        {   //recupero le informazioni del modulo dal database e le inserisco nei campi della form
            int modid = (int)Session["modid"];
            txtNome.Text = Querys("Select nome from [Moduli] where id = " + Session["modid"]);
            txtPrerequisiti.Text = Querys("Select prerequisiti from [Moduli] where id = " + Session["modid"]);
            txtCompetenze.Text = Querys("Select competenze from [Moduli] where id = " + Session["modid"]);
            txtAnno.Text = Querys("Select anno_corso from [Moduli] where id = " + Session["modid"]);
            txtCorso.Text = Querys("Select corso from [Moduli] where id = " + Session["modid"]);
            txtClasse.Text = Querys("Select classe from [Moduli] where id = " + Session["modid"]);
            txtTag.Text = Querys("Select tag from [Moduli] where id = " + Session["modid"]);
            txtDescrizione.Text = Querys("Select descrizione from [Moduli] where id = " + Session["modid"]);
            if (int.Parse(Querys("Select pubblica from [Moduli] where id = " + Session["modid"]))==1)
            {
                cmb.Value = 1;
            }
            else
            {
                cmb.Value = 0;
            }
            Session["firstload"] = false;
        }

    }

    protected void EliminaModulo(object sender, DirectEventArgs e)
    {   //cancello il modulo
        int modid = (int)Session["modid"];
        String res = Querys("DELETE FROM Moduli WHERE id = " + modid + ";");
        Response.Redirect("moduli-dopologin.aspx");
    }

    protected void salva(object sender, DirectEventArgs e)
    {   //Raccolgo i dati dalla forme e salvo le modifiche fatte dall'utente
        int stato;
        String nome = txtNome.Text;
        String prerequisiti = txtPrerequisiti.Text;
        String competenze = txtCompetenze.Text;
        String anno = txtAnno.Text;
        String corso = txtCorso.Text;
        String classe = txtClasse.Text;
        String tag = txtTag.Text;
        String descrizione = txtDescrizione.Text;stato = 1;
        if((cmb.Value+"").Equals("1"))
        {
            stato = 1;
        }
        else
        {
            stato = 0;
        }
        int u=int.Parse(Session["login"].ToString());
        //X.Msg.Alert("Test",nome + " - " + prerequisiti + " - " + competenze + " - " + anno + " - " + corso + " - " + classe + " - " + tag + " - " + descrizione + " - " + stato + " - " + u + "-" + cmb.Value).Show();
        int ris = Aggiornamento(nome, prerequisiti,descrizione, competenze, anno, corso, classe, tag, stato);
        Response.Redirect("Moduli-dopologin.aspx");
    }

</script>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .icon-exclamation {
            padding-left: 25px !important;
            background: url(/icons/exclamation-png/ext.axd) no-repeat 3px 0px !important;
        }

        .icon-accept {
            padding-left: 25px !important;
            background: url(/icons/accept-png/ext.axd) no-repeat 3px 0px !important;
        }
    </style>
</head>
<body>
    
    <ext:ResourceManager runat="server" />
     <ext:formPanel runat="server"   AlignTarget="center" >
         <LayoutConfig>
            <ext:VBoxLayoutConfig Align="Center" Pack="Center"  />
        </LayoutConfig>
         <Items>
        <ext:Panel
            AlignTarget="center"
            runat="server"
            Width="1000"
            Height="500"
            >
            
            <Items>
                <ext:FormPanel
                    ID="FormPanel1"
                    runat="server"
                    Title="Modifica modulo"
                    BodyPadding="5"
                    ButtonAlign="Right"
                    Layout="Column">
                    <Items>
                        <ext:Panel
                            runat="server"
                            Border="false"
                            Header="false"
                            ColumnWidth=".5"
                            Layout="Form"
                            LabelAlign="Top">
                            <Defaults>
                                <ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />
                                <ext:Parameter Name="MsgTarget" Value="side" />
                            </Defaults>
                            <Items>
                                <ext:TextField runat="server" FieldLabel="Nome modulo" ID="txtNome" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Prerequisiti" ID="txtPrerequisiti" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Competenze" ID="txtCompetenze" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Corso" ID="txtCorso" AnchorHorizontal="92%" />
                                
                                <ext:ComboBox Editable="false" runat="server" ID="cmb" FieldLabel="Pubblica :">
                                    <Items>
                                        <ext:ListItem Text="No" Value="0"  />
                                        <ext:ListItem Text="Sì" Value="1" />
                                    </Items>
                                </ext:ComboBox>
                             </Items>
                        </ext:Panel>
                        <ext:Panel runat="server" Border="false" Layout="Form" ColumnWidth=".5" LabelAlign="Top">
                            <Defaults>
                                <ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />
                                <ext:Parameter Name="MsgTarget" Value="side" />
                            </Defaults>
                            <Items>
                                <ext:TextField runat="server" FieldLabel="Anno" ID="txtAnno" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Tag" ID="txtTag" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Classe" ID="txtClasse" AnchorHorizontal="92%" />
                                <ext:TextArea runat="server" FieldLabel="Descrizione" ID="txtDescrizione" AnchorHorizontal="92%" />
                                
                            </Items>
                        </ext:Panel>
                    </Items>
                    <BottomBar>
                        <ext:StatusBar runat="server" />
                    </BottomBar>
                    <Listeners>
                        <ValidityChange Handler="this.dockedItems.get(1).setStatus({
                                                     text : valid ? 'Form is valid' : 'Form is invalid',
                                                     iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                                 });
                                                 #{Button1}.setDisabled(!valid);" />
                    </Listeners>
                </ext:FormPanel>
            </Items>
            <Buttons>
                <ext:Button
                    ID="Button1"
                    runat="server"
                    Text="Salva"
                    Disabled="true"
                    FormBind="true">
                    <DirectEvents>
                        <Click OnEvent="salva">

                        </Click>
                    </DirectEvents>
                </ext:Button>
                <ext:Button runat="server" ID="button2" Text="Elimina" Icon="Delete">
                    <DirectEvents>
                        <Click OnEvent="EliminaModulo"></Click>
                    </DirectEvents>
                </ext:Button>
            </Buttons>

        </ext:Panel>
         </Items>
    </ext:formPanel>
    <ext:Label runat="server" ID="prova"></ext:Label>
</body>
</html>
