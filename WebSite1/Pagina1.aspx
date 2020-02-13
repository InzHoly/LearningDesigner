<%@ Page Language="C#" %>

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

        PanelNome.Text ="Nome Modulo: "+ d.getNome();
        PanelAnnoScolastisco.Text = "Anno scolastico: " + d.getAnnoScolastico();
        PanelClasse.Text = "Classe: " + d.getClasse();
        PanelCorso.Text = "Corso: " + d.getCorso();
        //this.maramiao.InnerText = d.getNome();
    }

    protected void AddTab(object sender, DirectEventArgs e)
        {
            

            Ext.Net.Panel panel = new Ext.Net.Panel
            {
                Title = "New Tab",
                Layout = "Fit",
                
            };

            
                var closeToolbar = new Toolbar();
                closeToolbar.Add(new Ext.Net.Button()
                {
                    Text = "Close",
                    Handler = "this.up('panel').destroy();"
                });
                panel.TopBar.Add(closeToolbar);
            

            TabPanel1.Add(panel);
            panel.Render();

            TabPanel1.SetLastTabAsActive();
        }
</script>


<!DOCTYPE html>

<html>
<head runat="server">
    <title>Using Actions - Ext.NET Examples</title>
</head>
<body>
    <ext:ResourceManager runat="server" />
    
        <a href="Elenco_moduli.aspx">SCHIACCIAMI TI PREGO</a>
            <ext:Label runat="server" Height="100" ID="PanelNome" />
            <br />
            <ext:Label runat="server" Height="120" ID="PanelClasse"/>
            <br />
            <ext:Label runat="server" Height="140" ID="PanelCorso"/>
            <br />
            <ext:Label runat="server"  Height="160" ID="PanelAnnoScolastisco"/>
            

    <ext:TabPanel ID="TabPanel1" runat="server">
                    <TabBar>
                        <ext:Button runat="server" Flat="true" Icon="Add">
                            <DirectEvents>
                                <Click OnEvent="AddTab" />
                            </DirectEvents>
                        </ext:Button>
                        <ext:ToolbarFill runat="server" />
                        <ext:Button runat="server" Flat="true" Icon="Help">
                            <Listeners>
                                <Click Handler="Ext.Msg.alert('Help', 'Here is help message');" />
                            </Listeners>
                        </ext:Button>
                    </TabBar>
                </ext:TabPanel>
    
</body>
</html>