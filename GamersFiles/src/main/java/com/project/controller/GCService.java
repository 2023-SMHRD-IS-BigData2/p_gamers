package com.project.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.GroupDAO;
import com.project.model.MemberDAO;

public class GCService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[파티명 중복체크]");
		String inputG = request.getParameter("inputG");
		System.out.println(inputG);
		boolean isCheck = new GroupDAO().groupCheck(inputG);
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
