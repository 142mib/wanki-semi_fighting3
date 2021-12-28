package com.boong.shop.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class OrderProduct {
	private int orderNumber;
	private int productId;
	private int orderId;
}
