package com.boong.shop.model.vo;

import lombok.Data;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
public class Basket extends Product {

	
	
	private int basketNumber;
	private String memberId;
	private int productId;
	
	
	
}
