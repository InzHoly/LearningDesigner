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
        lez1.Text = "Introduzione";



    }



    protected void Bottone(object sender, DirectEventArgs e)
    {
        //Session["UserName"] = username.Text;
        //provaout.Text = Session["UserName"] as string;
    }




</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="stilefigo.css" rel="stylesheet" type="text/css" />
<style>
ul {
  list-style-type: none;
  margin: auto;
  padding: 0;
  display:inline-block;
  left:50%;
  
}

li {
  display: inline;
  padding: 6px;
  border:solid;
}
    </style>
</head>

    

<body>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Activity', 'Hours'],
  ['Listening', 8],
  ['Reading', 6],
  ['Research', 3],
  ['Teamwork', 5],
]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Distribuzione delle attività', 'width':300, 'height':300};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>

    <div id="piechart" style="float:right;"></div>

    <ext:ResourceManager runat="server" />
    <h2>Introduzione ai Database</h2>
    <h3>&emsp;&emsp;<ext:Label runat="server" Text="Nome: introduzione ai Database" ID="Mod1" PageX="100" PageY="500">  </ext:Label></h3>
    
    <h3>&emsp;&emsp;<ext:Label runat="server"  Text="Argomenti: progettazione concettuale" ID="Label1" PageX="100" PageY="500">  </ext:Label></h3>
    
    <h3>&emsp;&emsp;<ext:Label runat="server" Text="Durata: 4h" ID="Durata" ></ext:Label></h3>
    
    <h3>&emsp;&emsp;<ext:Label runat="server" Text="Descrizione: Progettazione concettuale di Database, realizzazione di schema ER, ipotesi, commenti per l'applicazione" ID="Label2" ></ext:Label>
    </h3>
    
    <hr />
   
    <br />

    
    

    
    <div id="menu-nav" class="menu" style="display: flex; justify-content: center;">
    <div id="navigation-bar">
    <ul>
      <li style="float: left;"><a href="#"><i class="fa fa-plus"></i><span><ext:Label runat="server" ID="lez1"></ext:Label></span></a></li>
      <li style="float: left;"><a href="#"><i class="fa fa-handshake"></i><span>Services</span></a></li>
      <li style="float: left;"><a href="#"><i class="fa fa-user"></i><span>About</span></a></li>
      <li style="float: left;"><a href="#"><i class="fa fa-book"></i><span>Contact</span></a></li>
	  <li style="float: left;"><a href="#"><i class="fa fa-rss"></i> <span>Blog</span></a></li>
    </ul>
     </div>    
        </div>

</body>
</html>
