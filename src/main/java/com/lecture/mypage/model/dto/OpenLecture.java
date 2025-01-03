package com.lecture.mypage.model.dto;

import com.lecture.model.dto.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OpenLecture {
	private String lectureNo;
	private Member author;
	private String className;
	private String description;
	private String openDate;
	private String openTime;
	private User member;
}
