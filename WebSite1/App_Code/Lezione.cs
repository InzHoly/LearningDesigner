using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrizione di riepilogo per Class1
/// </summary>
public class Lezione
{
    private int numero;
    private DateTime data;
    private int totore;
    private List<Attivita> elenco;

    public Lezione(int numero, DateTime data, int totore)
    {
        this.numero = numero;
        this.data = data;
        this.totore = totore;
    }

    public Lezione()
    {
        //
        // TODO: aggiungere qui la logica del costruttore
        //
    }

    public int getNumero()
    {
        return this.numero;
    }

    public DateTime getData()
    {
        return this.data;
    }

    public int getTotore()
    {
        return this.totore;
    }

    public void setNumero(int numero)
    {
        this.numero = numero;
    }

    public void setData(DateTime data)
    {
        this.data = data;
    }

    public void setTotore(int totore)
    {
        this.totore = totore;
    }


}