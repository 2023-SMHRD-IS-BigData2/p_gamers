package com.project.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.JobDAO;
import com.project.model.MemberDAO;

public class PCService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("[포지션 체크]");
		String m_class = request.getParameter("m_class");
		System.out.println(m_class);
		String m_position = new JobDAO().selectJob(m_class).toString();
		System.out.println(m_position);

		PrintWriter out;
		try {
			response.setContentType("html/text; charset=UTF-8");
			out = response.getWriter();
			out.print(m_position);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	
	}

}
