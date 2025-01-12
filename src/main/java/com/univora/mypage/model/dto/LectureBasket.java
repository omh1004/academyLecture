package com.univora.mypage.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LectureBasket {
	private String lectureNo;
	private String className;
	private String nickname;
	private String memberId;
	private int price;
	private String lecturePicture;
}
