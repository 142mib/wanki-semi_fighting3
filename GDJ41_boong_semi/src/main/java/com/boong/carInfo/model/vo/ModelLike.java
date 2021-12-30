package com.boong.carInfo.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ModelLike {
	String modelClass;
	String memberId;
}
