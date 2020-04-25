CREATE TABLE [dbo].[Moduli] (
    [Id]           INT           NOT NULL,
    [nome]         VARCHAR (30)  NOT NULL,
    [prerequisiti] VARCHAR (100) NOT NULL,
    [competenze]   VARCHAR (100) NOT NULL,
    [descrizione]  VARCHAR (300) NOT NULL,
    [corso]        VARCHAR (30)  NOT NULL,
    [anno_corso]   VARCHAR (30)  NOT NULL,
    [tag]          VARCHAR (30)  NOT NULL,
    [idUtente]     INT           NOT NULL,
    [classe]       NCHAR (20)    NOT NULL,
    [totlez]       INT           NULL,
	[pubblica]     INT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

