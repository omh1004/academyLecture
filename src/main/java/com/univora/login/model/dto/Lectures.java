package com.univora.login.model.dto;

import java.sql.Blob;
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

public class Lectures {

    private String lectureNo;       // VARCHAR2
    private String userId;          // VARCHAR2
    private String lectureType;     // VARCHAR2
    private String className;       // VARCHAR2
    private String shortIntro;      // VARCHAR2
    private double price;           // NUMBER
    private Date startDate;         // DATE
    private Date endDate;           // DATE
    private String difficulty;      // VARCHAR2
    private String instructorIntro; // CLOB
    private String detailedIntro;   // VARCHAR2
    private Timestamp createdDate;  // TIMESTAMP
    private Timestamp updatedDate;  // TIMESTAMP
    private byte[] lecPic;            // BLOB
    
}
