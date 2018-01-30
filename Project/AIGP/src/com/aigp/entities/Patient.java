package com.aigp.entities;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.aigp.database.dbConnection;
import com.aigp.entities.ContinousGlucoseGenerator.BloodGlucoseCurrentState;

public class Patient {

	private static Patient patient = null;
	
	public String patientName, patientDOB,lastCheckupDate, nextCheckupDate, patientMedicalHistory;
	public int patientID,patientWeight, patientHeight;
	public double patientCurrentBloodGlucose, carbIntakeUnits;

	private Patient()
	{
		ResultSet patientRecord = dbConnection.getPatient();
		if(patientRecord != null)
		{
			try
			{
				patientRecord.next();
				this.patientCurrentBloodGlucose = 90;
				this.patientID = patientRecord.getInt("patientID");
				this.patientName = patientRecord.getString("patientName");
				DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
				this.patientDOB = dateFormat.format(patientRecord.getDate("patientDOB"));
				this.lastCheckupDate = dateFormat.format(patientRecord.getDate("lastCheckupDate"));
				this.nextCheckupDate = dateFormat.format(patientRecord.getDate("nextCheckupDate"));
				this.patientMedicalHistory = patientRecord.getString("patientMedicalHistory");
				this.patientWeight = patientRecord.getInt("patientWeight");
				this.patientHeight = patientRecord.getInt("patientHeight");
				this.patientCurrentBloodGlucose = PumpConfig.getInstance().idealBloodGlucoseLevel;
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
	}
	
	public void updatePatientCheckUpDates()
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
		patient.lastCheckupDate = dateFormat.format(new Date());
		dbConnection.savePatientCheckDates(this);
	}
	
	public double getCarbIntakeUnits() {
		return carbIntakeUnits;
	}

	public void setCarbIntakeUnits(double carbIntakeUnits) {
		this.carbIntakeUnits = carbIntakeUnits;
		if(this.carbIntakeUnits != 0)
		{
			ContinousGlucoseGenerator continousGlucoseGenerator = ContinousGlucoseGenerator.getInstance();
			continousGlucoseGenerator.initiateGlucoseGeneratorTimer();
			continousGlucoseGenerator.carbIntake = patient.carbIntakeUnits;
			continousGlucoseGenerator.bloodGlucose = patient.patientCurrentBloodGlucose;
			continousGlucoseGenerator.maxChangeInBloodGlucose = patient.patientCurrentBloodGlucose + (patient.carbIntakeUnits + (patient.carbIntakeUnits/100));
			continousGlucoseGenerator.bloodGlucoseCurrentState = BloodGlucoseCurrentState.INCREASING;
		}
	}

	public double getPatientCurrentBloodGlucose() {
		return patientCurrentBloodGlucose;
	}

	public void setPatientCurrentBloodGlucose(double patientCurrentBloodGlucose) {
		this.patientCurrentBloodGlucose = patientCurrentBloodGlucose;
	}
	
	public String getLastCheckupDate() {
		return lastCheckupDate;
	}

	public void setLastCheckupDate(String lastCheckupDate) {
		this.lastCheckupDate = lastCheckupDate;
	}

	public String getNextCheckupDate() {
		return nextCheckupDate;
	}

	public void setNextCheckupDate(String nextCheckupDate) {
		this.nextCheckupDate = nextCheckupDate;
	}

	public static Patient getInstance()
	{
		if(patient == null)
		{
			patient = new Patient();
		}
		return patient;
	}
	
	public void commitChanges()
	{
		dbConnection.savePatient(this);
	}
	
	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientDOB() {
		return patientDOB;
	}

	public void setPatientDOB(String patientDOB) {
		this.patientDOB = patientDOB;
	}

	public String getPatientMedicalHistory() {
		return patientMedicalHistory;
	}

	public void setPatientMedicalHistory(String patientMedicalHistory) {
		this.patientMedicalHistory = patientMedicalHistory;
	}

	public int getPatientWeight() {
		return patientWeight;
	}

	public void setPatientWeight(int patientWeight) {
		this.patientWeight = patientWeight;
	}

	public int getPatientHeight() {
		return patientHeight;
	}

	public void setPatientHeight(int patientHeight) {
		this.patientHeight = patientHeight;
	}
}