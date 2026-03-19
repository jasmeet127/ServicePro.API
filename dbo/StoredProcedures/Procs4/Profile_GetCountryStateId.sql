IF OBJECT_ID('[dbo].[Profile_GetCountryStateId]', 'P') IS NOT NULL
    DROP PROCEDURE [dbo].[Profile_GetCountryStateId];
GO

CREATE PROCEDURE [dbo].[Profile_GetCountryStateId]
    @CityId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        c.[CountryId],
        s.[StateId]
    FROM [dbo].[Cities] ci
    INNER JOIN [dbo].[States]    s ON ci.[StateId]  = s.[StateId]
    INNER JOIN [dbo].[Countries] c ON  s.[CountryId] = c.[CountryId]
    WHERE ci.[CityId] = @CityId;
END
GO
