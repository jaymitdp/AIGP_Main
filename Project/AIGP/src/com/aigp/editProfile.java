package com.aigp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aigp.entities.Patient;

/**
 * Servlet implementation class editProfile
 */
@WebServlet("/editProfile")
public class editProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Patient patient = Patient.getInstance();
		patient.patientName = request.getParameter("patientName");
		patient.patientDOB = request.getParameter("patientDOB");
		patient.commitChanges();
		HttpSession session = request.getSession();
        session.setAttribute("patientName", patient.patientName);
        session.setAttribute("patientDOB", patient.patientDOB);
        //request.getRequestDispatcher("pumpLayout/patientHome.jsp").forward(request, response);
        response.sendRedirect("pumpLayout/views/patientView.jsp");
	}

}
