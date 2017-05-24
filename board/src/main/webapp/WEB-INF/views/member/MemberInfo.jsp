<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp"></jsp:include>
	<h3>회원정보</h3>
	아이디 : ${member.username}
	이름 : ${member.name}

<input type="button" value="수정" onclick='location.href="/member/${member.username}/modify"'>
<input type="button" value="로그아웃" onclick='location.href="/member/logout"'>
<jsp:include page="../footer.jsp"></jsp:include>