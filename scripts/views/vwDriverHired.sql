CREATE VIEW vwHiredDrivers AS
SELECT TOP 100 PERCENT
    drvDriverID,
    drvFirstName,
    drvLastName,
    drvBirthDate,
    drvHireDate
FROM 
    tblDrivers
WHERE 
    drvTerminationDate IS NULL
GO

-- Test the view
SELECT * FROM vwHiredDrivers;
