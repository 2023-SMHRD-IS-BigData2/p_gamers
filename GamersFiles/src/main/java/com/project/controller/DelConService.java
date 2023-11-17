package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.ContentDAO;

public class DelConService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[DelConService.do]");
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		int cnt = new ContentDAO().deleteContent(c_num);
		if (cnt > 0) {
			System.out.println("컨텐츠 삭제 성공");
			return "adminContent.jsp";
		} else {
			System.out.println("컨텐츠 삭제 실패");
			return "adminContent.jsp";
		}
	}

}
