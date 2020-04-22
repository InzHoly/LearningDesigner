<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inserimento modulo.aspx.cs" Inherits="Inserimento_modulo" %>

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
     <form runat="server">
        <ext:ResourceManager runat="server" />

        <ext:Panel
            runat="server"
            Layout="Fit"
            Width="600"
            Height="250">
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
                                <ext:TextField runat="server" FieldLabel="Nome modulo" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Prerequisiti" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Competenze" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Corso" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Anno" AnchorHorizontal="92%" />
                            </Items>
                        </ext:Panel>
                        <ext:Panel runat="server" Border="false" Layout="Form" ColumnWidth=".5" LabelAlign="Top">
                            <Defaults>
                                <ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />
                                <ext:Parameter Name="MsgTarget" Value="side" />
                            </Defaults>
                            <Items>
                                <ext:TextField runat="server" FieldLabel="Last Name" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Email" Vtype="email" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Competenze" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Tag" AnchorHorizontal="92%" />
                                <ext:TextField runat="server" FieldLabel="Classe" AnchorHorizontal="92%" />
                                <ext:TextArea runat="server" FieldLabel="Descrizione" AnchorHorizontal="92%" />
                            </Items>
                        </ext:Panel>
                        <ext:Panel runat="server" Border="false" Layout="Form" ColumnWidth=".5" LabelAlign="Top">
                            <Defaults>
                                <ext:Parameter Name="AllowBlank" Value="false" Mode="Raw" />
                                <ext:Parameter Name="MsgTarget" Value="side" />
                            </Defaults>
                            <Items>
                                <ext:TextField runat="server" FieldLabel="Last Name" AnchorHorizontal="92%" />
                                
                                
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
                    <Listeners>
                        <Click Handler="if (#{FormPanel1}.getForm().isValid()) {Ext.Msg.alert('Submit', 'Saved!');}else{Ext.Msg.show({icon: Ext.MessageBox.ERROR, msg: 'FormPanel is incorrect', buttons:Ext.Msg.OK});}" />
                    </Listeners>
                </ext:Button>
                <ext:Button runat="server" Text="Cancel" />
            </Buttons>
        </ext:Panel>
    </form>
</body>
</html>
