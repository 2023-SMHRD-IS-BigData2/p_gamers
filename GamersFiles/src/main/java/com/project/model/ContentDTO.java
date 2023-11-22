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
@NoArgsConstructor
public class ContentDTO {
	
	@Nonnull private String c_name;
	@Nonnull private String c_title;
	@Nonnull private String c_1;
	@Nonnull private String c_2;
	@Nonnull private String c_3;
}
