package com.boong.shop.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.experimental.SuperBuilder;

@Data
@SuperBuilder
public class Order extends Product{
	private int orderId;
	private String orderRequest;
	private int orderPrice;
	private Date orderDate;
	private int orderStatus;
	private String memberId;
	private String orderReceiver;
	private String orderReceiverAdd;
	private String orderPhone;
	
	
}
