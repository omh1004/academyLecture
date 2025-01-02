package com.lecture.mypage.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Schedule {
	private String className;
	private String description;
	private String openDate;
	private String openTime;
	private User member;
}
