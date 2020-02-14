CREATE TABLE [dbo].[Table]
(
	[id] INT NOT NULL PRIMARY KEY,
	[email] varchar(30) not null,
	[nome] varchar(30) not null,
	[password] varchar(30) not null,
	[admin] bit not null default 0
)
