<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="text-align: center;">
	<ul class="pagination">
	    <%-- <li><a href="javascript:goPage(${param.firstPageNo})"><span class="glyphicon glyphicon-chevron-left"></span></a></li> --%>
	    <li><a href="javascript:goPage(${param.prevPageNo})"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
	        <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
	            <c:choose>
	                <c:when test="${i eq param.pageNo}"><li class="active"><a href="javascript:goPage(${i})">${i}</a></li></c:when>
	                <c:otherwise><li><a href="javascript:goPage(${i})">${i}</a></li></c:otherwise>
	            </c:choose>
	        </c:forEach>
	    <li><a href="javascript:goPage(${param.nextPageNo})"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
	    <%-- <li><a href="javascript:goPage(${param.finalPageNo})"><span class="glyphicon glyphicon-chevron-right"></span></a></li> --%>
	</ul>
</div>
