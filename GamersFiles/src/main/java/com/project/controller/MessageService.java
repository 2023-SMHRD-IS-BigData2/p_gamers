package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.frontcontroller.Service;
import com.project.model.MessageDAO;
import com.project.model.MessageDTO;

public class MessageService implements Service {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("[MessageServic.do]");
		
		String e_sender = request.getParameter("e_sender"); // 보낸사람
		String e_recipient = request.getParameter("e_recipient"); // 받는사람
		String e_title = request.getParameter("e_title"); // 제목
		String e_content = request.getParameter("e_content"); //내용
		
		MessageDTO vo = new MessageDTO(e_sender, e_recipient, e_title, e_content);
		
		int row = new MessageDAO().insertMessage(vo);
		if (row > 0) {
			System.out.println("메시지 전송성공");
		} else {
			System.out.println("실패");
		}
		return "Message.jsp";
	}
}