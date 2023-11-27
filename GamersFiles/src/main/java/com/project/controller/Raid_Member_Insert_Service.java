package com.project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.ApplyDAO;
import com.project.model.ApplyRaidDTO;


@WebServlet("/Raid_Member_Insert_Service")
public class Raid_Member_Insert_Service extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String send_nick = request.getParameter("send_nick");  
		String send_pos = request.getParameter("send_pos");  
		String rcv_nick = request.getParameter("rcv_nick");  
		String g_name = request.getParameter("g_name");  

		System.out.println(send_nick);
		System.out.println(send_pos);
		System.out.println(rcv_nick);
		System.out.println(g_name);
		if(send_pos.equals("딜러")) {
			send_pos = "m_deal";
		}else if(send_pos.equals("탱커")) {
			send_pos = "m_tank";
		}else if(send_pos.equals("힐러")) {
			send_pos ="m_heal";
		}
		System.out.println("바뀐 포지션"+send_pos);
		
		ApplyRaidDTO dto = new ApplyRaidDTO(send_nick, send_pos, rcv_nick, g_name);
		int row1 = new ApplyDAO().applyUpdateMember(dto);
		int row2 = new ApplyDAO().applyDelete(dto);
		//int row3 = new ApplyDAO().applyDiscount(dto);
		if(row1 > 0) {
			System.out.println("멤버 레이드 소속 교체 성공");
		}else {
			System.out.println("소속 교체 실패");
		}
		if(row2 > 0) {
			System.out.println("요청 메세지 삭제 성공");
		}else {
			System.out.println("요청 메세지 삭제 실패");
		}
//		if(row3 > 0) {
//			System.out.println("모집 현황 감소 성공");
//		}else {
//			System.out.println("모집 현황 감소 실패");
//		}
		response.sendRedirect("Raid_Admin.jsp");
		
	}

}
