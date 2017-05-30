<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../header.jsp"></jsp:include>
<div class="content-box-large">
	<div class="panel-heading">
		<div class="panel-title">회원 관리</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>
							<a href="/admin/member_new">
								<span class="glyphicon glyphicon-plus"></span>
	                  			<span class="glyphicon-class">회원 생성</span>
                  			</a>
						</th>
						<th>회원아이디</th>
						<th>회원명</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="member" items="${list}">
						<tr>
							<td>
								<a class="btn btn-warning btn-sm" href="/admin/member/${member.username}">
									수정
								</a>
							</td>
							<td>${member.username}</td>
							<td>${member.name}</td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>