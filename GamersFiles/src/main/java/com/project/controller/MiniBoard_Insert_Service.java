package com.project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.model.MiniBoardDAO;
import com.project.model.MiniBoardDTO;


@WebServlet("/MiniBoard_Insert_Service")
public class MiniBoard_Insert_Service extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("미니 게시판 시스템 접속");
		
		request.setCharacterEncoding("utf-8");
		String p_content = request.getParameter("p_content");
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_nick");
		String g_name = (String) session.getAttribute("g_name");
		System.out.println(m_id);
		System.out.println(g_name);
		System.out.println(p_content);
		if(p_content.equals("")) {
			System.out.println("콘텐츠가 비어있습니다. 업로드하지 않습니다");
		}else {
			MiniBoardDTO dto = new MiniBoardDTO(g_name, m_id, p_content);
			int row = new MiniBoardDAO().insertMBoard(dto);
			if(row>0) {
				System.out.println("미니보드 삽입 성공");
			}else {
				System.out.println("미니보드 삽입 실패");
			}
		}
		
		
		response.sendRedirect("calendar.jsp");
		
	}

}
