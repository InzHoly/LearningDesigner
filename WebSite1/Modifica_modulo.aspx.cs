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

    public int Aggiornamento(String n, String p,String c, String d, String anno, String corso, String classe, String tag, int stato, int user)
    {

        String risposta = "";
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\lddb.mdf;Integrated Security=True");
        SqlCommand command = new SqlCommand("update [Moduli] set nome = @nome, prerequisiti = @prerequisiti, competenze = @comp, descrizione = @desc, corso = @corso, anno_corso = @anno, tag = @tag, classe = @classe, pubblica = @stato, idUtente = @user where id ="+(int)Session["modid"], connection);
        command.Parameters.AddWithValue("@nome", n);
        command.Parameters.AddWithValue("@prerequisiti", p);
        command.Parameters.AddWithValue("@comp", c);
        command.Parameters.AddWithValue("@desc", d);
        command.Parameters.AddWithValue("@anno", anno);
        command.Parameters.AddWithValue("@corso", corso);
        command.Parameters.AddWithValue("@classe", classe);
        command.Parameters.AddWithValue("@tag", tag);
        command.Parameters.AddWithValue("@stato", stato);
        command.Parameters.AddWithValue("@user", user);
        connection.Open();
        int res = command.ExecuteNonQuery();
        connection.Close();
        return res;
    }
}