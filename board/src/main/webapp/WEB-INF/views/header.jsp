<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="./header.lib.jsp"></jsp:include>
<!-- 상단 시작 { -->
<div id="hd">
	<div id="hd_wrapper">
		<div id="logo">
			<a href="/"><img src="/resources/default/img/logo.jpg" alt="로고"></a>
		</div>
		
		<ul id="tnb">
			<li><a href="#">정보수정</a></li>
			<li><a href="#">로그아웃</a></li>
			<li><a href="#">FAQ</a></li>
			<li><a href="#">1:1문의</a></li>
			<li><a href="#">새글</a></li>
		</ul>
	</div>
	<hr>
	<nav id="gnb">
	<h2>메인메뉴</h2>
	<ul id="gnb_1dul">
		<jsp:include page="./gnd.jsp"></jsp:include>
		
	</ul>
	</nav>
</div>
<!-- } 상단 끝 -->

<!-- 콘텐츠 시작 { -->
<div id="wrapper">

	<div id="aside">
		<!-- 로그인 후 아웃로그인 시작 { -->
		<section id="ol_before" class="ol">
		    <h2>회원로그인</h2>
		    <form name="foutlogin" action="http://demo.sir.kr/gnuboard5/bbs/login_check.php" onsubmit="return fhead_submit(this);" method="post" autocomplete="off">
		    <fieldset>
		        <input type="hidden" name="url" value="%2Fgnuboard5%2F">
		        <label for="ol_id" id="ol_idlabel" class="ol_idlabel">회원아이디<strong class="sound_only">필수</strong></label>
		        <input type="text" id="ol_id" name="mb_id" required="" class="required" maxlength="20">
		        <label for="ol_pw" id="ol_pwlabel" class="ol_pwlabel">비밀번호<strong class="sound_only">필수</strong></label>
		        <input type="password" name="mb_password" id="ol_pw" required="" class="required" maxlength="20" style="display: inline-block; width: 104px;">
		        <input type="submit" id="ol_submit" value="로그인">
		        <div id="ol_svc">
		            <a href="http://demo.sir.kr/gnuboard5/bbs/register.php"><b>회원가입</b></a>
		            <a href="http://demo.sir.kr/gnuboard5/bbs/password_lost.php" id="ol_password_lost">정보찾기</a>
		        </div>
		        <div id="ol_auto">
		            <input type="checkbox" name="auto_login" value="1" id="auto_login">
		            <label for="auto_login" id="auto_login_label">자동로그인</label>
		        </div>
		    </fieldset>
		    </form>
		</section>
	</div>
	
	<div id="container">