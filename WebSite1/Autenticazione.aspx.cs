using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void Login(object sender, EventArgs e)
    {   
        String n = user.Text;
        String p = password.Text;
        if (Query("SELECT password FROM [Utenti] where nome ='"+n+"';").Equals(""))
            user.Text = "nome utente sbaliato";
        else
            if (Query("SELECT password FROM [Utenti] where nome ='"+n+"';").Equals(p))
            {
                Session.Add("login",true);
                Response.Redirect("Elenco_moduli.aspx");
            }
            else
            {
                
            }

    }
    public String Query(String sql)
    {

        String risposta = "";
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\lddb.mdf;Integrated Security=True");
        SqlCommand command = new SqlCommand(sql, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            for (int i = 0; i < reader.FieldCount; i++)
                risposta += reader.GetValue(i);
        }
        connection.Close();
        return risposta;
    }
}

