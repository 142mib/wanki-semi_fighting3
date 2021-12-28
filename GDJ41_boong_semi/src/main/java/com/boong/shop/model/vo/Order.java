package com.boong.shop.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Order {
	private int orderId;
	private String orderRequest;
	private int orderPrice;
	private Date orderDate;
	private int orderState;
	private String memberId;
	private String orderReceiver;
	private String orderReceiverAdd;
	
	
}
