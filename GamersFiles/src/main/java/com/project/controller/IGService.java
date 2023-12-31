package com.project.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.frontcontroller.Service;
import com.project.model.GroupDAO;
import com.project.model.GroupDTO;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;

public class IGService implements Service {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[파티 생성 서비스]");
		try {
			// 파일 업로드를 위한 변수 설정
			// 1. request 객체
			// 2. 파일 저장 경로(String)
			String savePath = "C:\\Users\\SMHRD\\git\\p_gamers\\GamersFiles\\src\\main\\webapp\\groupfiles";
			System.out.println(savePath);
			// 3. 파일 최대 크기(int)
			int maxSize = 1024 * 1024 * 10;
			// 4. 인코딩 방식(String)
			String encoding = "UTF-8";
			// 5. 파일 이름 중복 제거
			DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
			// 파일 업로드 객체 -> MultipartRequest()

			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
			HttpSession session = request.getSession();
			MemberDTO login = (MemberDTO) session.getAttribute("login");
			// 요청 데이터 받기
			String g_name = multi.getParameter("g_name");
			String m_id = multi.getParameter("m_id");
			String c_name = multi.getParameter("c_name");
			String g_content = multi.getParameter("g_content");
			String g_start = multi.getParameter("g_start");
			String g_end = multi.getParameter("g_end");
			String g_member = multi.getParameter("g_member");
			String m_deal = multi.getParameter("m_deal");
			String g_file = multi.getFilesystemName("g_file");
			if(g_file==null) {
				g_file = "기본이미지.png";
			}
			String m_tank = multi.getParameter("m_tank");
			String m_heal = multi.getParameter("m_heal");
			
			GroupDTO gdto = new GroupDTO(g_name, m_id, c_name, g_content, g_start, g_end, g_member, m_deal, g_file, m_tank, m_heal);
			
			int cnt = new GroupDAO().insertGroup(gdto);
			
			if (cnt > 0) {
				System.out.println("파티 생성 성공");
			} else {
				System.out.println("파티 생성 실패");
			}
			
			String u_id = request.getParameter("m_id");
			String u_nick = request.getParameter("m_nick");
			String u_name = multi.getParameter("g_name");
			
			MemberDTO mdto = new MemberDTO(u_id, u_nick, u_name);
			
			int party = new MemberDAO().updateGroup(mdto);
			
			if (party > 0) {
				System.out.println("파티명 업데이트 성공");
				session.setAttribute("login", mdto);
				return "GamersMain.jsp";
			} else {
				System.out.println("파티명 업데이트 실패");
				return "GamersMain.jsp";
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "GamersMain.jsp";
		
	}

}
