package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@ToString
public class ItemDTO {

	private String item_name;
	private String item_level;
	private String equip_level;
	private String drop_location;
	private String drop_dungeon;
}
