package com.lecture.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class Review {

	private String reviewNo;
    private String content;
    private int contentLikeCount;
    private int contentLevel;
    private Date createdDate;
    private Date updatedDate;
    private String studentNo;
    private String studentName; // 학생 이름
    private String reviewFeedbackNo; // 부모 리뷰 번호
    private String lectureNo;
    
}
