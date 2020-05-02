<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inserimento_attivita.aspx.cs" Inherits="Inserimento_attivita" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.Params["Lezione"] != null)
        {
            int id = int.Parse(Request.Params["Lezione"]);
            Lez.Text = Querys("SELECT nome FROM [Lezioni] WHERE id =" + id);
        }    
        else
        {
            Response.Redirect("Moduli-dopologin.aspx");
            return;
        }
        
    }

    protected void inserisci(object sender, DirectEventArgs e)
    {
        int lezione;
        if(Request.Params["Lezione"]!=null)
            lezione = int.Parse(Request.Params["Lezione"]);
        else
        {
            Response.Redirect("Moduli-dopologin.aspx");
            return;
        }
        



        int durata = int.Parse(txtDurata.Text);

        
        
        String descrizione = txtDescrizione.Text;
        int mod =int.Parse(cmb.SelectedItem.Value);


        String ris = Inserimento(descrizione, mod, durata, lezione);
        Response.Redirect("Moduli-dopologin.aspx");
        return;




        //values = "'" + nome + "','" + prerequisiti + "','" + competenze + "','" + descrizione + "','" + corso + "','" + anno + "','" + tag + "','" + classe + "','" + stato + "','" + u + "'";


        //String ris = Querys("INSERT INTO Moduli (nome,prerequisiti,competenze,descrizione,corso,anno_corso,tag,classe,pubblica,idUtente) VALUES ("+values+");");
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
                    Text="Inserisci"
                    Disabled="true"
                    FormBind="true">
                    <DirectEvents>
                        <Click OnEvent="inserisci"></Click>
                    </DirectEvents>
                    
                </ext:Button>
                
            </Buttons>

        </ext:Panel>
         </Items>
    </ext:formPanel>
</body>
</html>
