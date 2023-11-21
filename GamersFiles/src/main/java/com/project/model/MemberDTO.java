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

	@NonNull private String m_id;
	@NonNull private String m_pw;
	private String m_nick;
	private String g_name;
	private String m_position;
	private String m_date;

}
