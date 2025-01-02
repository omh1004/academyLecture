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

public class Enrollment {

	private String enrollmentNo;
    private String lectureId;
    private String studentId;
    private double rating;
    private String review;
    private Timestamp reviewCreatedDate;
    private Timestamp reviewUpdateDate;
    
}
