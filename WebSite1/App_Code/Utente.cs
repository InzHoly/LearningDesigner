using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrizione di riepilogo per Class1
/// </summary>
public class Utente
{
    private String email;
    private String nome;
    private String password;
    private Boolean admin;

    public Utente(string email, string nome, string password, bool admin)
    {
        this.email = email;
        this.nome = nome;
        this.password = password;
        this.admin = admin;
    }

    public Utente()
    {
        //
        // TODO: aggiungere qui la logica del costruttore
        //
    }

    public String getEmail()
    {
        return this.email;
    }

    public String getNome()
    {
        return this.nome;
    }

    public String getPassword()
    {
        return this.password;
    }

    public Boolean getAdmin()
    {
        return this.admin;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public void setNome(String nome)
    {
        this.nome = nome;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public void setAdmin(Boolean admin)
    {
        this.admin = admin;
    }
}