<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="pg_wrap">
	<span class="pg">
		<a href="javascript:goPage(${param.firstPageNo})" class="pg_page pg_start">처음</a>
		<a href="javascript:goPage(${param.prevPageNo})" class="pg_page pg_prev">이전</a>
		<c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
	        <c:choose>
	            <c:when test="${i eq param.pageNo}">
	            	<%-- <span class="sound_only">열린</span><strong class="pg_current">${i}</strong><span class="sound_only">페이지 --%>
	            	<strong class="pg_current">${i}</strong><span class="sound_only">페이지</span>
	            </c:when>
	            <c:otherwise>
	            	<a href="javascript:goPage(${i})" class="pg_page">${i}<span class="sound_only">페이지</span></a>
	            </c:otherwise>
	        </c:choose>
	    </c:forEach>
		<a href="javascript:goPage(${param.nextPageNo})" class="pg_page pg_next">다음</a>
		<a href="javascript:goPage(${param.finalPageNo})" class="pg_page pg_end">맨끝</a>
	</span>
</nav>

