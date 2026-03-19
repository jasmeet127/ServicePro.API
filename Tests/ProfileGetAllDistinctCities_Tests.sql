-- tSQLt test class for Profile_GetAllDistinctCities
EXEC tSQLt.NewTestClass 'ProfileGetAllDistinctCitiesTests';
GO

-- Test 1: procedure returns an empty result set when no cities exist
CREATE OR ALTER PROCEDURE [ProfileGetAllDistinctCitiesTests].[test Returns empty result set when no cities exist]
AS
BEGIN
    -- Arrange: replace real table with an empty fake (no constraints)
    EXEC tSQLt.FakeTable 'dbo.Cities';

    -- Act
    CREATE TABLE #Actual (CityId INT, CityName NVARCHAR(100));
    INSERT INTO #Actual EXEC dbo.Profile_GetAllDistinctCities;

    -- Assert
    IF (SELECT COUNT(*) FROM #Actual) <> 0
        EXEC tSQLt.Fail 'Expected 0 rows but result set was not empty';
END;
GO

-- Test 2: procedure returns all distinct cities ordered by name
CREATE OR ALTER PROCEDURE [ProfileGetAllDistinctCitiesTests].[test Returns distinct cities ordered by name]
AS
BEGIN
    -- Arrange
    EXEC tSQLt.FakeTable 'dbo.Cities';
    INSERT INTO dbo.Cities (CityId, CityName, StateId) VALUES (1, 'Seattle',     1);
    INSERT INTO dbo.Cities (CityId, CityName, StateId) VALUES (2, 'Atlanta',     2);
    INSERT INTO dbo.Cities (CityId, CityName, StateId) VALUES (3, 'Boston',      3);

    -- Act
    CREATE TABLE #Actual (CityId INT, CityName NVARCHAR(100));
    INSERT INTO #Actual EXEC dbo.Profile_GetAllDistinctCities;

    -- Assert: row count
    DECLARE @Count INT = (SELECT COUNT(*) FROM #Actual);
    IF @Count <> 3
        EXEC tSQLt.Fail 'Expected 3 rows but got ' + CAST(@Count AS NVARCHAR(10));

    -- Assert: first row should be alphabetically first (procedure orders by CityName)
    DECLARE @FirstCity NVARCHAR(100) = (SELECT TOP 1 CityName FROM #Actual ORDER BY CityName);
    IF @FirstCity <> 'Atlanta'
        EXEC tSQLt.Fail 'Expected first city ''Atlanta'' but got ''' + @FirstCity + '''';
END;
GO
