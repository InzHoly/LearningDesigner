<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modifica_attivita.aspx.cs" Inherits="Inserimento_attivita" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Params["Lezione"] != null)
        {
            if ((Boolean)Session["firstload"])
            {
                int id = int.Parse(Request.Params["Lezione"]);
                int idatt = int.Parse(Request.Params["Attivita"]);
                Lez.Text = Querys("SELECT nome FROM [Lezioni] WHERE id =" + id);
                txtDurata.Text = Querys("SELECT durata FROM [attività] WHERE id =" + idatt);
                txtDescrizione.Text = Querys("SELECT descrizione FROM [attività] WHERE id =" + idatt);
                cmb.SetValue(Querys("SELECT tipo FROM [attività] WHERE id =" + idatt));
            }
        }
        else
        {
            Response.Redirect("Moduli-dopologin.aspx");
            return;
        }
        Session["firstload"] = false;
    }

    protected void Salva(object sender, DirectEventArgs e)
    {
        int lezione = int.Parse((String)Session["idlez"]);
        int idatt = int.Parse((String)Session["idAtt"]);

        int durata = int.Parse(txtDurata.Text);

        String descrizione = txtDescrizione.Text;
        int mod =int.Parse(cmb.SelectedItem.Value);

        String ris = Aggiornamento(idatt, descrizione, mod, durata, lezione);
        Response.Redirect("Moduli-dopologin.aspx");
        return;
    }


</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <ext:ResourceManager runat="server" />
     <ext:formPanel runat="server"  PageY="200"  AlignTarget="center" >
         <LayoutConfig>
            <ext:VBoxLayoutConfig Align="Center" Pack="Center"  />
        </LayoutConfig>
         <Items>
        <ext:Panel
            AlignTarget="center"
            runat="server"
            Width="900"
            Height="300"
            >
            
            <Items>
                <ext:FormPanel
                    ID="FormPanel1"
                    runat="server"
                    Title="Inserimento nuova Attività"
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
                                
                                <ext:Label runat="server" ID="Lez"></ext:Label>
                                <ext:ComboBox Editable="false" runat="server" ID="cmb" FieldLabel="Modalità:" EmptyText="Scegli una modalità..">
                                    <Items>
                                        <ext:ListItem Text="Discussione" Value="0"  />
                                        <ext:ListItem Text="Collaborazione" Value="1" />
                                        <ext:ListItem Text="Ricerca informazioni" Value="2" />
                                        <ext:ListItem Text="Fai pratica" Value="3" />
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
                                <ext:TextArea runat="server" FieldLabel="Descrizione" ID="txtDescrizione" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Durata: " ID="txtDurata" AnchorHorizontal="92%"></ext:TextField>
                                
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
                        <Click OnEvent="Salva"></Click>
                    </DirectEvents>
                    
                </ext:Button>
                
            </Buttons>

        </ext:Panel>
         </Items>
    </ext:formPanel>
</body>
</html>
