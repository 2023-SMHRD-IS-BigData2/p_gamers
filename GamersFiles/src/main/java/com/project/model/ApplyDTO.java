package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Getter
@AllArgsConstructor
@NoArgsConstructor

public class ApplyDTO {
	
	private String send_nick;
	private String rcv_nick;
	private String send_pos;
	private String send_job;
	private String p_date;
	
}