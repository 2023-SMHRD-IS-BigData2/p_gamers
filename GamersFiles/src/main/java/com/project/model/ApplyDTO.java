package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;


@Getter
@NoArgsConstructor
public class ApplyDTO {
	
	
	private String send_id;
	private String send_nick;
	private String rcv_id;
	private String send_pos;
	private String send_class;
	
	public ApplyDTO(String send_id, String rcv_id, String send_pos, String send_class, String send_nick) {
		this.send_id = send_id;
		this.rcv_id = rcv_id;
		this.send_pos = send_pos;
		this.send_class = send_class;
		this.send_nick = send_nick;
	}
}