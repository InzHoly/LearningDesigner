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
    public String nome;
    public String descrizione;
    public int modalita;
    private int totore;
    private List<Attivita> elenco;

    public Lezione(int numero,String descrizione,int modalita, int totore)
    {
        this.numero = numero;
        this.modalita = modalita;
        this.descrizione = descrizione;
        this.totore = totore;
    }

    public Lezione()
    {
        //
        // TODO: aggiungere qui la logica del costruttore
        //
    }

    public String getDescrizione()
    {
        return this.descrizione;
    }

    public void setDescrizione(String descrizione)
    {
        this.descrizione = descrizione;
    }

    public int getModalita()
    {
        return this.modalita;
    }

    public void setModalita(int modalita)
    {
        this.modalita = modalita;
    }

    public String getNome()
    {
        return this.nome;
    }

    public void setNome(String n)
    {
        this.nome = n;
    }

    

    

    public int getTotore()
    {
        return this.totore;
    }

    

    

    public void setTotore(int totore)
    {
        this.totore = totore;
    }


}