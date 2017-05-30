<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../header.jsp"></jsp:include>
<div class="row">
	<div class="col-md-12">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title">${ member.username} 정보</div>
			</div>
			<form:form class="form-horizontal" role="form" commandName="MemberVO" action="/admin/member" method="POST">
				<div class="panel-body">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">회원아이디</label>
						<div class="col-sm-10">
							<input type="text" name="username" class="form-control" id="username" value="" placeholder="ID" required="required" >
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">회원명</label>
						<div class="col-sm-10">
							<input type="text" name="name" class="form-control" id="name" value="" placeholder="Name" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">패스워드</label>
						<div class="col-sm-10">
							<input type="password" name="password" class="form-control" id="password" value="" placeholder="Password" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">확인</button>
							<a href="/admin/member" class="btn btn-info">목록</a>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>