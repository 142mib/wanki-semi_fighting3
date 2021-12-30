package com.boong.carInfo.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CarInfo {
	private String modelClass;
	private String modelName;
	private String modelBrand;
	private String modelMade;
	private String modelInfo;
	private String fileName;

}
