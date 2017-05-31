<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../../header.jsp"></jsp:include>
<!-- 게시물 읽기 시작 { -->
<div id="bo_v_table">
	질문답변
</div>
<article id="bo_v" style="width:100%">
	<header>
		<h1 id="bo_v_title">${board.subject}</h1>
	</header>
	<section id="bo_v_info">
		<h2>페이지 정보</h2>
		작성자 <strong>${board.writer}</strong>
		<span class="sound_only">작성일</span><strong><fmt:formatDate value="${board.reg_date}" pattern="yyyy/ MM/ dd HH:mm" /></strong>
		조회<strong>${board.hit} 회</strong>
	</section>
	<!-- 게시물 상단 버튼 시작 { -->
	<div id="bo_v_top">
		<ul class="bo_v_nb">
			<li><a href="#" class="btn_b01">이전글</a></li>
			<li><a href="#" class="btn_b01">다음글</a></li>
		</ul>
		<ul class="bo_v_com">
			<li><a href="/board/${boardconfig.board_table}/post/${board.bno}" class="btn_b01">수정</a></li>
			<form:form	action="/board/${boardconfig.board_table}/post/${board.bno}" method="DELETE">
			<li><button type="submit" ><a>삭제</a></button></li>
			</form:form>
			<li><a href="/board/${boardconfig.board_table}" class="btn_b01">목록</a></li>
			<li><a href="/board/${boardconfig.board_table}/post" class="btn_b02">글쓰기</a></li>
		</ul>
	</div>
	<!-- } 게시물 상단 버튼 끝 -->
	<section id="bo_v_atc">
		<h2 id="bo_v_atc_title">본문</h2>
		<!-- 본문 내용 시작 { -->
		<div id="bo_v_con">
			<p>${board.content}</p>
		</div>
		<!-- } 본문 내용 끝 -->
	</section>
	<!-- 댓글 시작 { -->
	<section id="bo_vc">
		<h2>댓글목록</h2>
		<c:forEach var="reply" items="${reply_list}">
		<article id="c_${reply.cno}">
			<header>
				<h1>??? 님의 댓글</h1>
				작성일 <span class="bo_vc_hdinfo"><time datetime=""></time></span>
			</header>
			<!-- 댓글 출력 -->
			<p>
			 ${reply.content}
			</p>
		</article>
		</c:forEach>
	</section>
	<!-- } 댓글 끝 -->
</article>
<!-- } 게시판 읽기 끝 -->



<h3>${boardconfig.board_name} 게시글 상세</h3>
<div style="padding: 30px;">
	<div class="form-group">
		<label>제목</label> <span>${board.subject}</span>
	</div>
	<div class="form-group">
		<label>작성자</label> <span>${board.writer}</span>
	</div>
	<div class="form-group">
		<label>작성날짜</label> <span><fmt:formatDate
				value="${board.reg_date}" pattern="yyyy/ MM/ dd HH:mm" /></span>
	</div>
	<div class="form-group">
		<label>조회수</label> <span>${board.hit}</span>
	</div>
	<div class="form-group">
		<label>내용</label>
		<p>${board.content}</p>
	</div>
	<div class="form-group">
		<input type="button" value="수정"
			onclick='location.href="/board/${boardconfig.board_table}/post/${board.bno}"'>
		<form:form
			action="/board/${boardconfig.board_table}/post/${board.bno}"
			method="DELETE">
			<input type="submit" value="삭제">
		</form:form>
	</div>
</div>

<table style="width: 100%;">
	<tbody>
		<c:forEach var="reply" items="${reply_list}">
			<tr>
				<td>
					<div style="margin-left: ${(reply.depth-1)*50}px;">
						<h4 class="media-heading" id="media-heading">
							${reply.subject}</h4>
						<p>${reply.content}</p>
						<p>
							<button type="button" onclick="reply_reply('${reply.cno}');">댓글</button>
							<button type="button" onclick="reply_modify('${reply.cno}');">수정</button>
							<button type="button" onclick="reply_delete('${reply.cno}');">삭제</button>
						</p>
					</div>
					<!-- 댓글 수정창 -->
					<div id="c_${reply.cno}" class="content-box-large"
						style="display: none;" data-reply-id="${reply.cno}"
						data-disply="hide">
						<div class="panel-heading">
							<div class="panel-title">댓글 수정</div>
						</div>
						<div class="panel-body">
							<form:form commandName="BoardVO" class="form-horizontal"
								role="form"
								action="/board/${boardconfig.board_table}/${board.bno}/reply"
								method="PATCH">
								<input type="hidden" name="cno" value="${reply.cno}">
								<div class="form-group">
									<label for="board_table" class="col-sm-2 control-label">제목</label>
									<div class="col-sm-10">
										<input type="text" name="subject" class="form-control"
											value="${reply.subject}" id="subject" placeholder="이름"
											required="required">
									</div>
								</div>
								<div class="form-group">
									<label for="board_name" class="col-sm-2 control-label">댓글
										내용</label>
									<div class="col-sm-10">
										<textarea rows="5" class="form-control" name="content"
											id="content">${reply.content}</textarea>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-primary">수정</button>
									</div>
								</div>
							</form:form>
						</div>
					</div> <!-- 댓댓글 입력창 -->
					<div id="cr_${reply.cno}" class="content-box-large"
						style="display: none;" data-reply-id="${reply.cno}"
						data-disply="hide">
						<div class="panel-heading">
							<div class="panel-title">댓글 입력</div>
						</div>
						<div class="panel-body">
							<form:form commandName="BoardVO" class="form-horizontal"
								role="form"
								action="/board/${boardconfig.board_table}/${board.bno}/reply"
								method="POST">
								<input type="hidden" name="parent_id" value="${reply.cno}">
								<div class="form-group">
									<label for="board_table" class="col-sm-2 control-label">제목</label>
									<div class="col-sm-10">
										<input type="text" name="subject" class="form-control"
											value="" id="subject" placeholder="이름" required="required">
									</div>
								</div>
								<div class="form-group">
									<label for="board_name" class="col-sm-2 control-label">댓글
										내용</label>
									<div class="col-sm-10">
										<textarea rows="5" class="form-control" name="content"
											id="content"></textarea>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-primary">입력</button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>


<%-- <div>
	<ul class="media-list">
		<c:forEach var="reply" items="${reply_list}">
		<li class="media">
			<div class="media-left">
				<a href="#"> <img class="media-object"
					data-src="holder.js/64x64" alt="64x64"
					style="width: 64px; height: 64px;"
					src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjE3OTY4NzUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
					data-holder-rendered="true">
				</a>
			</div>
			<div class="media-body">
				<h4 class="media-heading" id="media-heading">
					${reply.subject}
				</h4>
				<p>
					${reply.content}
				</p>
				<p>
					<button type="button" onclick="reply_reply('${reply.cno}');">댓글</button>
					<button type="button" onclick="reply_modify('${reply.cno}');">수정</button>
					<button type="button" onclick="reply_delete('${reply.cno}');">삭제</button>
				</p>
				
				
			</div>
		</li>
		</c:forEach>
	</ul>
</div> --%>

<div class="content-box-large">
	<div class="panel-heading">
		<div class="panel-title">댓글 입력</div>
	</div>
	<div class="panel-body">
		<form class="form-horizontal" role="form" method="POST" action="/board/${boardconfig.board_table}/${board.bno}/reply">
			<div class="form-group">
				<label for="board_table" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input type="text" name="subject" class="form-control"	id="subject"  placeholder="제목" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="board_name" class="col-sm-2 control-label">댓글 내용</label>
				<div class="col-sm-10">
					<textarea rows="5" class="form-control" name="content" id="content" ></textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">확인</button>
				</div>
			</div>
		</form>
	</div>
</div>


<script>
	/* 댓글 수정창 */
	function reply_modify(idx){
		if($("#c_"+idx).data("disply") == "hide"){
			if($("#cr_"+idx).data("disply") != "hide"){
				reply_reply(idx);
			}
			$("#c_"+idx).show();
			$("#c_"+idx).data("disply","show");
		}else{
			$("#c_"+idx).hide();
			$("#c_"+idx).data("disply","hide");
		}
		
	}
	/* 대댓글 입력창 */
	function reply_reply(idx){
		if($("#cr_"+idx).data("disply") == "hide"){
			if($("#c_"+idx).data("disply") != "hide"){
				reply_modify(idx);
			}
			$("#cr_"+idx).show();
			$("#cr_"+idx).data("disply","show");
		}else{
			$("#cr_"+idx).hide();
			$("#cr_"+idx).data("disply","hide");
		}
		
	}
	/* 댓글 삭제 */
	function reply_delete(idx){
		var cno = idx;
		
	    if (confirm('복구가 안됩니다. 정말로 삭제하시겠습니까?')) {
	      $.ajax({
	        type: 'DELETE',
	        url: '/board/${boardconfig.board_table}/${board.bno}/reply/'+cno
	      }).then(function () {
	        window.location.href = '/board/${boardconfig.board_table}/${board.bno}';
	      });
	    }
	}
</script>
<jsp:include page="../../footer.jsp"></jsp:include>