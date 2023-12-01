package com.project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.CalendarDAO;

@WebServlet("/Cd_delete_Service")
public class Cd_delete_Service extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.valueOf(request.getParameter("num")); 
		
		int delete = new CalendarDAO().deleteCalendar(num);
		
		response.sendRedirect("calendar.jsp");
	
	
	}

}
