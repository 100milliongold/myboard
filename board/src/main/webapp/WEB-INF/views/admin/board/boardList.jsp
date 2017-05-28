<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp"></jsp:include>
<div class="content-box-large">
	<div class="panel-heading">
		<div class="panel-title">Responsive Tables</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>
							<a href="/admin/board_new">
								<span class="glyphicon glyphicon-plus"></span>
	                  			<span class="glyphicon-class">게시판 생성</span>
                  			</a>
						</th>
						<th>테이블</th>
						<th>게시판 명</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<c:forEach var="board" items="${list}">
					<tbody>
						<tr>
							<td>
								<a class="btn btn-warning btn-sm" href="/admin/board/${board.board_table}">
									수정
								</a>
							</td>
							<td>${board.board_table}</td>
							<td><a href="/board/${board.board_table}">${board.board_name}</a></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>