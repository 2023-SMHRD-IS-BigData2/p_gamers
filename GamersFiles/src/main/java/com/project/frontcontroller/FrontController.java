package com.project.frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.controller.DGService;
import com.project.controller.DMService;
import com.project.controller.DelMessageService;
import com.project.controller.GCService;
import com.project.controller.IAService;
import com.project.controller.ICService;
import com.project.controller.IGService;
import com.project.controller.IMService;
import com.project.controller.LogoutService;
import com.project.controller.MCService;
import com.project.controller.MessageService;
import com.project.controller.PCService;
import com.project.controller.RMDService;
import com.project.controller.SMService;
import com.project.controller.UDMService;
import com.project.controller.UMService;

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

		if (result.equals("/SMService.do")) { // 로그인
			service = new SMService();
		} else if (result.equals("/IMService.do")) { // 회원가입
			service = new IMService();
		} else if (result.equals("/MCService.do")) { // ID 중복체크
			service = new MCService();
		} else if (result.equals("/GCService.do")) { // 파티 내 유저 확인
			service = new GCService();
		} else if (result.equals("/ICService.do")) { // 관리자 컨텐츠 생성
			service = new ICService();
		} else if (result.equals("/IGService.do")) { // 파티 생성
			service = new IGService();
		} else if (result.equals("/PCService.do")) { // 포지션 확인
			service = new PCService();
		} else if (result.equals("/UMService.do")) { // 회원 정보 수정
			service = new UMService();
		} else if (result.equals("/LogoutService.do")) { // 로그아웃
			service = new LogoutService();
		} else if (result.equals("/DGService.do")) { // 관리자 파티 삭제
			service = new DGService();
		} else if (result.equals("/DMService.do")) { // 관리자 회원 삭제
			service = new DMService();
		} else if (result.equals("/MessageService.do")) {
			service = new MessageService();
		} else if (result.equals("/IAService.do")) { // 파티 가입 신청
			service = new IAService();
		} else if (result.equals("/DelMessageService.do")) {
			service = new DelMessageService();
		} else if (result.equals("/RMDService.do")) {
			service = new RMDService();
		} else if (result.equals("/UDMService.do")) {
			service = new UDMService();
		}
		url = service.execute(request, response);
		if (url != null) {
			response.sendRedirect(url);
		}
	}

}
