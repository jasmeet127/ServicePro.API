IF NOT EXISTS (
    SELECT * FROM sys.tables
    WHERE name = 'States' AND schema_id = SCHEMA_ID('dbo')
)
BEGIN
    CREATE TABLE [dbo].[States] (
        [StateId]   INT            IDENTITY (1, 1) NOT NULL,
        [StateName] NVARCHAR (100) NOT NULL,
        [StateCode] NVARCHAR (10)  NULL,
        [CountryId] INT            NOT NULL,
        CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED ([StateId] ASC),
        CONSTRAINT [FK_States_Countries] FOREIGN KEY ([CountryId])
            REFERENCES [dbo].[Countries] ([CountryId])
    );
END
GO
