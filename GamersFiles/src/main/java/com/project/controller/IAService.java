package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.ApplyDAO;
import com.project.model.ApplyDTO;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;

public class IAService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[파티가입 서비스]");

		// 요청 데이터 받기
		String send_id = request.getParameter("send_id");
		String rcv_id = request.getParameter("rcv_id");
		String send_pos = request.getParameter("send_pos");
		String send_class = request.getParameter("send_class");
		String send_nick = request.getParameter("send_nick");
		
		ApplyDTO adto = new ApplyDTO(send_id, rcv_id, send_pos, send_class, send_nick);

		int cnt = new ApplyDAO().insertApply(adto);

		System.out.println("cnt : " + cnt);

		if (cnt > 0) {
			System.out.println("가입 신청 성공");
			return "GamersMain.jsp";
		} else {
			System.out.println("가입 신청 실패");
			return "GamersMain.jsp";
		}
	}

}
