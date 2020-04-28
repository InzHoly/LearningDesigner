using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

public partial class Inserimento_modulo : System.Web.UI.Page
{
    public String Querys(String n, String p,String c, String d, String corso, String anno,String tag, String classe,int stato, String user)
    {

        String risposta = "";
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\lddb.mdf;Integrated Security=True");
        SqlCommand command = new SqlCommand("INSERT INTO Moduli (nome,prerequisiti,competenze,descrizione,corso,anno_corso,tag,classe,pubblica,idUtente) VALUES (@nome,@prerequisiti,@comp,@desc,@corso,@anno,@tag, @classe,@stato, @user);", connection);
        command.Parameters.AddWithValue("@nome", n);
        command.Parameters.AddWithValue("@prerequisiti", p);
        command.Parameters.AddWithValue("@comp", c);
        command.Parameters.AddWithValue("@desc", d);
        command.Parameters.AddWithValue("@corso", corso);
        command.Parameters.AddWithValue("@anno", anno);
        command.Parameters.AddWithValue("@tag", tag);
        command.Parameters.AddWithValue("@classe", classe);
        command.Parameters.AddWithValue("@stato", stato);
        command.Parameters.AddWithValue("@user", user);
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