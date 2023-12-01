package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.DeleteDAO;

public class DelMessageService implements Service{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 본인에게 온 메시지를 전부 삭제하는 서비스
		
		System.out.println("[DelMessageServic.do]");
		try {
			System.out.println("[AllMessageDelete]");
			String M_id = request.getParameter("M_id");
			int cnt = new DeleteDAO().allDelelteMessage(M_id);
			if(cnt > 0) {
				System.out.println("삭제성공");
			}else {
				System.out.println("삭제실패");
			}
		} catch (Exception e) {
			// TODO: handle exception
			
		// 삭제버튼을 누른 메시지를 삭제하는 서비스
			
		}try {
			System.out.println("[MessageDelete]");
			int e_num = Integer.parseInt(request.getParameter("e_num"));
			System.out.println(e_num);
			int cnt = new DeleteDAO().DelelteMessage(e_num);
			if (cnt >0) {
				System.out.println("1개삭제");
			} else {
				System.out.println("1개 실패");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "Message.jsp";
	}
}
