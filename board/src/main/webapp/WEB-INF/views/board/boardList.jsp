<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp"></jsp:include>
    <h3>${boardconfig.board_name} 게시글 목록</h3>
    <button class="btn btn-primary" style="float : right;" onclick="location.href='/board/${boardconfig.board_table}/post'">작성</button>
    <table class="table">
        <tr>
            <th>No</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성날짜</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="board" items="${list}">
        <tr>
            <td>${board.bno}</td>
            <td><a href="/board/${boardconfig.board_table}/${board.bno}?page=${paging.pageNo}">${board.subject}</a></td>
            <td>${board.writer}</td>
            <td><fmt:formatDate value="${board.reg_date}" pattern="MM/ dd" /></td>
            <td>${board.hit}</td>
        </tr>
        </c:forEach>
    </table>
    
    <!-- // (Before) Doing... -->
	<jsp:include page="./paging.jsp" flush="true">
	    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
	    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
	    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
	    <jsp:param name="pageNo" value="${paging.pageNo}" />
	    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
	    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
	    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
	</jsp:include>
	<!-- // (After) Doing... -->
	<script type="text/javascript">
	function goPage(page){
		location.href = "/board/${boardconfig.board_table}?page="+page;
	}
	</script>
<jsp:include page="../footer.jsp"></jsp:include>