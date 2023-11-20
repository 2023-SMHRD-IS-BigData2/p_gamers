package com.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.CalendarDAO;
import com.project.model.CalendarDTO;

@WebServlet("/Cd_Select_Service")
public class Cd_Select_Service extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		String g_name = (String)session.getAttribute("g_name");
		System.out.println(g_name);
		
		List<CalendarDTO> list = new CalendarDAO().calendarList(g_name);
		
		System.out.println(list.get(2).getC_start());
	}

}
