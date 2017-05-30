<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp"></jsp:include>
<form method="POST" action="/member/loginProcessing">
	<%-- 사실 보안설정에서 csrf 은 비활성이지만 확인차 
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	--%>
	<div class="login">
		<div id='errorMsg' class="hide alert alert-danger" role="alert">
			<strong><i class='fa fa-warning'></i> <span id='errorTitle'></span></strong><span
				id='errorText'></span>
		</div>
		<div class="form-group">
			<label for='username' class="UsernamePassword">아이디:</label> <input
				name="username" type="text" class="form-control" id="username"
				maxlength="100" />
		</div>
		<div class="form-group">
			<label for='password' class="UsernamePassword">패스워드:</label> <input
				value='' name="password" class="form-control" type="password"
				id="password" maxlength="100" />
		</div>
		<div>
			<button id="btnLogin" class="btnBlue" style='width: 100% !important'
				type='submit'>로그인</button>
		</div>
	</div>
	<c:if test="${param.error != null}">
		<div class="alert alert-danger">
			<p>이이디와 패스워드가 잘못되었습니다.</p>
		</div>
	</c:if>
	<c:if test="${param.logout != null}">
		<div class="alert alert-success">
			<p>You have been logged out successfully.</p>
		</div>
	</c:if>
	<div>
		<p>${message}</p>
	</div>
</form>
<jsp:include page="../footer.jsp"></jsp:include>