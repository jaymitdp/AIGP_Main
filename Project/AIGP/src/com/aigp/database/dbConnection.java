package com.aigp.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
//import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.sql.PreparedStatement;
//import java.sql.ResultSetMetaData;
//import org.apache.derby.jdbc.ClientDriver;
import com.aigp.entities.*;

public class dbConnection {

	private static String dbURL = "jdbc:derby://localhost:1527/AIGP;create=true;user=jaymitdp;password=derbyCon";
	//private static String tableName = "patient";
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement preStmt = null;
	
	public static void createConnection()
	{
		try {
			//ClientDriver cd = new ClientDriver();
			Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
			conn = DriverManager.getConnection(dbURL);
			conn.setAutoCommit(false);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	public static void closeConnection()
	{
		try
		{
			if(stmt != null)stmt.close();
			if(conn != null) {
				conn.close();
				conn.commit();
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	public static ResultSet getPatient()
	{
		try {
			createConnection();
			stmt = conn.createStatement();
			ResultSet results = stmt.executeQuery("select * from patient FETCH FIRST ROW ONLY");
			//ResultSetMetaData rsmd = results.getMetaData();
			if(results != null)
			{
				return results;
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}	
		return null;
	}
	
	public static ResultSet getPumpConfig()
	{
		try {
			createConnection();
			stmt = conn.createStatement();
			ResultSet results = stmt.executeQuery("select * from PumpConfiguration FETCH FIRST ROW ONLY");
			//ResultSetMetaData rsmd = results.getMetaData();
			if(results != null)
			{
				return results;
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}	
		return null;
	}
	
	public static void savePatient(Patient patient)
	{
		if(patient != null)
		{
			try {
				createConnection();
				preStmt = conn.prepareStatement("UPDATE PATIENT SET patientName=?,patientDOB=? where patientID=?");
				preStmt.setString(1, patient.patientName);
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
				Date DOB = new Date(dateFormat.parse(patient.patientDOB).getTime());
				preStmt.setDate(2, DOB);
				preStmt.setInt(3, patient.patientID);
				preStmt.execute();
				conn.commit();
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
	}
	
	public static void savePatientCheckDates(Patient patient)
	{
		if(patient != null)
		{
			try {
				createConnection();
				preStmt = conn.prepareStatement("UPDATE PATIENT SET lastCheckupDate=?,nextCheckupDate=? where patientID=?");
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
				Date lastCheckupDate = new Date(dateFormat.parse(patient.lastCheckupDate).getTime());
				Date nextCheckupDate = new Date(dateFormat.parse(patient.nextCheckupDate).getTime());
				preStmt.setDate(1, lastCheckupDate);
				preStmt.setDate(2, nextCheckupDate);
				preStmt.setInt(3, patient.patientID);
				preStmt.execute();
				conn.commit();
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
	}
	
	public static void savePumpConfig(PumpConfig pumpConfig)
	{
		if(pumpConfig != null)
		{
			try {
				createConnection();
				preStmt = conn.prepareStatement("UPDATE PUMPCONFIGURATION SET isNeedleAttached = ?, isReserviorAttached = ?, idealBloodGlucose = ?, safeInsulinDose = ?, maximumInsulinDosePerDay = ?, maximumInsulinDosePerInjection = ?, patientManualModeAccess = ?");
				preStmt.setBoolean(1, pumpConfig.isNeedleAttached);
				preStmt.setBoolean(2, pumpConfig.isReserviorAttached);
				preStmt.setInt(3, pumpConfig.idealBloodGlucoseLevel);
				preStmt.setInt(4, pumpConfig.safeInsulinDose);
				preStmt.setInt(5, pumpConfig.MaxInsulinDosagePerDay);
				preStmt.setInt(6, pumpConfig.maximumInsulinDosePerInjection);
				preStmt.setBoolean(7, pumpConfig.patientManualModeAccess);
				preStmt.execute();
				conn.commit();
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
	}
}
