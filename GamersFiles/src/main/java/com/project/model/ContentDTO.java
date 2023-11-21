package com.project.model;

import javax.annotation.Nonnull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@Getter
@ToString
@RequiredArgsConstructor
@NoArgsConstructor
public class ContentDTO {
	
	@Nonnull private String c_name;
	private String c_date;
}
