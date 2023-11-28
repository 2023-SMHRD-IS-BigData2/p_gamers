package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.frontcontroller.Service;
import com.project.model.DeleteDAO;
import com.project.model.GroupDAO;
import com.project.model.GroupDTO;
import com.project.model.MemberDAO;

public class UDMService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[DeleteMemberService.do]");
		String m_id = request.getParameter("m_id");
		String g_name = request.getParameter("g_name");
		GroupDTO group = new GroupDAO().selectGroup(g_name);
		if (group != null) {
			if (m_id.equals(group.getM_id())) {
				int groupM = new DeleteDAO().deleteGroupinfo(g_name);
				if (groupM > 0) {
					System.out.println("이름 삭제 완료");
					int deleteG = new GroupDAO().deleteGroup(g_name);
					if (deleteG > 0) {
						System.out.println("파티 삭제 완료");
						int deleteM = new MemberDAO().deleteMember(m_id);
						if (deleteM > 0) {
							System.out.println("회원 탈퇴 완료");
							HttpSession session = request.getSession();
							session.invalidate();
							return "GamersMain.jsp";
						} else {
							System.out.println("회원 탈퇴 실패");
							return "GamersMain.jsp";
						}
					} else {
						System.out.println("파티 삭제 실패");
						return "GamersMain.jsp";
					}
				} else {
					System.out.println("이름 삭제 실패");
					return "GamersMain.jsp";
				}
			} else {
				int cnt = new MemberDAO().deleteMember(m_id);
				if (cnt > 0) {
					System.out.println("회원 탈퇴 성공");
					HttpSession session = request.getSession();
					session.invalidate();
					return "GamersMain.jsp";
				} else {
					System.out.println("회원 탈퇴 실패");
					return "GamersMain.jsp";
				}
			}
		} else {
			int cnt = new MemberDAO().deleteMember(m_id);
			if (cnt > 0) {
				System.out.println("회원 탈퇴 성공");
				HttpSession session = request.getSession();
				session.invalidate();
				return "GamersMain.jsp";
			} else {
				System.out.println("회원 탈퇴 실패");
				return "GamersMain.jsp";
			}
		}
	}

}