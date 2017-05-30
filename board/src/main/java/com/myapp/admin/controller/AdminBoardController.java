package com.myapp.admin.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.AbstractView;

import com.myapp.board.domain.BoardConfigVO;
import com.myapp.board.service.BoardService;

//게시판 관리

@Controller
@RequestMapping("/admin")
public class AdminBoardController {
	@Autowired
    private BoardService boardService;
	
	public static ModelAndView alert(final String msg, final String url) {
	    AbstractView view = new AbstractView() {
	        protected void renderMergedOutputModel(Map model, HttpServletRequest request, HttpServletResponse response) throws Exception {
	            response.setContentType("text/html; charset=UTF-8");
	            response.setCharacterEncoding("UTF-8");
	            PrintWriter outs = response.getWriter();
	            outs.println("<html>");
	            outs.println("<head>");
	            outs.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
	            outs.println("<script type='text/javascript'>");
	            outs.println("alert('"+msg+"');");
	            if("".equals(url)){
	            	outs.println("history.go(-1);");
	            }else{
	            	outs.println("location.replace('"+url+"');");
	            }
	            outs.println("</script>");
	            outs.println("</head>");
	            outs.println("</body>");
	            outs.println("</html>");
	            outs.flush();
	        }
	    };
	    return new ModelAndView(view);
	}
	
	
    //게시판 관리 - 게시판 생성
    @RequestMapping(value="/board_new", method=RequestMethod.GET)
    public ModelAndView writeForm() throws Exception{
    	
    	//모델겍체 생성
        ModelAndView modelandview = new ModelAndView("/admin/board/boardNew");
    	
        //뷰파일 불려오기
        return modelandview;
    }
    
   //게시판 관리 - 게시판 생성
    @RequestMapping(value="/board", method=RequestMethod.POST)
    public String write(@ModelAttribute("BoardConfigVO")BoardConfigVO boardconfig) throws Exception{
    	
    	//게시판 생성
    	boardService.boardConfigInsert(boardconfig);
    	
    	
        //리스트로 이동
        return "redirect:/admin/board/";
    }
    
    
    //게시판 관리 - 게시판 목록
    @RequestMapping(value="/board", method=RequestMethod.GET)
    public ModelAndView board_list() throws Exception{
    	
    	//게시판 테이블 불려오기
    	List<BoardConfigVO>list = boardService.boardConfigList();
    	
    	//모델겍체 생성
        ModelAndView modelandview = new ModelAndView("/admin/board/boardList");
        modelandview.addObject("list",list);
    	
        //뷰파일 불려오기
        return modelandview;
    }
    
    //게시판 관리 - 게시판 설정
    @RequestMapping(value="/board/{board_table}", method=RequestMethod.GET)
    public ModelAndView board_view(@PathVariable("board_table") String board_table) throws Exception{
    	
    	//게시판 속성보기
        BoardConfigVO boardconfig = boardService.boardConfigView(board_table);
        
        if(boardconfig == null){
        	return alert("게시판이 없습니다.", "");
        }

    	//모델겍체 생성
        ModelAndView modelandview = new ModelAndView("/admin/board/boardView");
        modelandview.addObject("boardconfig",boardconfig);
    	
        //뷰파일 불려오기
        return modelandview;
    }
    
    //게시판 관리 - 게시판 수정
    @RequestMapping(value="/board/{board_table}", method=RequestMethod.PATCH)
    public String board_modify(@PathVariable("board_table") String board_table,@ModelAttribute("BoardConfigVO")BoardConfigVO boardconfig) throws Exception{
    	
    	
    	boardService.boardConfigUpdate(board_table,boardconfig);
    	
    	
        //뷰페이지로 이동
        return "redirect:/admin/board/"+board_table;
    }
    
    //게시판 관리 - 게시판 삭제
    @RequestMapping(value="/board/{board_table}", method=RequestMethod.DELETE)
    public ResponseEntity<BoardConfigVO> board_delete(@PathVariable("board_table") String board_table) throws Exception{
    	
    	//게시판 삭제
    	try {
    		boardService.boardConfigDelete(board_table);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<BoardConfigVO>(HttpStatus.CONFLICT);
		}
    	
		
    	
    	return new ResponseEntity<BoardConfigVO>(HttpStatus.NO_CONTENT);
    	
    	//리스트로 이동
        //return "redirect:/admin/board/";
    }

}
