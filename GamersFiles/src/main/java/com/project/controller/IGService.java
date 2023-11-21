package com.project.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.GroupDAO;
import com.project.model.GroupDTO;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;

public class IGService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[파티 생성 서비스]");

		// 요청 데이터 받기
		String g_name = request.getParameter("g_name");
		String m_id = request.getParameter("m_id");
		String c_name = request.getParameter("c_name");
		String g_content = request.getParameter("g_content");
		String g_start = request.getParameter("g_start");
		String g_end = request.getParameter("g_end");
		String g_member = request.getParameter("g_member");
		String m_position = request.getParameter("m_position");
		int findIndex1 = g_start.indexOf('T');
		g_start = g_start.substring(0, findIndex1) + ' ' + g_start.substring(findIndex1 + 1) + ":00";
		System.out.println(g_start);
		int findIndex2 = g_end.indexOf('T');
		g_end = g_end.substring(0, findIndex2) + ' ' + g_end.substring(findIndex2 + 1) + ":00";
		System.out.println(g_end);

		GroupDTO gdto = new GroupDTO(g_name, m_id, c_name, g_content, g_start, g_end, g_member, m_position);

		int cnt = new GroupDAO().insertGroup(gdto);

		System.out.println("cnt : " + cnt);

		if (cnt > 0) {
			System.out.println("파티 생성 성공");
			return "Main.jsp";
		} else {
			System.out.println("파티 생성 실패");
			return "Main.jsp";
		}
	}

}
