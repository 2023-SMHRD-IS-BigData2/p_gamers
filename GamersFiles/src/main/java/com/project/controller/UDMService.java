package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.frontcontroller.Service;
import com.project.model.MemberDAO;

public class UDMService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[DeleteMemberService.do]");
		String m_id = request.getParameter("m_id");
		int cnt = new MemberDAO().deleteMember(m_id);
		if (cnt > 0) {
			System.out.println("회원 삭제 성공");
			HttpSession session = request.getSession();
			session.invalidate();
			return "GamersMain.jsp";
		} else {
			System.out.println("회원 삭제 실패");
			return "GamersMain.jsp";
		}
	}

}