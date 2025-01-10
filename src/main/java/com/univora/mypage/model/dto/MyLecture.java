package com.univora.mypage.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class MyLecture {
    private String lectureId;
    private String className;
    private String instructorName;
    private String classStartDate;
}