package com.project.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.DelMemberService;
import com.project.controller.JoinService;
import com.project.controller.LoginService;
import com.project.controller.insertConService;
import com.project.controller.insertGroupService;
import com.project.controller.UpdateService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[종합 컨트롤러]");

		String uri = request.getRequestURI();
		System.out.println(uri);

		String cp = request.getContextPath();
		System.out.println(cp);

		String result = uri.substring(cp.length());
		System.out.println(result);

		request.setCharacterEncoding("UTF-8");
		String url = null;
		Service service = null;

		if (result.equals("/LoginService.do")) { // 로그인
			service = new LoginService();
		} else if (result.equals("/JoinService.do")) { // 회원가입
			service = new JoinService();
		} else if (result.equals("/UpdateService.do")) {
			service = new UpdateService();
		} else if (result.equals("/DelMemberService.do")) {
			service = new DelMemberService();
		} else if (result.equals("/insertConService.do")) {
			service = new insertConService();
		} else if (result.equals("/insertGroupService.do")) {
			service = new insertGroupService();
		} else if (result.equals("/contentList.do")) {
			service = new contentLi
		}
		url = service.execute(request, response);
		if (url != null) {
			response.sendRedirect(url);
		}
	}

}
