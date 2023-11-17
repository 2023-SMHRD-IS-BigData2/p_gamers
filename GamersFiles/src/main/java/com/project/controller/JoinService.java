package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;

public class JoinService implements Service {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[회원가입 서비스]");

		// 요청 데이터 받기
		String join_email = request.getParameter("join_email");
		String join_pw = request.getParameter("join_pw");
		String join_nick = request.getParameter("join_nick");
		String join_class = request.getParameter("join_class");

		MemberDTO mdto = new MemberDTO(join_email, join_pw, join_nick, join_class);

		int cnt = new MemberDAO().insertMember(mdto);

		System.out.println("cnt : " + cnt);

		if (cnt > 0) {
			System.out.println("회원가입 성공");
			return "Main.jsp";
		} else {
			System.out.println("회원가입 실패");
			return "Main.jsp";
		}

	}
}
