/*
-- Create the TransBetterEX database
CREATE DATABASE TransBetterEX;
GO


CREATE TABLE tblDrivers (
    drvDriverID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    drvFirstName NVARCHAR(50) NOT NULL,
    drvLastName NVARCHAR(50) NOT NULL,
	drvBirthDate DATE NOT NULL,
    drvLicenseNumber NVARCHAR(50) NOT NULL,
	drvHireDate DATE NOT NULL,
	drvTerminationDate DATE NULL
);
GO

CREATE TABLE tblCars (
    carCarID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    carMake NVARCHAR(50) NOT NULL,
    carModel NVARCHAR(50) NOT NULL,
    carYearManufacture DATE NOT NULL,
    carYearFirstRegistration DATE NOT NULL,
    carLicensePlate NVARCHAR(20) NOT NULL,
    carVIN NVARCHAR(50) NOT NULL,
    carColor NVARCHAR(20)
);
GO

CREATE TABLE tblSchedule (
    schScheduleID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    schDriverID INT NOT NULL,
    schCarID INT NOT NULL,
    schDate DATE NOT NULL,
    schStartTime TIME NOT NULL,
    schEndTime TIME NOT NULL,
    CONSTRAINT FK_Schedule_Driver FOREIGN KEY (schDriverID) REFERENCES tblDrivers(drvDriverID),
    CONSTRAINT FK_Schedule_Car FOREIGN KEY (schCarID) REFERENCES tblCars(carCarID)
);
GO

*/