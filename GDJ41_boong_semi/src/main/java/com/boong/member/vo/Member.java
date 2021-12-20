package com.boong.member.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;
import lombok.AllArgsConstructor;

@Data
@Builder
@AllArgsConstructor
public class Member {
	
	private String memberId;
	private String memberPw;
	private String memberName;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private String carPrefer;
	private Date enrollDate;

}
