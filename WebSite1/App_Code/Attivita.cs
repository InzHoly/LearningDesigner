using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrizione di riepilogo per Attivita
/// </summary>
public class Attivita
{
    private int tipo;
    private String descrizione;
    private int durata;
    
    

    public Attivita()
    {
        //
        // TODO: aggiungere qui la logica del costruttore
        //
    }

    public Attivita(int tipo, string descrizione, int durata)
    {
        this.tipo = tipo;
        this.descrizione = descrizione;
        this.durata = durata;
    }

    public void setTipo(int tipo)
    {
        this.tipo = tipo;
    }

    public void setDescrizione(string descrizione)
    {
        this.descrizione = descrizione;
    }

    public void setDurata(int durata)
    {
        this.durata = durata;
    }

    public int getTipo()
    {
        return tipo;
    }

    public string getDescrizione()
    {
        return descrizione;
    }

    public int getDurata()
    {
        return durata;
    }

}