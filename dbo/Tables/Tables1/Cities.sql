IF NOT EXISTS (
    SELECT * FROM sys.tables
    WHERE name = 'Cities' AND schema_id = SCHEMA_ID('dbo')
)
BEGIN
    CREATE TABLE [dbo].[Cities] (
        [CityId]   INT            IDENTITY (1, 1) NOT NULL,
        [CityName] NVARCHAR (100) NOT NULL,
        [StateId]  INT            NOT NULL,
        CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED ([CityId] ASC),
        CONSTRAINT [FK_Cities_States] FOREIGN KEY ([StateId])
            REFERENCES [dbo].[States] ([StateId])
    );
END
GO
