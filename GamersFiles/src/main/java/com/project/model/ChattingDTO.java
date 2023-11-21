package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@Getter
@ToString
public class ChattingDTO {
	private int w_num;
	private int g_name;
	@NonNull private String m_id;
	@NonNull private String w_content;
	private String w_date;	
}
