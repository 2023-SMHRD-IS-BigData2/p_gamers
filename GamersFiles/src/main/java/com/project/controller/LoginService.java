package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.frontcontroller.Service;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;

public class LoginService implements Service {
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[로그인 서비스]");
		// 1. email, pw 가져오기
		String m_id = request.getParameter("login_email");
		String m_pw = request.getParameter("login_pw");

		// 2. Member 객체 생성
		MemberDTO mdto = new MemberDTO(m_id, m_pw);

		// 3. DAO loginMember() 호출
		MemberDTO logindto = new MemberDAO().selectMember(mdto);

		// 4. DB 값 가져와 콘솔에 'tel' 값 출력
		if (logindto != null) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("login", logindto);
		} else {
			System.out.println("로그인 실패");
		}
		return "Main.jsp";
	}

}
