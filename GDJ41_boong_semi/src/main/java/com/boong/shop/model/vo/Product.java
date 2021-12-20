package com.boong.shop.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;
@Data
@Builder
public class Product {
	
	private int shop_product_id;
	private String shop_product_name;
	private int shop_product_price;
	private String shop_product_content;
	private int shop_product_stock;
	private Date shop_product_date;
	private int shop_product_sales;
	private String shop_product_image;
	private String shop_product_imageRename;
	
	
	
	
	
	

}
