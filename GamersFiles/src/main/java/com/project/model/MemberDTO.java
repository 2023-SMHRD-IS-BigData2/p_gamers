package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@AllArgsConstructor
@Getter
@ToString
@NoArgsConstructor
public class MemberDTO {

	@NonNull
	private String m_id;
	@NonNull
	private String m_pw;
	private String m_nick;
	private String m_position;
	private String m_date;

}
