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
            SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");//per le email gmail
            String from = "learner.designing@gmail.com";//email ad usare
            mail.From = new MailAddress(from);
            mail.To.Add(email.Text);
            mail.Subject = "Recupero Password LearningDesigner";//oggetto email
            String password = Query("select password from [Utenti] where email = '" + email.Text + "'");
            if (password == "")//controllo se effettivamente esiste un account associato alla mail inserita dall'utente
                mail.Body = "E' stata inoltrata una richiesta di recupero password ma non sembra esserci nessun account LearningDesigner collegato a questa email.\nSe credi ci sia un errore contattaci per ricevere assistenza.\nPer creare un account vai sulla pagina di registrazione learningdesigner.ddns.net/registrazione.aspx.\nGrazie.";
            else
                mail.Body = "La password associata a questo indirizzo email è : "+password+"\nTi consigliamo di cambiarla. Per farlo effettua l'accesso al sito e clicca su cambia password";

            SmtpServer.Port = 587;
            SmtpServer.Credentials = new System.Net.NetworkCredential(from, "eneamucino10");//password della email
            SmtpServer.EnableSsl = true;

            SmtpServer.Send(mail);//manda l'email
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