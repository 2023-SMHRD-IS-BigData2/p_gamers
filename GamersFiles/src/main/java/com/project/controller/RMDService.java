package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.frontcontroller.Service;
import com.project.model.MemberDAO;

public class RMDService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		
		int cnt = new MemberDAO().nullGroup(m_id);
		
		if (cnt > 0) {
			System.out.println("추방 완료");
			HttpSession session = request.getSession();
			session.getAttribute("login");
			return "Raid_Admin.jsp";
		} else {
			System.out.println("추방 실패");
			return "Raid_Admin.jsp";
		}
	}

}
