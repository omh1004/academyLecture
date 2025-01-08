package com.univora.admin.model.dto;

import java.sql.Timestamp;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReportBoard {
	private String reportNo;
	private String reportReasonCode;
	private String reportReasonStatus;
	private String reportTitle;
	private String reportContent;
	// 신고상태
	private String reportStatus;
	private String reportStatusCode;
	private String createdAt;
	private Timestamp updatedAt;
	private Timestamp deletedAt;
	private boolean isDeleted;
	private String postNo;
	// 신고한 사용자 정보
	private String reportMemberId;
	// 신고당한 게시글
	// 신고당한 글 내용
	private String reportFromContent;
	private String status;
	private String reportBoardType;
	
}
