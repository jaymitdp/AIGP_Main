package com.aigp;

import java.io.IOException;
import javax.servlet.http.HttpSession;

import com.aigp.entities.Patient;
import com.aigp.entities.PumpConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class lockscreen
 */
@WebServlet("/lockscreen")
public class lockscreen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lockscreen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Patient patient = Patient.getInstance();
		PumpConfig pumpConfig = PumpConfig.getInstance();
		
		//request.setAttribute("patientName", patientName);
		HttpSession session = request.getSession();
        session.setAttribute("patientName", patient.patientName);
        session.setAttribute("patientDOB", patient.patientDOB);
        session.setAttribute("patientWeight", patient.patientWeight);
        session.setAttribute("patientHeight", patient.patientHeight);
        session.setAttribute("lastCheckupDate", patient.lastCheckupDate);
        session.setAttribute("nextCheckupDate", patient.nextCheckupDate);
        session.setAttribute("patientManualModeAccess", pumpConfig.patientManualModeAccess);
		//response.sendRedirect("pumpLayout/lockScreen.jsp");
		request.getRequestDispatcher("pumpLayout/views/lockScreen.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
