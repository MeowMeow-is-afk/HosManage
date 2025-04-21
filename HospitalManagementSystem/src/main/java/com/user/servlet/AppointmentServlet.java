package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/add_appoint")
public class AppointmentServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = Integer.parseInt(req.getParameter("userid"));  
		String fullname = req.getParameter("fullname");  
		String gender = req.getParameter("gender");  
		String age = req.getParameter("age");  
		String appoint_date = req.getParameter("appoint_date");  
		String email = req.getParameter("email");  
		String phno = req.getParameter("phno");  
		String diseases = req.getParameter("diseases");  
		int doctor_id = Integer.parseInt(req.getParameter("doct"));  
		String address = req.getParameter("address");
		
		Appointment ap = new Appointment(userId, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, "Pending");
		
		AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
		HttpSession session = req.getSession();
		
		if(dao.addAppointment(ap)) {
			session.setAttribute("succMsg", "Appointment booked successfully");
			resp.sendRedirect("GenerateAppointmentSlip?fullname=" + 
					java.net.URLEncoder.encode(fullname, "UTF-8") +
					"&gender=" + java.net.URLEncoder.encode(gender, "UTF-8") +
					"&age=" + java.net.URLEncoder.encode(age, "UTF-8") +
					"&appoint_date=" + java.net.URLEncoder.encode(appoint_date, "UTF-8") +
					"&email=" + java.net.URLEncoder.encode(email, "UTF-8") +
					"&phno=" + java.net.URLEncoder.encode(phno, "UTF-8") +
					"&diseases=" + java.net.URLEncoder.encode(diseases, "UTF-8") +
					"&doctor=" + doctor_id +
					"&address=" + java.net.URLEncoder.encode(address, "UTF-8"));

		}else {
			session.setAttribute("errorMsg", "Something went wrong! Try again");
			resp.sendRedirect("user_appointment.jsp");
		}
	}

}
