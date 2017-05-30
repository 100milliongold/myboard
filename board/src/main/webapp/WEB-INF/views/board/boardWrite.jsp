<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp"></jsp:include>
    <h3>${boardconfig.board_name} 게시글 작성</h3>
    <div style="padding : 30px;">
        <form method="POST" action="/board/${boardconfig.board_table}/post">
          <div class="form-group">
            <label>제목</label>
            <input type="text" name="subject" class="form-control">
          </div>
          <div class="form-group">
            <label>작성자</label>
            <input type="text" name="writer" class="form-control">
          </div>
          <div class="form-group">
            <label>내용</label>
            <textarea name="content" class="form-control" rows="5"></textarea>
          </div>
          <button type="submit" class="btn btn-default">작성</button>
        </form>
    </div>
<jsp:include page="../footer.jsp"></jsp:include>