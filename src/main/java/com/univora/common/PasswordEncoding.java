package com.univora.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordEncoding extends HttpServletRequestWrapper{
	public PasswordEncoding(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		String oriVal = super.getParameter(name);
		if(name.equals("password")) {
			String encStr = getSHA512(oriVal);
			return encStr;
		}
		
		return oriVal;
	}
	
	//데이터를 클라이언트에서 가져올 때 암호화를 함.
	public String getSHA512(String orival) {
		// java.security.MessageDigest클래스를 이용
		MessageDigest md = null;
		try {
			//암호화 알고리즘을 선택
			md = MessageDigest.getInstance("SHA-512");
		} catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		// 문자열을 바이트로 변경
		byte[] orivalByte = orival.getBytes();
		md.update(orivalByte);
		
		// 암호화하기 -> 암호화한 것에 대해 바이트로 반환
		byte[] encByte = md.digest();
		
		//암호화된 바이트를 인코더를 이용해서 스트링으로 변환
		String encStr = Base64.getEncoder().encodeToString(encByte);
		return encStr;
	}
}
