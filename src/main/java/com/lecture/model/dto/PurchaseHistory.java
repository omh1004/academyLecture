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

public class PurchaseHistory {

	private String paymentId;
    private String studentId;
    private String lectureId;
    private String paymentStatus;
    private double amount;
    private Timestamp paymentDate;
    
}
