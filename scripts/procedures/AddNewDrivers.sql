CREATE PROCEDURE AddNewDriver
    @drvFirstName NVARCHAR(50),
    @drvLastName NVARCHAR(50),
    @drvLicenseNumber NVARCHAR(20),
    @drvBirthDate DATE,
    @drvHireDate DATE,
    @drvTerminationDate DATE = NULL
AS
BEGIN
    -- Check if all required fields are provided
    IF @drvFirstName IS NULL OR @drvLastName IS NULL OR @drvLicenseNumber IS NULL OR @drvBirthDate IS NULL OR @drvHireDate IS NULL
    BEGIN
        RAISERROR('All fields except termination date must be provided.', 16, 1);
        RETURN;
    END

    -- Check the length of the first name
    IF LEN(@drvFirstName) < 2 OR LEN(@drvFirstName) > 50
    BEGIN
        RAISERROR('First name must be between 2 and 50 characters.', 16, 1);
        RETURN;
    END

    -- Check the length of the last name
    IF LEN(@drvLastName) < 2 OR LEN(@drvLastName) > 50
    BEGIN
        RAISERROR('Last name must be between 2 and 50 characters.', 16, 1);
        RETURN;
    END

    -- Check if the birth date is logical (driver must be at least 18 years old)
    IF DATEDIFF(YEAR, @drvBirthDate, GETDATE()) < 18
    BEGIN
        RAISERROR('Driver must be at least 18 years old.', 16, 1);
        RETURN;
    END

    -- Check if the hire date is not in the future
    IF @drvHireDate > GETDATE()
    BEGIN
        RAISERROR('Hire date cannot be in the future.', 16, 1);
        RETURN;
    END

    -- Check if the termination date is not earlier than the hire date
    IF @drvTerminationDate IS NOT NULL AND @drvTerminationDate < @drvHireDate
    BEGIN
        RAISERROR('Termination date cannot be earlier than hire date.', 16, 1);
        RETURN;
    END

    -- Add the new driver to the table
    INSERT INTO tblDrivers (drvFirstName, drvLastName, drvLicenseNumber, drvBirthDate, drvHireDate, drvTerminationDate)
    VALUES (@drvFirstName, @drvLastName, @drvLicenseNumber, @drvBirthDate, @drvHireDate, @drvTerminationDate);

    PRINT 'New driver added successfully.';
END;
