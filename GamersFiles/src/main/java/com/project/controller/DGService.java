package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.GroupDAO;
import com.project.model.MemberDAO;

public class DGService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[파티 삭제 서비스]");
		String g_name = request.getParameter("g_name");
		String m_id = request.getParameter("m_id");
		int ng = new MemberDAO().nullGroup(m_id);
		if(ng>0) {
			System.out.println("파티명 삭제 성공");
		} else {
			System.out.println("파티명 삭제 실패");
		}
		
		int cnt = new GroupDAO().deleteGroup(g_name);
		if(cnt>0) {
			System.out.println("파티 삭제 성공");
			return "adminGroup.jsp";
		} else {
			System.out.println("파티 삭제 실패");
			return "adminGroup.jsp";
		}
	}

}
