using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

public partial class Elenco_moduli : System.Web.UI.Page
{

    public String query(String sql)
    {
        
        String risposta = "";
        SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;user id=UserDef;Initial Catalog=C:\\USERS\\LUCA\\DOCUMENTS\\GITREPOS\\LEARNINGDESIGNER\\WEBSITE1\\APP_DATA\\LNDB.MDF;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        SqlCommand command = new SqlCommand(sql, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            risposta += reader.GetString(0) + " " + reader.GetString(1);
        }
        connection.Close();
        return risposta;
    }
    
}