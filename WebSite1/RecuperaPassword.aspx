<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecuperaPassword.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <ext:ResourceManager runat="server" />
    <div style="position:absolute"; top:190px; left:120px">
        <img src="Immagini/logo.PNG" height="400" width="400" />    
    </div>
    <ext:Viewport runat="server">
        <LayoutConfig>
            <ext:VBoxLayoutConfig Align="Center" Pack="Center" />
        </LayoutConfig>
        <Items>
            <ext:FormPanel
                runat="server"
                Title="Recupera Password"
                Width="400"
                Frame="true"
                BodyPadding="13"
                DefaultAnchor="100%">
                <Items>
                    <ext:TextField
                        runat="server"
                        AllowBlank="false"
                        FieldLabel="email"
                        Name="email"
                        EmptyText="email" 
                        ID="email"/>
                </Items>
                <Buttons>
                   <ext:Button ID="extBtn1" runat="server" Text="Login">
                        <DirectEvents>
                            <Click OnEvent="Reset">
                                <EventMask ShowMask="true" />
                            </Click>
                        </DirectEvents>
                    </ext:Button>
                </Buttons>
            </ext:FormPanel>
        </Items>
    </ext:Viewport>
</body>
</html>
