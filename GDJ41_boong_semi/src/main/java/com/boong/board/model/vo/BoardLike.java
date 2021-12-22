package com.boong.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class BoardLike {
	
	private int boardLikeRef; // 게시글 번호 맞추는거
	private String boardLikeMember; // 좋아요 누른 사용자의 아이디 

}
