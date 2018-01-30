package com.aigp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aigp.entities.Patient;
import com.aigp.entities.PumpConfig;

/**
 * Servlet implementation class commonController
 */
@WebServlet("/commonController")
public class commonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public commonController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String manualModeToggle = request.getParameter("operationModeToggle");
		if(manualModeToggle != null && manualModeToggle.equals(String.valueOf(true)))
		{
			boolean isManualModeOn = Boolean.parseBoolean(request.getParameter("isManualModeOn"));
			PumpConfig pumpConfig = PumpConfig.getInstance();
			pumpConfig.isManualModeOn = isManualModeOn;
		}
		
		String manualModeSeeker = request.getParameter("manualModeSeeker");
		if(manualModeSeeker != null && manualModeSeeker.equals(String.valueOf(true)))
		{
			PumpConfig pumpConfig = PumpConfig.getInstance();
			response.setContentType("application/text");
		    response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(Boolean.toString(pumpConfig.isManualModeOn));
		}
		
		String reserviorRefil = request.getParameter("reserviorRefil");
		if(reserviorRefil != null && reserviorRefil.equals(String.valueOf(true)))
		{
			PumpConfig pumpConfig = PumpConfig.getInstance();
			pumpConfig.ReserviorLevel = 100;
			pumpConfig.insulinConsumed = 0;
		}
		
		String insulinUnitsToConsume = request.getParameter("insulinUnitsToConsume");
		if(insulinUnitsToConsume != null && insulinUnitsToConsume.equals(String.valueOf(true)))
		{
			double insulinUnitsToConsumeValue = Double.parseDouble(request.getParameter("insulinUnitsToConsumeValue"));
			PumpConfig pumpConfig = PumpConfig.getInstance();
			pumpConfig.insulinUnitsToConsume = insulinUnitsToConsumeValue; 
		}
		String patientBloodGlucoseSeeker = request.getParameter("patientBloodGlucoseSeeker");
		if(patientBloodGlucoseSeeker != null && patientBloodGlucoseSeeker.equals(String.valueOf(true)))
		{
			Patient patient = Patient.getInstance();
			response.setContentType("application/text");
		    response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(Double.toString(patient.patientCurrentBloodGlucose));
		}
	}

}