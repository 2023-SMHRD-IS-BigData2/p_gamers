package com.project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.model.ApplyDAO;
import com.project.model.ApplyRaidDTO;


@WebServlet("/Raid_Apply_Delete_Service")
public class Raid_Apply_Delete_Service extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String send_nick = request.getParameter("send_nick");  
		String send_pos = request.getParameter("send_pos");  
		String rcv_id = request.getParameter("rcv_id");  
		String g_name = request.getParameter("g_name");  

		System.out.println(send_nick);
		System.out.println(send_pos);
		System.out.println(rcv_id);
		System.out.println(g_name);
		if(send_pos.equals("딜러")) {
			send_pos = "m_deal";
		}else if(send_pos.equals("탱커")) {
			send_pos = "m_tank";
		}else if(send_pos.equals("힐러")) {
			send_pos ="m_heal";
		}
		
		ApplyRaidDTO dto = new ApplyRaidDTO(send_nick, send_pos, rcv_id, g_name);
		
		
		int row2 = new ApplyDAO().applyDelete(dto);

		response.sendRedirect("Raid_Admin.jsp");
		
	}

}
