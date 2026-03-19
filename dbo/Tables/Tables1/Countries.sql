IF NOT EXISTS (
    SELECT * FROM sys.tables
    WHERE name = 'Countries' AND schema_id = SCHEMA_ID('dbo')
)
BEGIN
    CREATE TABLE [dbo].[Countries] (
        [CountryId]   INT            IDENTITY (1, 1) NOT NULL,
        [CountryName] NVARCHAR (100) NOT NULL,
        [CountryCode] NVARCHAR (10)  NOT NULL,
        CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED ([CountryId] ASC)
    );
END
GO
