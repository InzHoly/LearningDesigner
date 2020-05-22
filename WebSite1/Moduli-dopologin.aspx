<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Moduli-dopologin.aspx.cs" Inherits="_Default" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["login"] != null)
        {
            List<Modul> s = new List<Modul> { };

            String u=Session["login"].ToString();
            GridPanel1.Title = "Moduli di "+ Querys("SELECT nome FROM Utenti WHERE Id = " + u + ";");


            String moduli = Query("SELECT Id FROM Moduli WHERE idUtente = " + u + "  OR pubblica = 1;");
            moduli= moduli.Remove(moduli.Length - 1);
            String[] lista = moduli.Split('/');

            // Part 3: loop over result array.
            foreach (String word in lista)
            {

                String ids = "" + int.Parse(word);
                String nomepart = Querys("SELECT nome FROM Moduli WHERE Id = " + ids+";");
                String nome = "<a href='Elenco_moduli.aspx?id=" + ids + "'>" + nomepart + "</a>";
                String corso = Querys("SELECT corso FROM Moduli WHERE Id = " + ids+";");
                String anno = Querys("SELECT anno_corso FROM Moduli WHERE Id =" + ids+";");
                String classe = Querys("SELECT classe FROM Moduli WHERE Id = " + ids+";");
                String descrizione = Querys("SELECT descrizione FROM Moduli WHERE Id = " + ids+";");
                int pubblica = int.Parse(Querys("SELECT pubblica FROM Moduli WHERE Id = " + ids+";"));
                Modul m = new Modul(nome, corso, anno, classe, descrizione,pubblica);

                s.Add(m);



            }



            this.Store1.DataSource = s;

            this.Store1.DataBind();







        }
        else
        {
            Response.Redirect("Login.aspx");
            return;
        }





    }


    protected void AggiungiModulo(object sender, EventArgs e)
    {
        Response.Redirect("Inserimento_modulo.aspx");
    }

    protected void cambioPassword(object sender, EventArgs e)
    {
        Response.Redirect("cambiopassword.aspx");
        return;
    }

   
    

    public class Modul
    {
        public Modul(String nome, String corso, String anno, String classe, String descrizione, int pubblica)
        {
            this.Nome = nome;
            this.Corso = corso;
            this.Anno = anno;
            this.Classe = classe;
            this.Descrizione = descrizione;
            this.Pubblica = pubblica;

        }

        public String Nome { get; set; }
        public String Corso { get; set; }
        public String Anno { get; set; }
        public String Classe { get; set; }
        public String Descrizione { get; set; }
        public int Pubblica { get; set; }
    }

</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>
        .elenco{
        margin: 0 auto;
    }
    </style>
    <title></title>
</head>
    
<body>
   
    <ext:ResourceManager runat="server" />


    <ext:Store ID="Store1" runat="server">
        <Model>
            <ext:Model runat="server">
                <Fields>
                    <ext:ModelField Name="Nome" />
                    <ext:ModelField Name="Corso" />
                    <ext:ModelField Name="Anno" />
                    <ext:ModelField Name="Classe" />
                    <ext:ModelField Name="Descrizione" />
                    <ext:ModelField Name="Pubblica"></ext:ModelField>
                </Fields>
            </ext:Model>
        </Model>
    </ext:Store>
    

    <ext:Viewport runat="server"  MarginSpec="0 0 10 0">
        <LayoutConfig>
            <ext:VBoxLayoutConfig Align="Center" Pack="Center" />
        </LayoutConfig>
        <Items>
             <ext:GridPanel
                ID="GridPanel1"
                runat="server"
                StoreID="Store1"
                Title="Moduli di ...."
                Width="600"
                Height="350">
                <ColumnModel runat="server">
                    <Columns>
                        <ext:Column runat="server" Text="Nome" DataIndex="Nome" Flex="1" >
                        
                        </ext:Column>
                        <ext:Column runat="server" Text="Corso" Width="75" DataIndex="Corso"/>
                        <ext:Column runat="server" Text="Anno" Width="100" DataIndex="Anno"/>
                        <ext:Column runat="server" Text="Classe" Width="75" DataIndex="Classe"/>
                        <ext:Column runat="server" Text="Descrizione" Flex="1"  DataIndex="Descrizione"/>
                        <ext:Column runat="server" Text="Pubblica" DataIndex="Pubblica"></ext:Column>
                    </Columns>
                </ColumnModel>
            </ext:GridPanel>

            
            <ext:ButtonGroup runat="server" Width="320">  
                <Buttons>
                    <ext:Button runat="server" Text="Aggiungi Modulo">
                        <DirectEvents>
                            <Click OnEvent="AggiungiModulo"></Click>
                        </DirectEvents>
                    </ext:Button>

                    <ext:Button
            ID="Button1"
            runat="server"
            Text="Cambia la tua password"
            Icon="Accept"
            FormBind="true"
            >
            <DirectEvents>
                <Click OnEvent="cambioPassword">
                        <EventMask ShowMask="true" />
                    </Click>
            </DirectEvents>
        </ext:Button>
                    </Buttons>
             </ext:ButtonGroup>     

             
        

          </Items>

    </ext:Viewport>
    
</body>
</html>