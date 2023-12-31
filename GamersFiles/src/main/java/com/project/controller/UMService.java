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
		System.out.println("[UpdateMemberService]");
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_nick = request.getParameter("m_nick");
		String m_class = request.getParameter("m_class");
		String m_position = request.getParameter("m_position");
		String m_coment = request.getParameter("m_coment");
		if (m_coment == null) {
			m_coment = " ";
		}

		MemberDTO mdto = new MemberDTO(m_id, m_pw, m_nick, m_position, m_class, m_coment);

		int cnt = new MemberDAO().updateMember(mdto);

		if (cnt > 0) {
			System.out.println("정보 수정 완료");
			HttpSession session = request.getSession();
			session.setAttribute("login", mdto);
		} else {
			System.out.println("정보 수정 실패");
		}
		return "GamersMain.jsp";
	}

}
