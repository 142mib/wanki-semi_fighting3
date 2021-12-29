package com.boong.shop.model.vo;

import lombok.Data;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
public class OrderProduct extends Order {
	private int orderProductNumber;
	private int orderProductStatus;
	
	private int orderId;
	private int productId;
}
