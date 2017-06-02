<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 권한인증 오류 -->
<jsp:include page="../header.lib.jsp"></jsp:include>
    <script type="text/javascript">
    	alert("권한이 없습니다.");
    	history.go(-1);
    </script>
<jsp:include page="../footer.lib.jsp"></jsp:include>