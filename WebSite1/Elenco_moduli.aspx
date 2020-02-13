<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Elenco_moduli.aspx.cs" Inherits="Elenco_moduli" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

        Modulo d = new Modulo();
        d.setNome("Database");
        d.setAnnoScolastico("2019/2020");
        d.setClasse("5IA");
        d.setCompetenze("Progettazione Concettuale, Logica e Fisica");
        d.setCorso("Informatica");
        d.setDescrizione("Corso di base sui database, dalla progettazione concettuale alla progettazione fisica");
        d.setDurata(10);
        d.setIDAutore(3);
        d.setNlezioni(10);
        d.setObbiettivo("Progettazione Database");
        d.setTag("Informatica");

        Modulo f = new Modulo();
        f.setNome("Decandentismo");
        f.setAnnoScolastico("2019/2020");
        f.setClasse("4LC");
        f.setCompetenze("Parafrasi opere decadenti, autori principali, opere fondamentali");
        f.setCorso("Italiano");
        f.setDescrizione("Simbolismo francese, poeti maledetti, estetismo, Decadentismo in Italia, D'annunzio, Pascoli ");
        f.setDurata(7);
        f.setIDAutore(4);
        f.setNlezioni(7);
        f.setObbiettivo("Apprendimento del decadentismo");
        f.setTag("Italiano");

        //Mod1.Text= d.getNome();
        Mod2.Text = f.getNome();

        if (!X.IsAjaxRequest)
        {
            this.Store1.DataSource = this.Data;
        }

    }

    protected void Bottone(object sender, DirectEventArgs e)
    {
        //Session["UserName"] = username.Text;
        //provaout.Text = Session["UserName"] as string;
    }

    private object[] Data
    {
        get
        {
            return new object[]
            {
                new object[] { "3m Co", 71.72, 0.02, 0.03, "9/1 12:00am" },
                new object[] { "Alcoa Inc", 29.01, 0.42, 1.47, "9/1 12:00am" },
                new object[] { "Altria Group Inc", 83.81, 0.28, 0.34, "9/1 12:00am" },
                new object[] { "American Express Company", 52.55, 0.01, 0.02, "9/1 12:00am" },
                new object[] { "American International Group, Inc.", 64.13, 0.31, 0.49, "9/1 12:00am" },
                new object[] { "AT&T Inc.", 31.61, -0.48, -1.54, "9/1 12:00am" },
                new object[] { "Boeing Co.", 75.43, 0.53, 0.71, "9/1 12:00am" },
                new object[] { "Caterpillar Inc.", 67.27, 0.92, 1.39, "9/1 12:00am" },
                new object[] { "Citigroup, Inc.", 49.37, 0.02, 0.04, "9/1 12:00am" },
                new object[] { "E.I. du Pont de Nemours and Company", 40.48, 0.51, 1.28, "9/1 12:00am" },
                new object[] { "Exxon Mobil Corp", 68.1, -0.43, -0.64, "9/1 12:00am" },
                new object[] { "General Electric Company", 34.14, -0.08, -0.23, "9/1 12:00am" },
                new object[] { "General Motors Corporation", 30.27, 1.09, 3.74, "9/1 12:00am" },
                new object[] { "Hewlett-Packard Co.", 36.53, -0.03, -0.08, "9/1 12:00am" },
                new object[] { "Honeywell Intl Inc", 38.77, 0.05, 0.13, "9/1 12:00am" },
                new object[] { "Intel Corporation", 19.88, 0.31, 1.58, "9/1 12:00am" },
                new object[] { "International Business Machines", 81.41, 0.44, 0.54, "9/1 12:00am" },
                new object[] { "Johnson & Johnson", 64.72, 0.06, 0.09, "9/1 12:00am" },
                new object[] { "JP Morgan & Chase & Co", 45.73, 0.07, 0.15, "9/1 12:00am" },
                new object[] { "McDonald\"s Corporation", 36.76, 0.86, 2.40, "9/1 12:00am" },
                new object[] { "Merck & Co., Inc.", 40.96, 0.41, 1.01, "9/1 12:00am" },
                new object[] { "Microsoft Corporation", 25.84, 0.14, 0.54, "9/1 12:00am" },
                new object[] { "Pfizer Inc", 27.96, 0.4, 1.45, "9/1 12:00am" },
                new object[] { "The Coca-Cola Company", 45.07, 0.26, 0.58, "9/1 12:00am" },
                new object[] { "The Home Depot, Inc.", 34.64, 0.35, 1.02, "9/1 12:00am" },
                new object[] { "The Procter & Gamble Company", 61.91, 0.01, 0.02, "9/1 12:00am" },
                new object[] { "United Technologies Corporation", 63.26, 0.55, 0.88, "9/1 12:00am" },
                new object[] { "Verizon Communications", 35.57, 0.39, 1.11, "9/1 12:00am" },
                new object[] { "Wal-Mart Stores, Inc.", 45.45, 0.73, 1.63, "9/1 12:00am" }
            };
        }
    }

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <ext:ResourceManager runat="server" />
    <h2>Introduzine ai Database</h2>
    <h3>&emsp;&emsp;<ext:Label runat="server" Text="Nome: introduzione ai Database" ID="Mod1" PageX="100" PageY="500">  </ext:Label></h3>
    
    <h3>&emsp;&emsp;<ext:Label runat="server"  Text="Argomenti: progettazione concettuale" ID="Label1" PageX="100" PageY="500">  </ext:Label></h3>
    
    <h3>&emsp;&emsp;<ext:Label runat="server" Text="Durata: 4h" ID="Durata" ></ext:Label></h3>
    
    <h3>&emsp;&emsp;<ext:Label runat="server" Text="Descrizione: Progettazione concettuale di Database, realizzazione di schema ER, ipotesi, commenti per l'applicazione" ID="Label2" ></ext:Label>
    </h3>
    <hr />
    <a href="Pagina1.aspx"><ext:Label runat="server" Text="" ID="Mod2"></ext:Label></a>
    



    <ext:GridPanel
        ID="GridPanel1"
        runat="server"
        Title="Array Grid"
        Width="700"
        Height="350">
        <Store>
            <ext:Store ID="Store1" runat="server">
                <Model>
                    <ext:Model runat="server">
                        <Fields>
                            <ext:ModelField Name="company" />
                            <ext:ModelField Name="price" Type="Float" />
                            <ext:ModelField Name="change" Type="Float" />
                            <ext:ModelField Name="pctChange" Type="Float" />
                            <ext:ModelField Name="lastChange" Type="Date" DateFormat="M/d hh:mmtt" />
                        </Fields>
                    </ext:Model>
                </Model>
            </ext:Store>
        </Store>
        <ColumnModel>
            <Columns>
                <ext:Column runat="server" Text="Company" DataIndex="company" Flex="1" />
                <ext:Column runat="server" Text="Price" DataIndex="price">
                    <Renderer Format="UsMoney" />
                </ext:Column>
                <ext:Column runat="server" Text="Change" DataIndex="change">
                    <Renderer Fn="change" />
                </ext:Column>
                <ext:Column runat="server" Text="Change" DataIndex="pctChange">
                    <Renderer Fn="pctChange" />
                </ext:Column>
                <ext:DateColumn runat="server" Text="Last Updated" DataIndex="lastChange" Width="120" />
            </Columns>
        </ColumnModel>
        <SelectionModel>
            <ext:RowSelectionModel runat="server" />
        </SelectionModel>
    </ext:GridPanel>

</body>
</html>
