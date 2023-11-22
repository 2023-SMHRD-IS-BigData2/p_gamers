package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.MemberDAO;

public class DMService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[DelMemberService.do]");
		String m_id = request.getParameter("m_id");
		int cnt = new MemberDAO().deleteMember(m_id);
		if (cnt > 0) {
			System.out.println("회원 삭제 성공");
			return "adminMember.jsp";
		} else {
			System.out.println("회원 삭제 실패");
			return "adminMember.jsp";
		}
	}

}
