package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@Getter

public class MiniBoardDTO {
	private int p_num;
	@NonNull private String g_name;
	@NonNull private String m_id;
	@NonNull private String p_content;
	
	

}
