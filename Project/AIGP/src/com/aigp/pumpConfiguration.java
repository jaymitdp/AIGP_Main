package com.aigp;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aigp.entities.Patient;
import com.aigp.entities.PumpConfig;

/**
 * Servlet implementation class pumpConfiguration
 */
@WebServlet("/pumpConfiguration")
public class pumpConfiguration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String idealGL_Weightage, maxIPD_Weightage, maxIPI_Weightage, SDL_Weightage;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pumpConfiguration() throws ServletException{
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext context = getServletContext();
  		idealGL_Weightage = context.getInitParameter("IdealGL_Weightage");
		maxIPD_Weightage = context.getInitParameter("maxIPD_Weightage");
		maxIPI_Weightage = context.getInitParameter("maxIPI_Weightage");
      	SDL_Weightage = context.getInitParameter("SDL_Weightage");
      }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String saveToggle = request.getParameter("saveToggle");
		if(saveToggle != null && saveToggle.equals(String.valueOf(true)))
		{
			String idealGL = getPartedStringValue(request.getParameter("idealGL"), ":", 0);
			String idealGLRS = getPartedStringValue(request.getParameter("idealGL"), ":", 1);
			String maxIPD = getPartedStringValue(request.getParameter("maxIPD"), ":", 0);
			String maxIPDRS = getPartedStringValue(request.getParameter("maxIPD"), ":", 1);
			String maxIPI = getPartedStringValue(request.getParameter("maxIPI"), ":", 0);
	      	String maxIPIRS = getPartedStringValue(request.getParameter("maxIPI"), ":", 1);
	      	String SDL = getPartedStringValue(request.getParameter("SDL"), ":", 0);
	      	String SDLRS = getPartedStringValue(request.getParameter("SDL"), ":", 1);
    		String result = "0";
	      	response.setContentType("text/plain");
    		
	      	if((!idealGL.isEmpty() && !idealGLRS.isEmpty()) && (!maxIPD.isEmpty() && !maxIPDRS.isEmpty()) && (!maxIPI.isEmpty() && !maxIPIRS.isEmpty()) && (!SDL.isEmpty() && !SDLRS.isEmpty()))
	      	{
		      	if(validateCriticalValues(idealGL, idealGLRS, idealGL_Weightage) 
		      							&& validateCriticalValues(maxIPD, maxIPDRS, maxIPD_Weightage)
		      							&& validateCriticalValues(maxIPI, maxIPIRS, maxIPI_Weightage) 
		      							&& validateCriticalValues(SDL, SDLRS, SDL_Weightage))
		      	{
		      		PumpConfig pumpConfig = PumpConfig.getInstance();
		      		pumpConfig.isModifyable = true;
		    		result = "1";
		      	}
	      	}
	      	else {
	      		result = "0";
	      	}
	      	response.getWriter().write(result);
		}
	}
	
	private boolean validateCriticalValues(String inputVal, String resetVal, String weightage)
	{
		boolean valid = false;
		try {
			int inputValue = Integer.parseInt(inputVal);
			int resetValue = Integer.parseInt(resetVal);
			int weightageValue = Integer.parseInt(weightage);
			valid = (resetValue == (inputValue * weightageValue) -1) ? true : false;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return valid;
	}
	
	private String getPartedStringValue(String delimitedString, String delimiter, int index)
	{
		String result = null;
		if(!delimiter.isEmpty() && !delimitedString.isEmpty())
		{
			String[] partedString = delimitedString.split(delimiter);
			if(partedString != null && partedString.length >= 1)
			{
				result = partedString[index];
			}
		}
		return result;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PumpConfig pumpConfig = PumpConfig.getInstance();
		Patient patient = Patient.getInstance();
		patient.patientHeight = Integer.parseInt(request.getParameter("patientHeight"));
		patient.patientWeight = Integer.parseInt(request.getParameter("patientWeight"));
		pumpConfig.idealBloodGlucoseLevel = Integer.parseInt(getPartedStringValue(request.getParameter("idealBloodGlucose"),":",0));
		pumpConfig.MaxInsulinDosagePerDay = Integer.parseInt(getPartedStringValue(request.getParameter("maxInsulinDosagePerDay"),":",0));
		pumpConfig.maximumInsulinDosePerInjection = Integer.parseInt(getPartedStringValue(request.getParameter("maxInsulinDosagePerInjection"),":",0));
		pumpConfig.safeInsulinDose = Integer.parseInt(getPartedStringValue(request.getParameter("safeDosageLimit"),":",0));
		patient.nextCheckupDate = request.getParameter("patientNextCheckUpDate");
		pumpConfig.patientManualModeAccess = (request.getParameterValues("isPatientManualModeAccess") != null) ? true : false;
		pumpConfig.commitChanges();
		patient.updatePatientCheckUpDates();
		HttpSession session = request.getSession();
        session.setAttribute("patientWeight", patient.patientWeight);
        session.setAttribute("patientHeight", patient.patientHeight);
        session.setAttribute("lastCheckupDate", patient.lastCheckupDate);
        session.setAttribute("nextCheckupDate", patient.nextCheckupDate);
        session.setAttribute("patientManualModeAccess", pumpConfig.patientManualModeAccess);
        response.sendRedirect("pumpLayout/views/doctorView.jsp");
	}

}
