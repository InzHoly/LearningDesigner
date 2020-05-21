using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

public partial class Inserimento_attivita : System.Web.UI.Page
{
    

    public String Aggiornamento(int id, String desc, int mod, int durata, int lezione)
    {

        String risposta = "";
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\lddb.mdf;Integrated Security=True");
        SqlCommand command = new SqlCommand("update attività set descrizione = @desc, tipo = @mod, durata = @durata, lezione = @lezione where id = @id;", connection);
        command.Parameters.AddWithValue("@durata", durata);
        command.Parameters.AddWithValue("@desc", desc);
        command.Parameters.AddWithValue("@lezione", lezione);
        command.Parameters.AddWithValue("@mod", mod);
        command.Parameters.AddWithValue("@id", id);

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
}