package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try{
			String fullName = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobile = req.getParameter("mobile");
			String password = req.getParameter("password");
			
			Doctor d = new Doctor(fullName,dob,qualification,spec,email,mobile,password);
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession session = req.getSession();
			
			if(dao.registerDoctor(d)) {
				session.setAttribute("succMsg", "Doctor added Successfully");
				resp.sendRedirect("admin/doctor.jsp");
			}else {
				session.setAttribute("errorMsg", "Something went wrong! Try again");
				resp.sendRedirect("admin/doctor.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
