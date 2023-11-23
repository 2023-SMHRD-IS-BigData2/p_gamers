package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@Getter
@ToString
@RequiredArgsConstructor
@NoArgsConstructor
public class GroupDTO {
	
	@NonNull
	private String g_name;
	@NonNull
	private String m_id;
	@NonNull
	private String c_name;
	@NonNull
	private String g_content;
	@NonNull
	private String g_start;
	@NonNull
	private String g_end;
	@NonNull
	private String g_member;
	@NonNull
	private String m_deal;
	private String m_tank;
	private String m_heal;
	private String g_file;

}
