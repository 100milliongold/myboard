<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp"></jsp:include>
    <h3>회원가입</h3>
    <div style="padding : 30px;">
        <form method="POST" action="/member/join">
          <div class="form-group">
            <label>아이디</label>
            <input type="text" name="username" class="form-control">
          </div>
          <div class="form-group">
            <label>회원명</label>
            <input type="text" name="name" class="form-control">
          </div>
          <div class="form-group">
            <label>패스워드</label>
            <input type="password" name="password" class="form-control">
          </div>
          <button type="submit" class="btn btn-default">회원가입</button>
        </form>
    </div>
<jsp:include page="../footer.jsp"></jsp:include>