<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../../header.jsp"></jsp:include>
	<h2 id="container_title">${boardconfig.board_name}<span class="sound_only"> 목록</span></h2>
	<!-- 게시판 목록 시작 { -->
	
	<div id="bo_list" style="width:100%">
		<!-- 게시판 페이지 정보 및 버튼 시작 { -->
		<div class="bo_fx">
			<div id="bo_list_total">
				<span>Total ?건</span>
				${paging.pageNo} 페이지
			</div>
			<ul class="btn_bo_user">
				<li><a href="/board/${boardconfig.board_table}/post" class="btn_b02">글쓰기</a></li>
			</ul>
		</div>
		<!-- } 게시판 페이지 정보 및 버튼 끝 -->
		<div class="tbl_head01 tbl_wrap">
			<table>
				<caption>${boardconfig.board_name} 목록</caption>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">
							<!-- <label for="chkall" class="sound_only">현재 페이지 게시물 전체</label>
							<input type="checkbox" id="chkall" onclick="if (this.checked) all_checked(true); else all_checked(false);"> -->
						</th>
						<th scope="col">제목</th>
						<th scope="col">글쓴이</th>
						<th scope="col">날짜</th>
						<th scope="col">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${list}">
					<tr>
						<td class="td_num">${board.bno}</td>
						<td class="td_chk">
							<%-- <label for="chk_wr_id_0" class="sound_only">${board.subject}</label>
							<input type="checkbox" name="chk_wr_id[]" value="${board.bno}" > --%>
						</td>
						<td class="td_subject"><a href="/board/${boardconfig.board_table}/${board.bno}?page=${paging.pageNo}">${board.subject}</a></td>
						<td class="td_name sv_use"><span class="sv_guest">${board.writer}</span></td>
						<td class="td_date"><fmt:formatDate value="${board.reg_date}" pattern="MM/ dd" /></td>
						<td class="td_num">${board.hit}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="bo_fx">
			<ul class="btn_bo_user">
				<li><a href="/board/${boardconfig.board_table}/post" class="btn_b02">글쓰기</a></li>
			</ul>
		</div>
	</div>
	<noscript>
		<p>
			자바스크립트를 사용하지 않는 경우<br>
			별도의 확인 절차 없이 바로 선택삭제 처리하므로 주의하시기 바랍니다.
		</p>
	</noscript>
	
	<!-- 페이지 -->
		<!-- // (Before) Doing... -->
		<jsp:include page="./paging.jsp" flush="true">
		    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
		    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
		    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
		    <jsp:param name="pageNo" value="${paging.pageNo}" />
		    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
		    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
		    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
		</jsp:include>
		<!-- // (After) Doing... -->
	  
    
	<script type="text/javascript">
	function goPage(page){
		location.href = "/board/${boardconfig.board_table}?page="+page;
	}
	</script>
	
   <!-- 게시판 검색 시작 { -->
		<fieldset id="bo_sch">
			<legend>게시물 검색</legend>
			<form name="fsearch" method="get">
				<input type="hidden" name="bo_table" value="wqrwr">
				<input type="hidden" name="sca" value="">
				<input type="hidden" name="sop" value="and">
				<label for="sfl" class="sound_only">검색대상</label>
				<select name="sfl" id="sfl">
					<option value="wr_subject">제목</option>
					<option value="wr_content">내용</option>
					<option value="wr_subject||wr_content">제목+내용</option>
					<option value="mb_id,1">회원아이디</option>
					<option value="mb_id,0">회원아이디(코)</option>
					<option value="wr_name,1">글쓴이</option>
					<option value="wr_name,0">글쓴이(코)</option>
				</select>
				<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
				<input type="text" name="stx" value="" required id="stx" class="frm_input required" size="15" maxlength="20">
				<input type="submit" value="검색" class="btn_submit">
			</form>
		</fieldset>
	<!-- } 게시판 검색 끝 -->
<jsp:include page="../../footer.jsp"></jsp:include>