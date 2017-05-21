package com.myapp.board.mapper;
 
 
import java.util.HashMap;
import java.util.List;

import com.myapp.board.domain.BoardConfigVO;
import com.myapp.board.domain.BoardVO;
 
public interface BoardMapper {
 
    //���ۼ�
    public void boardInsert(HashMap<String, Object> map)throws Exception;
    
    //�۸��
    public List<BoardVO> boardList(HashMap<String, Object> map)throws Exception;
    
    //�ۺ���
    public BoardVO boardView(HashMap<String, Object> map)throws Exception;
    
    //��ȸ�� ����
    public void hitPlus(HashMap<String, Object> map)throws Exception;
    
    //�ۼ���
    public void boardUpdate(HashMap<String, Object> map)throws Exception;
    
    //�ۻ���
    public void boardDelete(HashMap<String, Object> map)throws Exception;
}