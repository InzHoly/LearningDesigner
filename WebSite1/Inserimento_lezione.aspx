<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inserimento_lezione.aspx.cs" Inherits="_Default" %>

<script runat="server">



    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void inserisci(object sender, DirectEventArgs e)
    {
        int modulo;
        if(Request.Params["modulo"]!=null)
            modulo = int.Parse(Request.Params["modulo"]);
        else
        {
            Response.Redirect("Moduli-dopologin.aspx");
            return;
        }
        int nlez;



        int totore = int.Parse(txtOre.Text);

        if (radno.Checked == true)
        {
            nlez =int.Parse(Querys("select max(nlez) from Lezioni WHERE Modulo= " + modulo+ " group by Modulo"));
            nlez = nlez + 1;
        }
        else
        {
            nlez = 1;
        }
        String nome = txtNome.Text;
        String descrizione = txtDescrizione.Text;
        int mod =int.Parse(cmb.SelectedItem.Value);


        String ris = Inserimento(nome, descrizione, modulo, mod, nlez, totore);
        Response.Redirect("Moduli-dopologin.aspx");




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
                    Title="Inserimento nuova Lezione"
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
                                
                                <ext:RadioGroup
                                    ID="RadioGroup1"
                                    runat="server"
                                    GroupName="RadioGroup1"
                                    FieldLabel="Prima lezione?"
                                    Cls="x-check-group-alt">
                                    <Items>
                                        <ext:Radio ID="radsi" runat="server" BoxLabel="Sì" InputValue="1" Checked="true" />
                                        <ext:Radio ID="radno" runat="server" BoxLabel="No" InputValue="2"  />
                                    </Items>
                                </ext:RadioGroup>
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
