package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.ContentDAO;
import com.project.model.ContentDTO;

public class ICService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("[컨텐츠 생성하기]");

		// 요청 데이터 받기
		String c_name = request.getParameter("c_name");

		ContentDTO cdto = new ContentDTO(c_name);

		int cnt = new ContentDAO().insertContent(cdto);

		System.out.println("cnt : " + cnt);

		if (cnt > 0) {
			System.out.println("컨텐츠 생성 성공");
			return "adminContent.jsp";
		} else {
			System.out.println("컨텐츠 생성 실패");
			return "adminContent.jsp";
		}
	}

}
