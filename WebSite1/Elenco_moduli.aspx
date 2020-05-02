<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Elenco_moduli.aspx.cs" Inherits="Elenco_moduli" %>

<!DOCTYPE html>

<script runat="server">

        Modulo d;
        Modulo s;
        Lezione att= new Lezione();
        int astro;
        int idlez;
        int id;
        int nlezioni;
        protected void Page_Load(object sender, EventArgs p)
        {

            Session["modid"] = int.Parse(Request.QueryString["id"]);

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


        att.setNome("1939, l'inizio");
        att.setDescrizione("Dopo che la Germania invase la Polonia, Francia e Gran Bretagna dichiararono guerra a Hitler");
        att.setTotore(3);
        att.setModalita(0);

        att.addAttivita(at1);
        att.addAttivita(at2);
        att.addAttivita(at3);
        att.addAttivita(at4);
        if(Session["lastlez"] == null)
            Session["lastlez"] = 5;
        int i = (int)Session["lastlez"]-4;



        Modulo_Nome.Text = Query("SELECT nome FROM Moduli WHERE Id = 2");
        Modulo_Anno.Text= Query("SELECT anno_corso FROM Moduli WHERE Id = 2");
        Modulo_Competenze.Text = Query("SELECT competenze FROM Moduli WHERE Id = 2");
        Modulo_Classe.Text = Query("SELECT classe FROM Moduli WHERE Id = 2");
        Modulo_Corso.Text = Query("SELECT corso FROM Moduli WHERE Id = 2");
        Modulo_Descrizione.Text = Query("SELECT descrizione FROM Moduli WHERE Id = 2");
        Modulo_Prerequisiti.Text = Query("SELECT prerequisiti FROM Moduli WHERE Id = 2");
        Modulo_Nlezioni.Text = Query("SELECT totlez FROM Moduli WHERE Id = 2");

        id = 1;
        if(Request.Params["id"]!=null)//perchè altrimenti cazzo crasha 
            id = int.Parse(Request.Params["id"]);
        Modulo_Nome.Text = Query("SELECT nome FROM Moduli WHERE Id = "+id);
        Modulo_Anno.Text= Query("SELECT anno_corso FROM Moduli WHERE Id = "+id);
        Modulo_Competenze.Text = Query("SELECT competenze FROM Moduli WHERE Id ="+id);
        Modulo_Classe.Text = Query("SELECT classe FROM Moduli WHERE Id = "+id);
        Modulo_Corso.Text = Query("SELECT corso FROM Moduli WHERE Id = "+id);
        Modulo_Descrizione.Text = Query("SELECT descrizione FROM Moduli WHERE Id = "+id);
        Modulo_Prerequisiti.Text = Query("SELECT prerequisiti FROM Moduli WHERE Id = "+id);
        Modulo_Nlezioni.Text = Query("SELECT totlez FROM Moduli WHERE Id = "+id);


        nlezioni = int.Parse(Query("SELECT count(*) FROM [Lezioni] group by Modulo having Modulo = " + id + ";"));
        
        lez1.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+i+";");i++;
        lez2.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+i+";");i++;
        lez3.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+i+";");i++;
        lez4.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+i+";");i++;
        lez5.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+i+";");i++;

    }

    protected void sposta(object sender, DirectEventArgs e)
    {
        String dir = e.ExtraParams.GetParameter("dir").Value;
        int par = (int)Session["lastlez"];
        if (dir.Equals("d") && !(par >= nlezioni))
        {
            par++;
            lez1.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+par+";");par++;
            lez2.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+par+";");par++;
            lez3.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+par+";");par++;
            lez4.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+par+";");par++;
            lez5.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+par+";");Session["lastlez"] = par;
        }
        if(dir.Equals("s") && par > 5){
            par -= 5;
            lez5.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+par+";");par--;
            lez4.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+par+";");par--;
            lez3.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+par+";");par--;
            lez2.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+par+";");par--;
            lez1.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+" and nlez="+par+";");par += 4; Session["lastlez"] = par;
        }

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

        int index = int.Parse(txt)+1+(int)Session["lastlez"]-5;

        //Lezione lez = s.getLezione(index-1);
        nomLez.Text = Query("SELECT nome FROM [Lezioni] WHERE Modulo="+id+"AND nlez="+index);
        mods.Hidden = false;
        cmb.Hidden = false;
        descLez.Text = "Descrizione: " + Query("SELECT descrizione FROM [Lezioni] WHERE Modulo="+id+"AND nlez="+index);;
        totdurata.Text ="Durata totale: "+ Query("SELECT totore FROM [Lezioni] WHERE Modulo="+id+"AND nlez="+index) + " ore";
        switch ( int.Parse(Query("SELECT modalità FROM [Lezioni] WHERE Modulo="+id+" AND nlez="+index)))
        {
            case 0:cmb.SetValue("In classse");break;
            case 1:cmb.SetValue("Uscita didattica");break;
            case 2:cmb.SetValue("Laboratorio");break;
        }
        cmb.Hidden = false;
        //att = lez;
        idlez = int.Parse(Query("SELECT id FROM [Lezioni] WHERE Modulo=" + id + "AND nlez=" + index));
        String mostraidlez = "" + idlez;
        astro = idlez;
        Session["idlez"] = ""+idlez;
        //X.Msg.Alert(mostraidlez, mostraidlez).Show();
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


    protected void AggiungiAtt(object sender, DirectEventArgs e)
    {
        String iddellalez = (String)Session["idlez"];
        //X.Msg.Alert("Id da passare",""+iddellalez).Show();
        Response.Redirect("Inserimento_attivita.aspx?Lezione=" +iddellalez );
    }
    protected void ModificaAtt(object sender, DirectEventArgs e)//wip
    {
        //String iddellAtt = (String)Session["idAtt"];
        //X.Msg.Alert("Id da passare",""+iddellalez).Show();
        //Response.Redirect("Inserimento_attivita.aspx?Lezione=" +iddellalez );
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Stile.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
    <h1 class="header"><a href="Modifica_modulo.aspx">Modifica il modulo</a></h1>
    <div class="details">
        <div class="text1">
            <table>
                <tr>
                    <td class="leftColumn">Nome :
                    </td>
                    <td>
                        <ext:Label runat="server"  ID="Modulo_Nome"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Competenze :
                    </td>
                    <td>
                        <ext:Label runat="server"  ID="Modulo_Competenze"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Prerequisiti :
                    </td>
                    <td>
                        <ext:Label runat="server"  ID="Modulo_Prerequisiti"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Descrizione :
                    </td>
                    <td>
                        <ext:Label runat="server"  ID="Modulo_Descrizione" Cls="longString"></ext:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div class="text2">
            <table>
                <tr>
                    <td class="leftColumn">Corso :
                    </td>
                    <td>
                        <ext:Label runat="server"  ID="Modulo_Corso"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Anno :
                    </td>
                    <td>
                        <ext:Label runat="server"  ID="Modulo_Anno"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Classe :
                    </td>
                    <td>
                        <ext:Label runat="server"  ID="Modulo_Classe"></ext:Label>
                    </td>
                </tr>
                <tr>
                    <td class="leftColumn">Numero Lezioni :
                    </td>
                    <td>
                        <ext:Label runat="server"  ID="Modulo_Nlezioni" ></ext:Label>
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
        <Buttons>
            <ext:Button runat="server" ID="bottoneadatt" Icon="Add">
                <DirectEvents>
                    <Click OnEvent="AggiungiAtt"></Click>
                </DirectEvents>
            </ext:Button>
            <ext:Button runat="server" ID="Button2" Icon="ApplicationEdit">
                <DirectEvents>
                    <Click OnEvent="ModificaAtt"></Click>
                </DirectEvents>
            </ext:Button>
        </Buttons>
    </ext:Window>
    <br />
    <br />
    
    <div class="lezione">
        

        <h2>Lezioni</h2>

        <br />
        
        <div id="menunav" class="menu" runat="server">
            <div id="navigationbar" runat="server">
                <ul>
                    <li><a href="#">
                        <span>
                            <ext:Label runat="server" Text="<" ID="sinistra" Cls="hvr-ripple-out" Height="30px" Width="30px">
                                <DirectEvents>
                                    <Tap OnEvent="sposta">
                                        <ExtraParams>
                                            <ext:Parameter Name="dir" Value="s" Mode="Value" />
                                        </ExtraParams>
                                    </Tap>
                                </DirectEvents>
                            </ext:Label>
                        </span></a>
                    </li>
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
                    <li><a href="#">
                        <span>
                            <ext:Label runat="server" Text=">" ID="destra" Cls="hvr-ripple-out" Height="30px" Width="30px">
                                <DirectEvents>
                                    <Tap OnEvent="sposta">
                                        <ExtraParams>
                                            <ext:Parameter Name="dir" Value="d" Mode="Value" />
                                        </ExtraParams>
                                    </Tap>
                                </DirectEvents>
                            </ext:Label>
                        </span></a>
                    </li>
                    <li><a href="inserimento_lezione.aspx?modulo=<%=id %>" class="hvr-ripple-out"><i class="fa fa-plus" id="piu"></i><span></span></a></li>
                    <li><a href="modifica_lezione.aspx?lezione=<%=(String)Session["idlez"]%>" class="hvr-ripple-out"><i class="material-icons" id="piu2">mode_edit</i><span></span></a></li>
                </ul>
            </div>
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