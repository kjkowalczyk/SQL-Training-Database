CREATE VIEW DriverScheduleWeek 
AS 
SELECT 
    tblDrivers.drvDriverID,
    tblDrivers.drvFirstName,
    tblDrivers.drvLastName,
    tblCars.carCarID,
    tblSchedule.schStartTime,
    tblSchedule.schEndTime
FROM tblSchedule
JOIN tblDrivers ON tblDrivers.drvDriverID = tblSchedule.schDriverID
JOIN tblCars ON tblCars.carCarID = tblSchedule.schCarID;
