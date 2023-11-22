package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.frontcontroller.Service;
import com.project.model.ContentDAO;
import com.project.model.ContentDTO;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;

public class SCService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("[컨텐츠 확인 서비스]");
		// 1. email, pw 가져오기
		String c_name = request.getParameter("c_name");
		
		// 3. DAO loginMember() 호출
		List<ContentDTO> content = new ContentDAO().contentList2(c_name);

		// 4. DB 값 가져와 콘솔에 'tel' 값 출력
		if (content != null) {
			System.out.println("조회 성공");
			HttpSession session = request.getSession();
			session.setAttribute("content", content);
		} else {
			System.out.println("조회 실패");
		}
		return "IG.jsp";
	}

}
