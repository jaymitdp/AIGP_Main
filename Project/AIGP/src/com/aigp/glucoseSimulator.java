package com.aigp;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aigp.entities.ContinousGlucoseGenerator;
import com.aigp.entities.Patient;
import com.aigp.entities.PumpConfig;
import com.google.gson.*;

/**
 * Servlet implementation class glucoseSimulator
 */
@WebServlet("/glucoseSimulator")
public class glucoseSimulator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public glucoseSimulator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub reserviorInsulinUpdates
		String glucoseSeeker = request.getParameter("glucoseSeeker");
		if(glucoseSeeker != null && glucoseSeeker.equals(String.valueOf(true)))
		{
			response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(glucoseDataToJson());
		}
		String reserviorInsulinUpdates = request.getParameter("reserviorInsulinUpdates");
		if(reserviorInsulinUpdates != null && reserviorInsulinUpdates.equals(String.valueOf(true)))
		{
			response.setContentType("application/text");
		    response.setCharacterEncoding("UTF-8");
		    PumpConfig pumpConfig = PumpConfig.getInstance();
		    response.getWriter().write(pumpConfig.ReserviorLevel+":"+pumpConfig.insulinConsumed);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String carbIntakeCommit = request.getParameter("carbIntakeCommit");
		if(carbIntakeCommit != null && carbIntakeCommit.equals(String.valueOf(true)))
		{
			String carbIntakeUnits = request.getParameter("carbIntakeUnits");
			if(!carbIntakeUnits.isEmpty())
			{
				commitCarbohydratesIntake(carbIntakeUnits);
			}
		}
		String injectSafeDosage = request.getParameter("injectSafeDosage");
		if(injectSafeDosage != null && injectSafeDosage.equals(String.valueOf(true)))
		{
			PumpConfig pumpConfig = PumpConfig.getInstance();
			pumpConfig.insulinUnitsToConsume = pumpConfig.safeInsulinDose; 
		}
	}
	
	private void commitCarbohydratesIntake(String carbIntakeUnits)
	{
		Patient patient = Patient.getInstance();
		patient.setCarbIntakeUnits(Double.parseDouble(carbIntakeUnits));
	}
	
	private synchronized String glucoseDataToJson()
	{
		ContinousGlucoseGenerator continousGlucoseGenerator = ContinousGlucoseGenerator.getInstance();
		Gson data = new Gson();
		return data.toJson(continousGlucoseGenerator.bloodGlucoseData);
	}
	
}
