package com.project.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.MemberDAO;

public class MCService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[이메일 중복체크]");
		String inputI = request.getParameter("inputI");
		System.out.println(inputI);
		boolean isCheck = new MemberDAO().memberCheck(inputI);
		System.out.println(isCheck);

		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(isCheck);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
