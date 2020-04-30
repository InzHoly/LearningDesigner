using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void Reset(object sender, EventArgs e)
    {
        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            String from = "learner.designing@gmail.com";//email ad usare
            mail.From = new MailAddress(from);
            mail.To.Add(email.Text);
            mail.Subject = "Recupero Password LearningDesigner";
            String password = Query("select password from [Utenti] where email = '" + email.Text + "'");
            if (password == "")
                mail.Body = "E' stata inoltrata una richiesta di recupero password ma non sembra esserci nessun account LearningDesigner collegato ad essa.\nSe credi ci sia un errore contatta qualcuno per ricevere assistenza.\nGrazie.";
            else
                mail.Body = "La password associata a questo indirizzo email è : "+password;

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential(from, "eneamucino10");
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);
            Response.Redirect("Login.aspx");
            return;
        }
        catch (Exception ex)
        {
            Console.WriteLine("Exception caught in CreateTestMessage2(): {0}",
                ex.ToString());
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