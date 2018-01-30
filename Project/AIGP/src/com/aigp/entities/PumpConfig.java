package com.aigp.entities;

import java.sql.ResultSet;

import com.aigp.database.dbConnection;

public class PumpConfig {

	private static PumpConfig pumpConfig = null;
	public int pumpID, MaxInsulinDosagePerDay, safeInsulinDose, idealBloodGlucoseLevel, maximumInsulinDosePerInjection;
	public boolean patientManualModeAccess, isNeedleAttached, isReserviorAttached, isModifyable, isEmergencyCase, isManualModeOn;
	public double ReserviorLevel, insulinConsumed, insulinUnitsToConsume;
	
	private PumpConfig()
	{
		ResultSet pumpConfigDBR = dbConnection.getPumpConfig();
		if(pumpConfigDBR != null)
		{
			try
			{
				pumpConfigDBR.next();
				this.pumpID = pumpConfigDBR.getInt("pumpID");
				this.safeInsulinDose = pumpConfigDBR.getInt("safeInsulinDose");
				this.MaxInsulinDosagePerDay = pumpConfigDBR.getInt("maximumInsulinDosePerDay");
				this.maximumInsulinDosePerInjection = pumpConfigDBR.getInt("maximumInsulinDosePerInjection");
				this.idealBloodGlucoseLevel = pumpConfigDBR.getInt("idealBloodGlucose");
				this.patientManualModeAccess = pumpConfigDBR.getBoolean("patientManualModeAccess");
				this.isNeedleAttached = pumpConfigDBR.getBoolean("isNeedleAttached");
				this.isReserviorAttached = pumpConfigDBR.getBoolean("isReserviorAttached");
				this.isModifyable = false;
				this.ReserviorLevel = 100;
				this.insulinConsumed = 0;
				this.isManualModeOn = false;
				
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
	}
	
	public static PumpConfig getInstance()
	{
		if(pumpConfig == null)
		{
			pumpConfig = new PumpConfig();
		}
		return pumpConfig;
	}
	
	public void commitChanges()
	{
		dbConnection.savePumpConfig(this);
	}
	
	public double getInsulinUnitsToConsume() {
		return insulinUnitsToConsume;
	}

	public void setInsulinUnitsToConsume(double insulinUnitsToConsume) {
		this.insulinUnitsToConsume = insulinUnitsToConsume;
	}
	
	public double getReserviorLevel() {
		return ReserviorLevel;
	}

	public void setReserviorLevel(double reserviorLevel) {
		ReserviorLevel = reserviorLevel;
	}

	public double getInsulinConsumed() {
		return insulinConsumed;
	}

	public void setInsulinConsumed(double insulinConsumed) {
		this.insulinConsumed = insulinConsumed;
	}

	public void setManualModeOn(boolean isManualModeOn) {
		this.isManualModeOn = isManualModeOn;
	}

	public boolean isManualModeOn() {
		return isManualModeOn;
	}

	public void setisManualModeOn(boolean isManualModeOn) {
		this.isManualModeOn = isManualModeOn;
	}
	
	public boolean isEmergencyCase() {
		return isEmergencyCase;
	}

	public void setEmergencyCase(boolean isEmergencyCase) {
		this.isEmergencyCase = isEmergencyCase;
	}
	
	public int getMaxInsulinDosagePerDay() {
		return MaxInsulinDosagePerDay;
	}
	public void setMaxInsulinDosagePerDay(int maxInsulinDosagePerDay) {
		MaxInsulinDosagePerDay = maxInsulinDosagePerDay;
	}
	public int getSafeInsulinDose() {
		return safeInsulinDose;
	}
	public void setSafeInsulinDose(int safeInsulinDose) {
		this.safeInsulinDose = safeInsulinDose;
	}
	public int getIdealBloodGlucoseLevel() {
		return idealBloodGlucoseLevel;
	}
	public void setIdealBloodGlucoseLevel(int idealBloodGlucoseLevel) {
		this.idealBloodGlucoseLevel = idealBloodGlucoseLevel;
	}
	public int getmaximumInsulinDosePerInjection() {
		return maximumInsulinDosePerInjection;
	}
	public void setmaximumInsulinDosePerInjection(int maximumInsulinDosePerInjection) {
		this.maximumInsulinDosePerInjection = maximumInsulinDosePerInjection;
	}
	public boolean isPatientManualModeAccess() {
		return patientManualModeAccess;
	}
	public void setPatientManualModeAccess(boolean patientManualModeAccess) {
		this.patientManualModeAccess = patientManualModeAccess;
	}
	public boolean isNeedleAttached() {
		return isNeedleAttached;
	}
	public void setNeedleAttached(boolean isNeedleAttached) {
		this.isNeedleAttached = isNeedleAttached;
	}
	public boolean isReserviorAttached() {
		return isReserviorAttached;
	}
	public void setReserviorAttached(boolean isReserviorAttached) {
		this.isReserviorAttached = isReserviorAttached;
	}
	public boolean isModifyable() {
		return isModifyable;
	}
	public void setModifyable(boolean isModifyable) {
		this.isModifyable = isModifyable;
	}
	
}
