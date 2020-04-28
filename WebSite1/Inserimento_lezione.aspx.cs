using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    public String Querys(String sql)
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

    public String Inserimento(String nome, String descrizione, int modulo,int mod,int nlez, int totore)
    {

        String risposta = "";
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\lddb.mdf;Integrated Security=True");
        SqlCommand command = new SqlCommand("INSERT INTO Lezioni (nome, descrizione, Modulo, modalità, nlez, totore) VALUES (@nome,@desc,@modulo,@mod,@nlez,@totore);", connection);
        command.Parameters.AddWithValue("@nome", nome);
        command.Parameters.AddWithValue("@desc", descrizione);
        command.Parameters.AddWithValue("@modulo", modulo);
        command.Parameters.AddWithValue("@mod", mod);
        command.Parameters.AddWithValue("@nlez", nlez);
        command.Parameters.AddWithValue("@totore", totore);
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