<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.lib.jsp"></jsp:include>
<form method="POST" action="/member/loginProcessing">
	<%-- 사실 보안설정에서 csrf 은 비활성이지만 확인차 
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	--%>
	<!-- 로그인 시작 { -->
	<div id="mb_login" class="mbskin">
		<h1>로그인</h1>
		<fieldset id="login_fs">
			<legend>회원로그인</legend>
			<label for="login_id" class="login_id">
				회원아이디
				<strong class="sound_only"> 필수</strong>
			</label>
			<input type="text" name="username"	id="login_id" required class="frm_input required" size="20"	maxLength="20" value=""> 
			<label for="login_pw" class="login_pw">
				비밀번호
				<strong class="sound_only"> 필수</strong>
			</label>
			<input type="password" name="password" id="login_pw" required class="frm_input required" size="20" maxLength="20" value="">
			<input type="submit" value="로그인" class="btn_submit">
		</fieldset>
		<aside id="login_info">
			<h2>회원로그인 안내</h2>
			<p>
				회원아이디 및 비밀번호가 기억 안나실 때는 아이디/비밀번호 찾기를 이용하십시오.<br> 아직 회원이 아니시라면
				회원으로 가입 후 이용해 주십시오.
			</p>
			<div>
				<a href="/member/join" class="btn01">회원 가입</a>
			</div>
		</aside>
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
		<div class="btn_confirm">
			<a href="/">메인으로 돌아가기</a>
		</div>
	</div>
</form>
<jsp:include page="../footer.lib.jsp"></jsp:include>