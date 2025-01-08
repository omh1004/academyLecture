package com.univora.review.model.dto;

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

    private String reviewNo;            // 리뷰 번호
    private String reviewContent;       // 리뷰 내용
    private Double reviewRating;        // 리뷰 평점
    private Integer reviewLikeCount;    // 좋아요 수
    private Integer reviewLevel;        // 리뷰 레벨
    private Date createdDate;           // 생성 날짜
    private Date updatedDate;           // 수정 날짜
    private Date deletedAt;             // 삭제 날짜 (nullable)
    private String isDeleted;           // 삭제 여부
    private String studentNo;           // 학생 번호
    private String parentReviewNo;      // 부모 리뷰 번호 (nullable)
    private String lectureNo;           // 강의 번호
    
}
