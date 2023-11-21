package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Data;
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
public class MessageDTO {
	private String e_num;
	@NonNull private String e_sender;
	@NonNull private String e_recipient;
	@NonNull private String e_title;
	@NonNull private String e_content;
	private String e_date;
}
