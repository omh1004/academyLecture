package com.univora.lectures.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyClass {
	private Lectures myLecture;
	private User teacher;
	private UploadFile lecturePlay;
}
