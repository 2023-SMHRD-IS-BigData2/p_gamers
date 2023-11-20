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
public class CalendarDTO {
	private int a_num;// pk 넘버(고유값) 시퀀스
	@NonNull private String g_name;// 공대 이름
	@NonNull private String c_start;//시작 시간
	@NonNull private String c_end;// 끝나는 시간
	@NonNull private String c_content;// 일정 내용
	private String a_date;//sysdate
}
