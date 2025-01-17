﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inserimento_modulo.aspx.cs" Inherits="Inserimento_modulo" %>

<script runat="server">
    
    


    protected void inserisci(object sender, DirectEventArgs e)
    {   //REcupero le informazioni dalla form e inserisco il nuovo modulo nel database
        int stato;
        String nome = txtNome.Text;
        String prerequisiti = txtPrerequisiti.Text;
        String competenze = txtCompetenze.Text;
        String anno = txtAnno.Text;
        String corso = txtCorso.Text;
        String classe = txtClasse.Text;
        String tag = txtTag.Text;
        String descrizione = txtDescrizione.Text;
        String values;
        if(pubblica.Pressed == true)
        {
            stato = 1;
        }
        else
        {
            stato = 0;
        }
        String u=Session["login"].ToString();

        String ris = Querys(nome, prerequisiti, competenze, anno, corso, classe, tag, descrizione, stato, u);
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
                    Title="Inserimento nuovo modulo"
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
                    Text="Inserisci"
                    Disabled="true"
                    FormBind="true">
                    <DirectEvents>
                        <Click OnEvent="inserisci">

                        </Click>
                    </DirectEvents>
                </ext:Button>
                
            </Buttons>

        </ext:Panel>
         </Items>
    </ext:formPanel>
    <ext:Label runat="server" ID="prova"></ext:Label>
</body>
</html>
