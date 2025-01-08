package com.univora.mypage.model.dto;

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

public class Member {
	private String memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String email;
	private String phone;
	private String address;
	private Date birthday;
	private String nickName;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private Timestamp deletedAt;
	private String isDeleted;
	private String role;
	private String introduction; 
}
