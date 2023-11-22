package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@Getter
@ToString
@NoArgsConstructor
@RequiredArgsConstructor
@Data
public class MemberDTO {

	@NonNull
	private String m_id;
	@NonNull
	private String m_pw;
	private String m_nick;
	private String g_name;
	private String m_position;
	private String m_date;
	private String m_class;
	private String m_coment;

	public MemberDTO(@NonNull String m_id, @NonNull String m_pw, String m_nick, String g_name, String m_position,
			String m_class, String m_coment) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_nick = m_nick;
		this.g_name = g_name;
		this.m_position = m_position;
		this.m_class = m_class;
		this.m_coment = m_coment;
	}

}
