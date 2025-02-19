# Microsoft SQL Server Database exercise - Library database

Technologies used:
- MS SQL Server 2022
- SQLCMD 
- Ubuntu 22.04 (WSL2)
- Azure Data Studio

The repository contains both the SQL script queries and their results in JSON format. Additionally, the SQL data can be found in the SQL files folder for quick import.

There are 13 queries created, with 2 *stored procedures* which can be executed with custom parameters.

Please follow the below steps to run the data locally:

1. Install MSSQL Server 2022 (or 2019) and the SQLCMD tools
2. Run 'sqlcmd -S <servername> -U <username> -C' to login into SQL Server (password will be required)
3. Run 'CREATE DATABASE LibraryDB'
4. Run 'USE LibraryDB' and the below scripts to insert table data:
<pre>
 #INSERT Authors table
 CREATE TABLE [dbo].[Authors] (
    [AuthorID] INT           IDENTITY (1, 1) NOT NULL,
    [Name]     VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([AuthorID] ASC)
);
</pre>
<pre>
 #INSERT Books table
 CREATE TABLE [dbo].[Books] (
    [BookID]        INT           IDENTITY (1, 1) NOT NULL,
    [Title]         VARCHAR (100) NOT NULL,
    [AuthorID]      INT           NOT NULL,
    [Genre]         VARCHAR (50)  NOT NULL,
    [PublishedYear] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([BookID] ASC),
    FOREIGN KEY ([AuthorID]) REFERENCES [dbo].[Authors] ([AuthorID])
);
</pre>
<pre>
 #INSERT Members table
 CREATE TABLE [dbo].[Members] (
    [MemberID] INT           IDENTITY (1, 1) NOT NULL,
    [Name]     VARCHAR (100) NOT NULL,
    [Email]    VARCHAR (100) NOT NULL,
    [Phone]    VARCHAR (15)  NULL,
    PRIMARY KEY CLUSTERED ([MemberID] ASC)
);
</pre>
<pre>
 #INSERT Borrowing table
 CREATE TABLE [dbo].[Borrowing] (
    [BorrowID]   INT  IDENTITY (1, 1) NOT NULL,
    [MemberID]   INT  NULL,
    [BookID]     INT  NULL,
    [BorrowDate] DATE NOT NULL,
    [ReturnDate] DATE NULL,
    PRIMARY KEY CLUSTERED ([BorrowID] ASC),
    FOREIGN KEY ([BookID]) REFERENCES [dbo].[Books] ([BookID]),
    FOREIGN KEY ([MemberID]) REFERENCES [dbo].[Members] ([MemberID])
);
</pre>
5. With all tables created, run 'sqlcmd -S <servername> -d <databasename> -i <filepath> (SQL table files - e.g. Authors.sql) -C' -> this command will automatically import the data into each aforementioned table
6. Run any query from 'MSSQL queries' folder 
7. Use SQLCMD or any GUI based application of your choice (e.g. Azure Data Studio, DBeaver, Beekeeper Studio etc.)

![Alt text](/home/larex/Programming/Data Engineering/MSSQL Library/Database_details.png)
