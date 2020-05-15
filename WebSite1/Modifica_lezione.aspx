<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modifica_lezione.aspx.cs" Inherits="_Default" %>

<script runat="server">

    Boolean firstLoad = true;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (firstLoad)
        {
            txtNome.Text = Querys("Select nome from [Lezioni] where id = " + Session["idlez"]);
            txtOre.Text = Querys("Select totore from [Lezioni] where id = " + Session["idlez"]);
            txtDescrizione.Text = Querys("Select descrizione from [Lezioni] where id = " + Session["idlez"]);
            cmb.SetValue(Querys("Select modalità from [Lezioni] where id = " + Session["idlez"]));
            firstLoad = false;
        }
        
    }

    protected void Salva(object sender, DirectEventArgs e)
    {
        int idlez = int.Parse((String)Session["idlez"]);
        int totore = int.Parse(txtOre.Text);
        String nome = txtNome.Text;
        String descrizione = txtDescrizione.Text;
        int mod =int.Parse(cmb.SelectedItem.Value);
        int ris = Aggiornamento(idlez, nome, descrizione, mod, totore);
        X.Msg.Alert(""+ris, ris).Show();
        //Response.Redirect("Moduli-dopologin.aspx");
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
                    Title="Modifica Lezione"
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
                                <ext:TextField runat="server" FieldLabel="Nome Lezione" ID="txtNome" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Ore totali" ID="txtOre" AnchorHorizontal="92%" />
                                <ext:ComboBox Editable="false" runat="server" ID="cmb" FieldLabel="Modalità:" EmptyText="Scegli una modalità..">
                                    <Items>
                                        <ext:ListItem Text="In classe" Value="0"  />
                                        <ext:ListItem Text="Uscita Didattica" Value="1" />
                                        <ext:ListItem Text="Laboratorio" Value="2" />
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
