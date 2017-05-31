<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
	<!--[if lte IE 7]>
	<script>
	$(function() {
	    var $sv_use = $(".sv_use");
	    var count = $sv_use.length;
	    $sv_use.each(function() {
	        $(this).css("z-index", count);
	        $(this).css("position", "relative");
	        count = count - 1;
	    });
	});
	</script>
	<![endif]-->
</body>
</html>