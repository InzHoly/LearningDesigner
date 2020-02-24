﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Elenco_moduli.aspx.cs" Inherits="Elenco_moduli" %>

<!DOCTYPE html>

<script runat="server">

    Modulo d;
    Modulo s;
    Lezione att= new Lezione();
    protected void Page_Load(object sender, EventArgs p)
    {

        ciao.Text = Query("SELECT * FROM [Moduli];");

        d = new Modulo();
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

        s = new Modulo();
        s.setNome("Seconda guerra mondiale");
        s.setAnnoScolastico("2019/2020");
        s.setClasse("8SC");
        s.setCompetenze("conoscere la storia, sapere perchè amos è inferiore, hitler");
        s.setCorso("Storia");
        s.setDescrizione("Guerra lampo, resistenze, collaborazionisti, fine della guerra");
        s.setDurata(7);
        s.setIDAutore(4);
        s.setNlezioni(7);
        s.setObbiettivo("Apprendimento della seconda guerra mondiale");
        s.setTag("Hitler");

        Lezione a = new Lezione();
        a.setNome("1939, l'inizio");
        a.setDescrizione("Dopo che la Germania invase la Polonia, Francia e Gran Bretagna dichiararono guerra a Hitler");
        a.setTotore(3);
        a.setModalita(0);

        Lezione b = new Lezione();
        b.setNome("1940, La caduta della Francia");
        b.setDescrizione("Passando per il belgio le truppe naziste dilagano in francia e invadono Parigi, gli alleati sono costretti a ritirarsi a Dunquerque");
        b.setTotore(3);
        b.setModalita(1);

        Lezione c = new Lezione();
        c.setNome("1941, operazione Barbarossa");
        c.setDescrizione("Dopo che la Luftwaffe non riuscì a distruggere la RAF, Hitler decide di cominciare l'invasione dell'unione sovietica per conquistare lo spazio vitale a est");
        c.setTotore(3);
        c.setModalita(2);

        Lezione e = new Lezione();
        e.setNome("1942, Battaglia isole Midway");
        e.setDescrizione("Nella decisiva battaglia delle isole Midway gli americani riuscirono a ribaltare le sorti della battaglia nel pacifico contro i giapponesi");
        e.setTotore(3);
        e.setModalita(0);

        Lezione g = new Lezione();
        g.setNome("1943, Sbarco in Sicilia");
        g.setDescrizione("Dopo aver ottenuto il dominio del Mediterraneo, gli alleati sbarcano in Sicilia dove vengono accolti dalla popolazione come dei salvatori");
        g.setTotore(3);
        g.setModalita(1);


        s.addLezione(a);
        s.addLezione(b);
        s.addLezione(c);
        s.addLezione(e);
        s.addLezione(g);


        Attivita at1 = new Attivita();
        at1.setDescrizione("cartina europa nel 1939");
        at1.setDurata(3);
        at1.setTipo(2);

        Attivita at2 = new Attivita();
        at2.setDescrizione("Ricerca sulle strategie di guerra tedesche");
        at2.setDurata(5);
        at2.setTipo(1);

        Attivita at3 = new Attivita();
        at3.setDescrizione("Discussione sulla non belligeranza di Mussolini");
        at3.setDurata(4);
        at3.setTipo(3);

        Attivita at4 = new Attivita();
        at4.setDescrizione("Lettura di un documento sulle umilianti condizioni di resa della Francia");
        at4.setDurata(1);
        at4.setTipo(4);
        //Mod1.Text= d.getNome();
        a.addAttivita(at1);
        a.addAttivita(at2);
        a.addAttivita(at3);
        a.addAttivita(at4);


        att.setNome("1939, l'inizio");
        att.setDescrizione("Dopo che la Germania invase la Polonia, Francia e Gran Bretagna dichiararono guerra a Hitler");
        att.setTotore(3);
        att.setModalita(0);

        att.addAttivita(at1);
        att.addAttivita(at2);
        att.addAttivita(at3);
        att.addAttivita(at4);

        lez1.Text = s.getLezione(0).getNome();
        lez2.Text = s.getLezione(1).getNome();
        lez3.Text = s.getLezione(2).getNome();
        lez4.Text = s.getLezione(3).getNome();
        lez5.Text = s.getLezione(4).getNome();

    }



    protected void bottone(object sender, DirectEventArgs e)
    {

        String txt = "";
        String nom = "n";
        int i = 1;
        do
        {

            if (e.ExtraParams.GetParameter(nom + i) != null)
                txt = e.ExtraParams.GetParameter(nom + i).Value;
            i++;
        } while (txt == "");

        int index = int.Parse(txt);

        Lezione lez = s.getLezione(index);
        nomLez.Text = s.getNome();
        mods.Hidden = false;
        cmb.Hidden = false;
        descLez.Text = "Descrizione: " + lez.getDescrizione();
        totdurata.Text ="Durata totale: "+ lez.getTotore() + " ore";
        switch (lez.getModalita())
        {
            case 0:cmb.SetValue("In classse");break;
            case 1:cmb.SetValue("Uscita didattica");break;
            case 2:cmb.SetValue("Laboratorio");break;
        }
        cmb.Hidden = false;
        att = lez;
        totdurata.Text = "Durata totale: " + lez.getTotore() + " ore";
        //e.ExtraParams[name: "n1"]
        //Session["UserName"] = username.Text;
        //provaout.Text = Session["UserName"] as string;
    }


    protected void mostraAttivita(object sender, DirectEventArgs e)
    {
        String tipi="";
        String txt = "";
        String nom = "a";
        int i=1;
        do
        {
            if(e.ExtraParams.GetParameter(nom+i)!=null)
                txt= e.ExtraParams.GetParameter(nom+i).Value;
            i++;
        } while (txt == "");

        int index = int.Parse(txt);

        Attivita atti = att.GetAttivita(index);
        Descrizione.Text = atti.getDescrizione();
        OreAttivita.Text = "Durata" + atti.getDurata() + " h";
        switch (atti.getTipo())
        {
            case 0:tipi = "read, watch & listen"; break;
            case 1:tipi = "collaborate"; break;
            case 2:tipi = "discuss"; break;
            case 3:tipi = "investigate"; break;
            case 4:tipi = "practice"; break;
            case 5:tipi = "produce"; break;
        }
        Tipo.Text = "Tipo: " + tipi;
    }

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Stile.css" rel="stylesheet" type="text/css" />
</head>

<body>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        // Load google charts
        google.charts.load('current', { 'packages': ['corechart'] });
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
            var options = { legend: { position: 'top' }, is3D: true, backgroundColor: 'transparent' };

            // Display the chart inside the <div> element with id="piechart"
            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        }
    </script>

    <ext:ResourceManager runat="server" />
    <h1 class="header">Introduzione ai Database</h1>
    <div class="details">
        <div class="text1">
            <table>
                <tr>
                    <td class="leftColumn">Nome :
                    </td>
                    <td>
                        <ext:Label runat="server" Text="Introduzione ai Database" ID="Mod1"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Argomenti :
                    </td>
                    <td>
                        <ext:Label runat="server" Text="Progettazione concettuale" ID="Label1"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Durata :
                    </td>
                    <td>
                        <ext:Label runat="server" Text="Durata: 4h" ID="Label2"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Descrizione :
                    </td>
                    <td>
                        <ext:Label runat="server" Text="Progettazione concettuale di Database, realizzazione di schema ER, ipotesi, commenti per l'applicazione" ID="Label3" Cls="longString"></ext:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div class="text2">
            <table>
                <tr>
                    <td class="leftColumn">Nome :
                    </td>
                    <td>
                        <ext:Label runat="server" Text="Introduzione ai Database" ID="Label4"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Argomenti :
                    </td>
                    <td>
                        <ext:Label runat="server" Text="Progettazione concettuale" ID="Label5"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Durata :
                    </td>
                    <td>
                        <ext:Label runat="server" Text="Durata: 4h" ID="Label6"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Descrizione :
                    </td>
                    <td>
                        <ext:Label runat="server" Text="Progettazione concettuale di Database, realizzazione di schema ER, ipotesi, commenti per l'applicazione" ID="Label7" Cls="longString"></ext:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div id="piechart" class="chart"></div>
    </div>


    
   

    <ext:Window runat="server"  Cls="background-color: red;" ID ="attivita" Width="500" Height="200" Title="Attività" Closable="false" PageY="500" PageX="550" Draggable="false" Resizable="false">

        <Bin>
            <ext:InfoPanelQueue
                runat="server"
                Name="window"
                Container="#{Infos}"
                Sliding="false">
                <Defaults>
                    <ext:Parameter Name="header" Value="false" />
                    <ext:Parameter Name="pinned" Value="true" />
                    <ext:Parameter Name="cls" Value="solid" />
                    <ext:Parameter Name="layout" Value="hbox" />
                    <ext:Parameter Name="style" Value="position:relative;" />
                </Defaults>
                
            </ext:InfoPanelQueue>
        </Bin>
        <LayoutConfig>
            <ext:HBoxLayoutConfig Align="Stretch" />
        </LayoutConfig>
        <Items>
            
            <ext:MenuPanel runat="server" Width ="150" Height="200"  Region="West">
                <Menu runat="server" ID="men">
                    <Items>
                        <ext:MenuItem
                            runat="server"
                            Text="Attività 1">
                            <DirectEvents>
                                <Click OnEvent="mostraAttivita" > <ExtraParams><ext:Parameter Name="a1" Value="0" Mode="Value" /></ExtraParams></Click>
                            </DirectEvents>
                            </ext:MenuItem>
                        <ext:MenuItem
                            runat="server"
                            Text="Attività 2">
                            <DirectEvents>
                                <Click OnEvent="mostraAttivita" > <ExtraParams><ext:Parameter Name="a2" Value="1" Mode="Value" /></ExtraParams></Click>
                            </DirectEvents>
                            </ext:MenuItem>
                        <ext:MenuItem
                            runat="server"
                            Text="Attività 3" >
                            <DirectEvents>
                                <Click OnEvent="mostraAttivita" > <ExtraParams><ext:Parameter Name="a3" Value="2" Mode="Value" /></ExtraParams></Click>
                            </DirectEvents>
                            </ext:MenuItem>
                        <ext:MenuItem
                            runat="server"
                            Text="Attività 4" >
                            <DirectEvents>
                                <Click OnEvent="mostraAttivita" > <ExtraParams><ext:Parameter Name="a4" Value="3" Mode="Value" /></ExtraParams></Click>
                            </DirectEvents>
                            </ext:MenuItem>
                    </Items>
                </Menu>
            </ext:MenuPanel>
            <ext:Container runat="server" Region="East" Flex="1" StyleHtmlCls="display:flex; flex-direction: row">
                <LayoutConfig>
                    <ext:VBoxLayoutConfig Align="Stretch" />
                </LayoutConfig>
                <Defaults>
                    <ext:Parameter Name="margin" Value="0" Mode="Raw" />
                </Defaults>
                <Items>
                <ext:TextArea ID="Descrizione" runat="server" Height="100" Width="200" Editable="false"></ext:TextArea>
                <ext:Label runat="server" ID="OreAttivita" ></ext:Label>
                <ext:Label runat="server" ID="Tipo" ></ext:Label>
                </Items>
            </ext:Container>
            
        </Items>
    </ext:Window>
    <br />
    <hr />
    <!-- riga orizzontale -->
    <ext:Label runat="server" ID="ciao"></ext:Label>
    <div class="lezione">
        

        <h2>Lezioni</h2>

        <br />

        <div id="menu-nav" class="menu">
            <div id="navigation-bar">
                <ul>
                    <li><a href="#">
                        <span>
                            <ext:Label runat="server" ID="lez1" Cls="hvr-ripple-out" Height="30px" Width="180px">
                                <DirectEvents>
                                    <Tap OnEvent="bottone">
                                        <ExtraParams>
                                            <ext:Parameter Name="n1" Value="0" Mode="Value" />
                                        </ExtraParams>
                                    </Tap>
                                </DirectEvents>
                            </ext:Label>
                        </span></a>
                    </li>
                    <li><a href="#">
                        <span>
                            <ext:Label runat="server" ID="lez2" Cls="hvr-ripple-out" Height="30px" Width="180px">
                                <DirectEvents>
                                    <Tap OnEvent="bottone">
                                        <ExtraParams>
                                            <ext:Parameter Name="n2" Value="1" Mode="Value" />
                                        </ExtraParams>
                                    </Tap>
                                </DirectEvents>
                            </ext:Label>
                        </span></a>
                    </li>
                    <li><a href="#">
                        <span>
                            <ext:Label runat="server" ID="lez3" Cls="hvr-ripple-out" Height="30px" Width="180px">
                                <DirectEvents>
                                    <Tap OnEvent="bottone">
                                        <ExtraParams>
                                            <ext:Parameter Name="n3" Value="2" Mode="Value" />
                                        </ExtraParams>
                                    </Tap>
                                </DirectEvents>
                            </ext:Label>
                        </span></a>
                    </li>
                    <li><a href="#">
                        <span>
                            <ext:Label runat="server" ID="lez4" Cls="hvr-ripple-out" Height="30px" Width="180px">
                                <DirectEvents>
                                    <Tap OnEvent="bottone">
                                        <ExtraParams>
                                            <ext:Parameter Name="n3" Value="3" Mode="Value" />
                                        </ExtraParams>
                                    </Tap>
                                </DirectEvents>
                            </ext:Label>
                        </span></a>
                    </li>
                    <li><a href="#">
                        <span>
                            <ext:Label runat="server" ID="lez5" Cls="hvr-ripple-out" Height="30px" Width="180px">
                                <DirectEvents>
                                    <Tap OnEvent="bottone">
                                        <ExtraParams>
                                            <ext:Parameter Name="n4" Value="4" Mode="Value" />
                                        </ExtraParams>
                                    </Tap>
                                </DirectEvents>
                            </ext:Label>
                        </span></a>
                    </li>
                    <li><a href="#" class="hvr-ripple-out"><i class="fa fa-plus"></i><span></span></a></li>
                </ul>
            </div>
        
        <table>
            <tr>
                <td class="description"><ext:Label runat="server" ID="nomLez" Cls="description"></ext:Label></td>
                <td></td>
            </tr>
            <tr>
                <td class="description"><ext:Label runat="server" Hidden="true" Cls="description" Text="Modalità: " ID="mods" ></ext:Label>
                        <ext:ComboBox runat="server" Hidden="true" ID="cmb">
                            <Items>
                                <ext:ListItem Text="In classe" Value="CL" />
                                <ext:ListItem Text="Uscita Didattica" Value="UD" />
                                <ext:ListItem Text="Laboratorio" Value="LAB" />
                            </Items>
                        </ext:ComboBox>
                    </td>
                </tr>
            <tr>
                <td class="description"><ext:Label runat="server" ID="descLez" Cls="description"></ext:Label></td>
                <td></td>
            </tr>
            <tr>
                <td class="description"><ext:Label runat="server" ID="totdurata" Cls="description"></ext:Label></td>
                <td></td>
            </tr>
        </table>
        
    </div>
</body>
</html>