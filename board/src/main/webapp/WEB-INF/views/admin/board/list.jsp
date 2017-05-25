<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp"></jsp:include>
	<table class="table">
        <tr>
            <th>테이블</th>
            <th>게시판 명</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        <c:forEach var="board" items="${list}">
        <tr>
            <td>${board.board_table}</td>
            <td><a href="/board/${board.board_table}">${board.board_name}</a></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </c:forEach>
    </table>
<jsp:include page="../footer.jsp"></jsp:include>