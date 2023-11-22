package com.project.model;

public class ComentDTO {

	private String m_nick;
	private String m_coment;

	public ComentDTO(String m_nick, String m_coment) {
		this.m_nick = m_nick;
		this.m_coment = m_coment;
	}

	public String getM_nick() {
		return m_nick;
	}

	public String getM_coment() {
		return m_coment;
	}

}
