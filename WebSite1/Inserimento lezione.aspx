<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inserimento lezione.aspx.cs" Inherits="_Default" %>

<script runat="server">
protected void Page_Load(object sender, EventArgs e)
    {
        this.SelectBox1.GetStore().DataSource = new object[]
        {
            new object[] { "In classe" },
            new object[] { "Uscita didattica" },
            new object[] { "Laboratorio" },
        };
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
                                <ext:SelectBox
                                    ID="SelectBox1"
                                    runat="server"
                                    DisplayField="state"
                                    ValueField="abbr"
                                    EmptyText="Scegli la modalità">
                                    <Store>
                                        <ext:Store runat="server">
                                            <Model>
                                                <ext:Model runat="server">
                                                    <Fields>
                                                        <ext:ModelField Name="Tipo" />
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                        </ext:Store>
                                    </Store>
                                </ext:SelectBox>
                                <ext:TextField runat="server" FieldLabel="Competenze" ID="txtCompetenze" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Corso" ID="txtCorso" AnchorHorizontal="92%" />
                                
                                <ext:SegmentedButton runat="server" ID="status">
                                        <Items>
                                            <ext:Button runat="server" Text="Pubblica" ID="pubblica" />
                                            <ext:Button runat="server" Text="Privata" Pressed="true" ID="privata" />
                                            
                                        </Items>
                                </ext:SegmentedButton>
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
                    Text="Save"
                    Disabled="true"
                    FormBind="true">
                    
                </ext:Button>
                
            </Buttons>

        </ext:Panel>
         </Items>
    </ext:formPanel>
</body>
</html>
