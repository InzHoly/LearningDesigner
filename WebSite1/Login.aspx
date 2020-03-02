<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
            Draggable="true"
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
                    AllowBlank="false"
                    BlankText="Your username is required." />
                <ext:TextField
                    ID="txtPassword"
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
                </ext:Button>
                <ext:Button runat="server" Text="Register" />
            </Buttons>
            
        </ext:Window>
       
    </form>
</body>
</html>
