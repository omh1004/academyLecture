package com.univora.lectures.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UploadFile {
	private String uploadId; // 업로드pk upload_id
	private String savedName; // saved_name
}
