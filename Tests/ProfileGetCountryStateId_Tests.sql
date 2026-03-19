-- tSQLt test class for Profile_GetCountryStateId
EXEC tSQLt.NewTestClass 'ProfileGetCountryStateIdTests';
GO

-- Test 1: returns the correct country and state for a known city
CREATE OR ALTER PROCEDURE [ProfileGetCountryStateIdTests].[test Returns correct CountryId and StateId for given CityId]
AS
BEGIN
    -- Arrange: replace real tables with fakes (no constraints / identity)
    EXEC tSQLt.FakeTable 'dbo.Countries';
    EXEC tSQLt.FakeTable 'dbo.States';
    EXEC tSQLt.FakeTable 'dbo.Cities';

    INSERT INTO dbo.Countries (CountryId, CountryName, CountryCode) VALUES (1, 'United States', 'US');
    INSERT INTO dbo.States    (StateId,   StateName,   StateCode, CountryId) VALUES (10, 'Washington', 'WA', 1);
    INSERT INTO dbo.Cities    (CityId,    CityName,    StateId)              VALUES (100, 'Seattle',   10);

    -- Act
    CREATE TABLE #Actual (CountryId INT, StateId INT);
    INSERT INTO #Actual EXEC dbo.Profile_GetCountryStateId @CityId = 100;

    -- Assert: exactly one row returned
    IF (SELECT COUNT(*) FROM #Actual) <> 1
        EXEC tSQLt.Fail 'Expected exactly 1 row';

    DECLARE @CountryId INT = (SELECT TOP 1 CountryId FROM #Actual);
    DECLARE @StateId   INT = (SELECT TOP 1 StateId   FROM #Actual);

    IF @CountryId <> 1
        EXEC tSQLt.Fail 'Expected CountryId = 1 but got ' + CAST(@CountryId AS NVARCHAR(10));

    IF @StateId <> 10
        EXEC tSQLt.Fail 'Expected StateId = 10 but got ' + CAST(@StateId AS NVARCHAR(10));
END;
GO

-- Test 2: returns an empty result set for a city that does not exist
CREATE OR ALTER PROCEDURE [ProfileGetCountryStateIdTests].[test Returns empty result for non-existent CityId]
AS
BEGIN
    -- Arrange
    EXEC tSQLt.FakeTable 'dbo.Countries';
    EXEC tSQLt.FakeTable 'dbo.States';
    EXEC tSQLt.FakeTable 'dbo.Cities';

    -- Act (no rows inserted – city 9999 does not exist)
    CREATE TABLE #Actual (CountryId INT, StateId INT);
    INSERT INTO #Actual EXEC dbo.Profile_GetCountryStateId @CityId = 9999;

    -- Assert
    IF (SELECT COUNT(*) FROM #Actual) <> 0
        EXEC tSQLt.Fail 'Expected 0 rows for a non-existent CityId';
END;
GO
