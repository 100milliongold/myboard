<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp"></jsp:include>
    <h3>로그인</h3>
    <div style="padding : 30px;">
    	<c:if test="${param.error}">잘못된 아이디나 암호입니다.</c:if>
        <form method="POST" action="/member/loginProcessing">
          <div class="form-group">
            <label>아이디</label>
            <input type="text" name="username" class="form-control">
          </div>
          <div class="form-group">
            <label>패스워드</label>
            <input type="password" name="password" class="form-control">
          </div>
          <button type="submit" class="btn btn-default">로그인</button>
        </form>
        <button type="button" class="btn btn-default" onclick="location.href='/member/join'">가입</button>
    </div>
<jsp:include page="../footer.jsp"></jsp:include>