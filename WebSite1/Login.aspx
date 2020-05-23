<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<script runat="server">
    //quando schiaccio il tasto login
    protected void Login(object sender, DirectEventArgs e)
    {

        String n = txtUsername.Text;
        String p = txtPassword.Text;
        if(n=="" || p=="")//controllo che i campi non siano vuoti
            X.Msg.Alert("Errore", string.Format("Compila tutti i campi")).Show();
        else{//controllo se la password inserita è giusta
            if (Query("SELECT password FROM [Utenti] where email ='" + n + "';").Equals(p))
            {//inserisco l'id utente nella sessione
                Session.Add("login",Query("SELECT Id FROM [Utenti] where email ='" + n + "';"));
                Response.Redirect("Moduli-dopologin.aspx");
            }
            else
            {//password errata
                X.Msg.Alert("Errore", string.Format("Nome utente o password sbagliata")).Show();
            }
        }
    }
    //reindirizzo alla pagina di recupero password
    protected void RPass(object sender, DirectEventArgs e)
    {
        Response.Redirect("RecuperaPassword.aspx");
    }
    //reindirizzo alla pagina di registrazione
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
   <form runat="server" >
       
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
                    Name="Mail"
                    FieldLabel="Mail"
                    EmptyText="username"
                    AllowBlank="false"
                    BlankText="Your mail is required." />
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
                    ID="Button3"
                    runat="server"
                    Text="Recupera password"
                    Icon="Accept"
                    FormBind="true"
                    >
                    <DirectEvents>
                        <Click OnEvent="RPass">
                                <EventMask ShowMask="true" />
                            </Click>
                    </DirectEvents>
                </ext:Button>
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
            </Buttons>
            
        </ext:Window>
       
    </form>

</body>
</html>
