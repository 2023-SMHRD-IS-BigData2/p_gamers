package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;

import lombok.NonNull;

public class IMService implements Service {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[회원가입 서비스]");

		// 요청 데이터 받기
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_nick = request.getParameter("m_nick");
		String g_name = request.getParameter("g_name");
		if (g_name == null) {
			g_name = "Null";
		}
		String m_position = request.getParameter("m_position");
		
		MemberDTO mdto = new MemberDTO(m_id, m_pw, m_nick, g_name, m_position);

		int cnt = new MemberDAO().insertMember(mdto);

		System.out.println("cnt : " + cnt);

		if (cnt > 0) {
			System.out.println("회원가입 성공");
			return "GamersMain.jsp";
		} else {
			System.out.println("회원가입 실패");
			return "GamersMain.jsp";
		}

	}
}
