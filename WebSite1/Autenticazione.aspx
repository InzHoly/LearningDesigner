<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Autenticazione.aspx.cs" Inherits="_Default" %>

<script runat="server">



</script>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Login Form</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
</head>
<body>
    <ext:ResourceManager runat="server " />
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
                Title="Login"
                Width="400"
                Frame="true"
                BodyPadding="13"
                DefaultAnchor="100%">
                <Items>
                    <ext:TextField
                        runat="server"
                        AllowBlank="false"
                        FieldLabel="User ID"
                        Name="user"
                        EmptyText="user id" 
                        ID="user"/>

                    <ext:TextField
                        runat="server"
                        AllowBlank="false"
                        FieldLabel="Password"
                        Name="pass"
                        EmptyText="password"
                        InputType="Password"
                        ID="password"/>

                    <ext:Hyperlink
                        runat="server"
                        NavigateUrl="Registrazione.aspx"
                        Text="Registrati qui!"
                        Target="_blank"
                        />

                    <ext:Hyperlink
                        runat="server"
                        NavigateUrl="Recuperapassword.aspx"
                        Text="Hai dimenticato la password?"
                        Target="_blank"
                        />
                </Items>
                <Buttons>
                   <ext:Button ID="extBtn1" runat="server" Text="Login">
                        <DirectEvents>
                            <Click OnEvent="Login">
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