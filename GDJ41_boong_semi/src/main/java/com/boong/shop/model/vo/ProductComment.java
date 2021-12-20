package com.boong.shop.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductComment {
	
	private int shopCommentId;
	private String shopCommentContent;
	private Date shopCommentDate;
	private int shopCommentLevel;
	private int shopCommentRef;
	
	
	private String memberId;//pk
	private int shopProductId;//pk
	
	
	
	
	
}
