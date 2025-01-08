package com.univora.lectures.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
	private String memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String email;
	private String phone;
	private String address;
	private Timestamp deletedAt;
	private boolean isDeleted;
	private String role;
	private String nickName;
	private String introduction;
	
}
