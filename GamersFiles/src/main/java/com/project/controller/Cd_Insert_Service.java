package com.project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.protocol.HTTP;

import com.project.model.CalendarDAO;
import com.project.model.CalendarDTO;

@WebServlet("/Cd_Insert_Service")
public class Cd_Insert_Service extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		String g_name = (String)session.getAttribute("g_name");
		String c_content = request.getParameter("c_content");
		String c_start = request.getParameter("c_start");
		String c_end = request.getParameter("c_end");
		
		System.out.println(g_name);
		System.out.println(c_start);
		System.out.println(c_end);
		System.out.println(c_content);
		
		CalendarDTO dto = new CalendarDTO(g_name, c_start, c_end, c_content);
		
		int insert = new CalendarDAO().insertCalendar(dto);
		
		if(insert>0) {
			System.out.println("캘린더 삽입 성공");
		}else {
			System.out.println("캘린더 삽입 실패");
		}
		
		response.sendRedirect("calendar_edit.jsp");
	}

}
