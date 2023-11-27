package com.project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.GroupDAO;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;

@WebServlet("/Raid_Member_Withdrawal_Service")
public class Raid_Member_Withdrawal_Service extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String m_id = request.getParameter("m_id");



		int row = new GroupDAO().groupOutMember(m_id);

		if (row > 0) {
			System.out.println("공격대 탈퇴 성공");
			HttpSession session = request.getSession();
			session.invalidate();
		} else {
			System.out.println("공격대 탈퇴 실패");
		}
		response.sendRedirect("GamersMain.jsp");

	}

}
