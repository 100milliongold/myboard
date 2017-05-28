package com.myapp.board.mapper;

import java.util.HashMap;
import java.util.List;

import com.myapp.board.domain.ReplyVO;

public interface ReplyMapper {
	//댓글 작성
    //public void repleInsert(HashMap<String, Object> map)throws Exception;

	public List<ReplyVO> replyList(HashMap<String, Object> map)throws Exception;

	public void replyInsert(HashMap<String, Object> map) throws Exception;
}
