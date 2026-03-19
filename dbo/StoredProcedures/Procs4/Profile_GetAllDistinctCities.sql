IF OBJECT_ID('[dbo].[Profile_GetAllDistinctCities]', 'P') IS NOT NULL
    DROP PROCEDURE [dbo].[Profile_GetAllDistinctCities];
GO

CREATE PROCEDURE [dbo].[Profile_GetAllDistinctCities]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
        [CityId],
        [CityName]
    FROM [dbo].[Cities]
    ORDER BY [CityName];
END
GO
