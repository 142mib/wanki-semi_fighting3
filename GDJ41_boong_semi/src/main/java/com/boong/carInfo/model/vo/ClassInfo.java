package com.boong.carInfo.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ClassInfo {
 
	private String modelClass;
	private String modelBrand;
	private String modelGrade;
	private String price;
	private String speed;
	private String perKm;
	private String mile;
	private String output;
	private String drive;
	private String fileName;
	
}
