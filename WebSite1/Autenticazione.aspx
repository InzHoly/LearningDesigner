<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Autenticazione.aspx.cs" Inherits="_Default" %>

<script runat="server">

    protected void Btn_Login(object sender, DirectEventArgs e){
        String username = user.Text;
        String pwd = password.Text;


    }


</script>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Login Form - Ext.NET Examples</title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
</head>
<body>
    <ext:ResourceManager runat="server" />

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

                    <ext:Checkbox runat="server" FieldLabel="Remember me" Name="remember" ID="remember" />
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