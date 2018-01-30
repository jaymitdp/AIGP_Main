--<ScriptOptions statementTerminator=";"/>
/*
 * 
 * Author : Jaymit/Avani
 * Date of creation : 07.01.2018
 * Description : Script holds DDL statements to create database tables for the AIGP
 * 
 */
--DROP table Patient;
--DROP table PumpConfiguration;
--DROP table Patient

/*
DDL Statements---

Create table Patient(
	patientID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	patientName VARCHAR(100) not null,
	patientDOB DATE not null,
	patientHeight INTEGER not null,
	patientWeight INTEGER not null,
	patientMedicalHistory LONG VARCHAR,
	lastCheckupDate DATE not null,
	nextCheckupDate DATE not null
	--pumpPassword varchar(50) not null
);
--SELECT * FROM PATIENT
--INSERT INTO PATIENT (patientName, patientDOB, patientHeight, patientWeight, patientMedicalHistory) VALUES ('Jaymit','19.11.1993', 180, 75, 'Fit and healthy');
INSERT INTO PATIENT (patientName, patientDOB, patientHeight, patientWeight, patientMedicalHistory,lastCheckupDate, nextCheckupDate) VALUES ('Jaymit','19.11.1993', 180, 75, 'Fit and healthy','13.01.2018','31.01.2018');
--UPDATE PATIENT SET patientName = 'Avani' WHERE patientName = 'Jaymit'
Create table PumpConfiguration(
	pumpID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	isNeedleAttached BOOLEAN,
	isReserviorAttached BOOLEAN,
	idealBloodGlucose INTEGER not null,
	safeInsulinDose INTEGER not null,
	maximumInsulinDosePerDay INTEGER not null,
	maximumInsulinDosePerInjection INTEGER not null,
	patientManualModeAccess BOOLEAN not null
);
--SELECT * FROM PumpConfiguration
--INSERT INTO PumpConfiguration(isNeedleAttached, isReserviorAttached, idealBloodGlucose, safeInsulinDose, maximumInsulinDosePerDay, maximumInsulinDosePerInjection, patientManualModeAccess)
--VALUES(true, true, 90, 50, 500, 100, true);

UPDATE PUMPCONFIGURATION SET isNeedleAttached = true, isReserviorAttached = true, idealBloodGlucose = 90, safeInsulinDose = 55,
maximumInsulinDosePerDay = 500, maximumInsulinDosePerInjection = 100, patientManualModeAccess = true;

Create table injectionHistory(
	injectionID INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	hormoneInjected VARCHAR(10) not null,
	injectedUnits INTEGER not null,
	injectionDateTime TIMESTAMP not null,
	preBloodGlucoseReading INTEGER not null
);
*/