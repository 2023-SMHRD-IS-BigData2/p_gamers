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
		
		String m_sender = request.getParameter("m_sender"); // 보낸사람
		String m_recipient = request.getParameter("m_recipient"); // 받는사람
		String m_title = request.getParameter("m_rirle"); // 제목
		String m_content = request.getParameter("m_content"); //내용
		
		MessageDTO vo = new MessageDTO(m_sender, m_recipient, m_title, m_content);
		
		int row = new MessageDAO().insertMessage(vo);
		
		return "Message.jsp";
	}
}