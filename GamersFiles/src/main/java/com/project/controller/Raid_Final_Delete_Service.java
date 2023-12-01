package com.project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import com.project.model.CalendarDAO;
import com.project.model.DeleteDAO;
import com.project.model.GroupDAO;
import com.project.model.MiniBoardDAO;

@WebServlet("/Raid_Final_Delete_Service")
public class Raid_Final_Delete_Service extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String deleteCheck = request.getParameter("deleteCheck");
		String g_name = request.getParameter("g_name");

		String deleteFinal = "공격대삭제";
		boolean isDelete = false;

		if (deleteCheck.equals(deleteFinal)) {
			int row2 = new DeleteDAO().deleteGroupinfo(g_name);
			if (row2 > 0) {

				int row3 = new CalendarDAO().deleteAllCalendar(g_name);
				int row4= new MiniBoardDAO().DeleteMBoard(g_name);
				int row1 = new GroupDAO().deleteGroup(g_name);
				if (row1 > 0) {
					isDelete = true;
				} 
			} else {
				System.out.println("공격대 인원 해제 실패");
			}
			// int row3 = new CalendarDAO().deleteAllCalendar(g_name);

			if (isDelete) {
				HttpSession session = request.getSession();
				session.invalidate();
				response.sendRedirect("GamersMain.jsp");
			} else {
				System.out.println("공격대 삭제에 실패했습니다");
				response.sendRedirect("Raid_Admin.jsp");
			}
		} else {
			System.out.println("정확한 문구 입력이 아닙니다");
			response.sendRedirect("Raid_Admin.jsp");
		}

	}

}
