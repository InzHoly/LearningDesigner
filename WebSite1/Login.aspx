<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<script runat="server">

    protected void Login(object sender, DirectEventArgs e)
    {

        String n = txtUsername.Text;
        String p = txtPassword.Text;
        txtUsername.Text=Query("SELECT password FROM [Utenti] where nome ='" + n + "';");
            if (Query("SELECT password FROM [Utenti] where nome ='" + n + "';").Equals(p))
            {
                Session.Add("login",Query("SELECT Id FROM [Utenti] where nome ='" + n + "';"));
                Response.Redirect("Moduli-dopologin.aspx");
            }
            else
            {
                X.Msg.Alert("Errore", string.Format("Nome utente o password sbagliata")).Show();
            }

    }

    protected void register(object sender, DirectEventArgs e)
    {
        Response.Redirect("registrazione.aspx");
        return;       

    }
</script>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
</head>
<body style="background-color:white">
    <ext:ResourceManager runat="server" />
    
    <div style="position:absolute; top:190px; left:120px">
        <img  src="Immagini/logo.PNG" height="400" width="470" />

    </div>
   <form runat="server">
       
        <ext:Window
            ID="Window1"
            runat="server"
            Closable="false"
            Resizable="false"
            Height="200"
            Icon="Lock"
            Title="Login"
            Draggable="false"
            Width="500"
            Modal="false"
            BodyPadding="5"
            Layout="Form">
            <Items>
                <ext:TextField
                    ID="txtUsername"
                    runat="server"
                    Name="username"
                    FieldLabel="Username"
                    EmptyText="username"
                    AllowBlank="false"
                    BlankText="Your username is required." />
                <ext:TextField
                    ID="txtPassword"
                    EmptyText="password"
                    runat="server"
                    Name="password"
                    InputType="Password"
                    FieldLabel="Password"
                    AllowBlank="false"
                    BlankText="Your password is required." />
                
            </Items>
            <Buttons>
                <ext:Button
                    ID="Button1"
                    runat="server"
                    Text="Login"
                    Icon="Accept"
                    FormBind="true"
                    >
                    <DirectEvents>
                        <Click OnEvent="Login">
                                <EventMask ShowMask="true" />
                            </Click>
                    </DirectEvents>
                </ext:Button>
                <ext:Button
                    ID="Button2"
                    runat="server"
                    Text="Registrati"
                    Icon="Accept"
                    FormBind="true"
                    >
                    <DirectEvents>
                        <Click OnEvent="register">
                                <EventMask ShowMask="true" />
                            </Click>
                    </DirectEvents>
                </ext:Button>
                <ext:Button runat="server" Text="Register" />
                <ext:Button runat="server" Text="Reset Password" />
            </Buttons>
            
        </ext:Window>
       
    </form>

</body>
</html>
