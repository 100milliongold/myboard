<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../header.jsp"></jsp:include>
    <h3>게시글 수정</h3>
    <div style="padding : 30px;">
        <form:form commandName="BoardVO" action="/board/${boardconfig.board_table}/post/${board.bno}" method="PATCH">
          <div class="form-group">
            <label>제목</label>
            <input type="text" name="subject" value="${board.subject}" class="form-control">
          </div>
          <div class="form-group">
            <label>내용</label>
            <textarea name="content" class="form-control" rows="5">${board.content}</textarea>
          </div>
          <button type="submit" class="btn btn-default">수정</button>
        </form:form>
    </div>
<jsp:include page="../footer.jsp"></jsp:include>