package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.frontcontroller.Service;
import com.project.model.MemberDTO;

public class LogoutService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("login");
		System.out.println("로그아웃 완료");
		return "GamersMain.jsp";
	}

}
