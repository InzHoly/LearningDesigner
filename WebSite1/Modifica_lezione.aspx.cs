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

    public int Aggiornamento(int idlez, String nome, String descrizione, int mod, int totore)
    {
        try
        {
            int ris;
            SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\lddb.mdf;Integrated Security=True");
            SqlCommand command = new SqlCommand("update [Lezioni] set nome = @nome, descrizione = @desc, modalità = @mod, totore = @totore where id = @id;", connection);
            command.Parameters.AddWithValue("@nome", nome);
            command.Parameters.AddWithValue("@desc", descrizione);
            command.Parameters.AddWithValue("@mod", mod);
            command.Parameters.AddWithValue("@totore", totore);
            command.Parameters.AddWithValue("@id", idlez);
            connection.Open();
            ris = command.ExecuteNonQuery();
            connection.Close();
            return ris;
        }
        catch (Exception e)
        {
            return -1;
        }
    }
}