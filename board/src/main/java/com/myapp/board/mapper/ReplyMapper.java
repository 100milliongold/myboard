package com.myapp.board.mapper;

import java.util.HashMap;
import java.util.List;

import com.myapp.board.domain.ReplyVO;

public interface ReplyMapper {
	//댓글 작성
    //public void repleInsert(HashMap<String, Object> map)throws Exception;

	// 댓글 리스트
	public List<ReplyVO> replyList(HashMap<String, Object> map)throws Exception;

	//댓글 입력
	public void replyInsert(HashMap<String, Object> map) throws Exception;

	//댓글 수정
	public void replyUpdate(HashMap<String, Object> map) throws Exception;

	//댓글 삭제
	public void replyDelete(HashMap<String, Object> map) throws Exception;
}
