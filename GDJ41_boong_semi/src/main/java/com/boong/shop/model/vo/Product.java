package com.boong.shop.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;
@Data
@Builder
public class Product {
	
	private int shopProductId;
	private String shopProductName;
	private int shopProductPrice;
	private String shopProductContent;
	private int shopProductStock;
	private Date shopProductDate;
	private int shopProductSales;
	private String shopProductImage;
	private String shopProductImageRename;
	
	
	
	
	
	

}
