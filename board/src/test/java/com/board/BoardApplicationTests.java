package com.board;
 
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.myapp.MyappApplication;
import com.myapp.board.mapper.BoardConfigMapper;
 
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = MyappApplication.class)
@WebAppConfiguration
public class BoardApplicationTests {
    
    //@Autowired
    //private BoardMapper mapper;
    @Autowired
    private BoardConfigMapper mapper;
    @Test
    public void contextLoads() {
    }
    
    @Test
    public void testMapper() throws Exception{//�ۼ�
    	//BoardConfigMapper vo = new BoardConfigMapper();
        mapper.boardConfigView("test");
    }
 
}