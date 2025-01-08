package com.univora.lectures.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Payment {
	private String paymentId;
	private String studentId;
	private String lectureId;
	private String paymentStatus;
	private int totalAmound;
}
