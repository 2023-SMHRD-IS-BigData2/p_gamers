package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.frontcontroller.Service;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;

public class UMService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_nick = request.getParameter("m_nick");
		String g_name = request.getParameter("g_name");
		String m_position = request.getParameter("m_position");
		String m_date = "sysdate";

		MemberDTO mdto = new MemberDTO(m_id, m_pw, m_nick, g_name, m_position, m_date);

		int cnt = new MemberDAO().updateMember(mdto);

		if (cnt > 0) {
			System.out.println("정보 수정 완료");
			HttpSession session = request.getSession();
			session.setAttribute("login", mdto);
		} else {
			System.out.println("정보 수정 실패");
		}
		return "Main.jsp";
	}

}
