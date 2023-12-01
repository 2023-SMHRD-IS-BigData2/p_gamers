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
		String m_pw = request.getParameter("m_pw");
		MemberDTO ug = new MemberDTO(m_id, m_pw);
		int row = new GroupDAO().groupOutMember(ug);
		String url;
		if (row > 0) {
			
			MemberDTO mdto = new MemberDTO(m_id, m_pw);
			MemberDTO login = new MemberDAO().selectMember(mdto);
			HttpSession session = request.getSession();
			session.setAttribute("login", login);
			System.out.println(login);
			url = "GamersMain.jsp";
		} else {
			url = "GamersMain.jsp";
		}
		response.sendRedirect(url);
		
	}

}
