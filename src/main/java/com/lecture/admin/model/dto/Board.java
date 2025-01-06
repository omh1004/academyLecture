package com.lecture.admin.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Board {

		private String boardNo;
	    
	    private String title;
	    private String content;
	    
	    private int likeCount;
	    private int viewCount;
	    
	    private Timestamp createdAt;
	    private Timestamp updatedAt;
	    private Timestamp deletedAt;
	    
	    private String isDeleted;
	    private String memberNo;
	    private String boardTypeNumber;
	    
	    /*private String category;
	    private String[] hashTag;*/
	    


	}

	
	


