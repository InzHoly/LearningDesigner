<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cambiopassword.aspx.cs" Inherits="cambiopassword" %>

<script runat="server">
    public void cambio(object sender, DirectEventArgs e)
    {
        if(newpassword.Text!="" && newpassword2.Text!="" && oldpassword.Text!="")
            if (newpassword.Text.Equals(newpassword2.Text))
            {
                if(Query("select password from utenti where id = "+Session["login"]).Equals(oldpassword.Text)){
                    Query("update utenti set password = '" + newpassword.Text + "' where id = '" + Session["login"] + "' and password = '"+oldpassword.Text+"'");
                    Response.Redirect("moduli-dopologin.aspx");
                }
                else
                    X.Msg.Alert("Errore", string.Format("La vecchia password non è corretta")).Show();
            }
            else
                X.Msg.Alert("Errore", string.Format("C'è un errore nelle password, riprova")).Show();
        else
            X.Msg.Alert("Errore", string.Format("Devi riempire tutti i campi")).Show();
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
            Height="300"
            Icon="Lock"
            Title="Cambio Password"
            Draggable="true"
            Width="500"
            Modal="false"
            BodyPadding="5"
            Layout="Form">
            <Items>
                <ext:TextField
                    ID="oldpassword"
                    runat="server"
                    Name="oldpassword"
                    InputType="Password"
                    FieldLabel="Password attuale"
                    AllowBlank="false"
                    BlankText="Your old password is required." />
                <ext:TextField
                    ID="newpassword"
                    runat="server"
                    Name="newPassword"
                    InputType="Password"
                    FieldLabel="Password nuova"
                    AllowBlank="false"
                    BlankText="Your new password is required." />
                <ext:TextField
                    ID="newpassword2"
                    runat="server"
                    Name="newpassword2"
                    InputType="Password"
                    FieldLabel="Password nuova"
                    AllowBlank="false"
                    BlankText="Your password is required." />
                
            </Items>
            <Buttons>
                <ext:Button
                    ID="Button1"
                    runat="server"
                    Text="Cambiala"
                    Icon="Accept"
                    FormBind="true"
                    >
                    <DirectEvents>
                        <Click OnEvent="cambio">
                                <EventMask ShowMask="true" />
                            </Click>
                    </DirectEvents>
                </ext:Button>
            </Buttons>
            
        </ext:Window>
       
    </form>
</body>
</html>
