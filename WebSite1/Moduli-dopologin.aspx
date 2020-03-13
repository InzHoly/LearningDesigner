<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Moduli-dopologin.aspx.cs" Inherits="_Default" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["login"] != null)
        {   
            contentDiv.InnerHtml = "<b>Elenco moduli</b>";
            String u=Session["login"].ToString();
            int idUser = int.Parse(u);

            String moduli = Query("SELECT nome FROM Moduli WHERE idUtente =" + idUser + ";");
            string[] lista = moduli.Split('/');

            // Part 3: loop over result array.
            foreach (string word in lista)
            {
                contentDiv.InnerHtml += "<br/>";
                contentDiv.InnerHtml += "<a href=Elenco_moduli.aspx>"+word+"<a/>";
                Console.WriteLine("WORD: " + word);
            }    
            
            

        }
        else
        {
            Response.Redirect("Login.aspx");
            return;
        }





    }

</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div id="contentDiv" runat="server">
</div>


</body>
</html>
