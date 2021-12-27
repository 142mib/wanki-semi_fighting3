package com.boong.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;


@Data
@Builder
@AllArgsConstructor
public class BoardComment {
	// 게시판 댓글
	
	private int boardCommetNo; // 댓글 식별번호
	private int boardRef; // 참조 게시글 번호
	private String boardCommentWriter; // 댓글 작성자
	private String boardCommentContent; // 댓글 내용
	private Date boardCommentDate; // 댓글 작성 날짜
	private int boardCommentLevel; // 댓글 레벨(계층)
	private int boardCommentRef; // 댓글 참조번호
	
}
