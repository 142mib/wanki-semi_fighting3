package com.boong.carInfo.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;
@Data
@Builder
public class Comment {
	private int commentNo;
	private String modelClass;
	private String memberId;
	private Date commentDate;
	private String content;
}
