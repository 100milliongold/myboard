package com.myapp.board.mapper;

import java.util.List;

import com.myapp.board.domain.BoardConfigVO;

public interface BoardConfigMapper {
	
//	//�Խ��� ����
//	public void boardCreate(BoardConfigVO vo)throws Exception;
//	
//	//�Խ��� ����
//	public void boardUpdate(BoardConfigVO vo)throws Exception;
	
	//�Խ��� ���
	public List<BoardConfigVO> boardConfigList()throws Exception;
	
	//�Խ��� ��������
	public BoardConfigVO boardConfigView(String vo)throws Exception;
}
