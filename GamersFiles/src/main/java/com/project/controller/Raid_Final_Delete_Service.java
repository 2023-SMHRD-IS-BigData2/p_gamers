package com.project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import com.project.model.DeleteDAO;
import com.project.model.GroupDAO;


@WebServlet("/Raid_Final_Delete_Service")
public class Raid_Final_Delete_Service extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("공격대 삭제 서비스");
		
		request.setCharacterEncoding("utf-8");
		
		String deleteCheck = request.getParameter("deleteCheck");
		String g_name = request.getParameter("g_name");
		String deleteFinal="공격대삭제";
		
		if (deleteCheck.equals(deleteFinal)) {
			int row1 = new GroupDAO().deleteGroup(g_name);
			int row2 = new DeleteDAO().deleteGroupinfo(g_name);
			if(row1>0) {
				System.out.println("공격대 삭제 성공");
			}else {
				System.out.println("공격대 삭제 실패");
			}
			if(row2>0) {
				System.out.println("공격대 인원 해제 성공");
			}else {
				System.out.println("공격대 인원 해제 실패");
			}
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("GamersMain.jsp");
		}else {
			System.out.println("정확한 입력이 아닙니다");
			response.sendRedirect("Raid_Admin.jsp");
		}
		
		
	}

}
