package com.project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.ComentDTO;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;


@WebServlet("/Raid_Coment_Update_Service")
public class Raid_Coment_Update_Service extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String m_nick = request.getParameter("name");
		String m_coment = request.getParameter("coment");
		
		ComentDTO dto = new ComentDTO(m_nick, m_coment);
		
		int row = new MemberDAO().updateComent(dto);
		if(row>0) {
			System.out.println("코멘트 수정 성공");
		}else {
			System.out.println("코멘트 수정 실패");
		}
		response.sendRedirect("Raid_Member.jsp");
	}

}
