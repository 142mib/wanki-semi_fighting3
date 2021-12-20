package com.boong.board.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Data
@Builder
public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int boardViewCount;
	private int boardLike;
	private int boardCategory; // 1:질문/답변  2:정보/공유  3:구매/판매  4:자유
	private String boardOriginalFilename;
	private String boardRenamedFilename;
	private String boardWriter; // Member.memberId
	
}
