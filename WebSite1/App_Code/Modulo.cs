using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descrizione di riepilogo per Class1
/// </summary>
public class Modulo
{
    private String nome;
    private int IDAutore;
    private String tag;
    private String obbiettivo;
    private String competenze;
    private String descrizione;
    private String classe;
    private String corso;
    private int Nlezioni;
    private int durata;
    private String AnnoScolastico;
    private List<Lezione> elenco;

    


    public Modulo()
    {
        //Oggetto modulo composto da un'array di lezioni + ID autore +array di ID utenti con cui è condiviso + tag
        // TODO: aggiungere qui la logica del costruttore
        //
        this.elenco = new List<Lezione>();

    }

    public Modulo(string nome, int IDAutore, string tag, string obbiettivo, string competenze, string descrizione, string classe, string corso, int nlezioni, int durata, string annoScolastico)
    {
        this.elenco = new List<Lezione>();
        this.nome = nome;
        this.IDAutore = IDAutore;
        this.tag = tag;
        this.obbiettivo = obbiettivo;
        this.competenze = competenze;
        this.descrizione = descrizione;
        this.classe = classe;
        this.corso = corso;
        this.Nlezioni = nlezioni;
        this.durata = durata;
        this.AnnoScolastico = annoScolastico;
    }

    //getlista di attività

    public void addLezione(Lezione l)
    {
        elenco.Add(l);
    }

    public Lezione getLezione(int i)
    {
        return elenco.ElementAt(i);
    }

    public string getAnnoScolastico()
    {
        return this.AnnoScolastico;
    }

    public int getDurata()
    {
        return this.durata;
    }

    public int getNLezioni()
    {
        return this.Nlezioni;
    }

    public string getCorso()
    {
        return this.corso;
    }

    public string getClasse()
    {
        return this.classe;
    }

    public string getDescrizione()
    {
        return this.descrizione;
    }

    public string getCompetenze()
    {
        return this.competenze;
    }

    public string getObbiettivo()
    {
        return this.obbiettivo;
    }

    public string getTag()
    {
        return this.tag;
    }

    public int getIDAutore()
    {
        return this.IDAutore;
    }

    public string getNome()
    {
        return this.nome;
    }

    public void setNome(String nome)
    {
        this.nome = nome;
    }

    public void setIDAutore(int IDAutore)
    {
        this.IDAutore = IDAutore;
    }

    public void setTag(String tag)
    {
        this.tag = tag;
    }

    public void setObbiettivo(String obbiettivo)
    {
        this.obbiettivo = obbiettivo;
    }

    public void setCompetenze(String competenze)
    {
        this.competenze = competenze;
    }

    public void setDescrizione(String descrizione)
    {
        this.descrizione = descrizione;
    }

    public void setClasse(String classe)
    {
        this.classe = classe;
    }

    public void setCorso(String corso)
    {
        this.corso = corso;
    }

    public void setNlezioni(int Nlezioni)
    {
        this.Nlezioni = Nlezioni;
    }

    public void setDurata(int durata)
    {
        this.durata = durata;
    }

    public void setAnnoScolastico(String AnnoScolastico)
    {
        this.AnnoScolastico = AnnoScolastico;
    }

}