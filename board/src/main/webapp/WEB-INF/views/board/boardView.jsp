<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../header.jsp"></jsp:include>
<h3>게시글 상세</h3>
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


<div>
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
			</div>
		</li>
		</c:forEach>
	</ul>
</div>

<div class="content-box-large">
	<div class="panel-heading">
		<div class="panel-title">댓글 입력</div>
	</div>
	<div class="panel-body">
		<form class="form-horizontal" role="form" method="POST" action="/board//${board.bno}/reply">
			<div class="form-group">
				<label for="board_table" class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-10">
					<input type="text" name="subject" class="form-control"	id="subject"  placeholder="이름" required="required">
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


<div>
	<ul class="media-list">
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
					Media heading<a class="anchorjs-link" href="#media-heading"><span
						class="anchorjs-icon"></span></a>
				</h4>
				<p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
					scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum
					in vulputate at, tempus viverra turpis.</p>
				<!-- Nested media object -->
				<div class="media">
					<div class="media-left">
						<a href="#"> <img class="media-object"
							data-src="holder.js/64x64" alt="64x64"
							style="width: 64px; height: 64px;"
							src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjE3OTY4NzUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
							data-holder-rendered="true">
						</a>
					</div>
					<div class="media-body">
						<h4 class="media-heading" id="nested-media-heading">
							Nested media heading<a class="anchorjs-link"
								href="#nested-media-heading"><span class="anchorjs-icon"></span></a>
						</h4>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum
						in vulputate at, tempus viverra turpis.
						<!-- Nested media object -->
						<div class="media">
							<div class="media-left">
								<a href="#"> <img class="media-object"
									data-src="holder.js/64x64" alt="64x64"
									style="width: 64px; height: 64px;"
									src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjE3OTY4NzUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
									data-holder-rendered="true">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading" id="nested-media-heading">
									Nested media heading<a class="anchorjs-link"
										href="#nested-media-heading"><span class="anchorjs-icon"></span></a>
								</h4>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
								scelerisque ante sollicitudin commodo. Cras purus odio,
								vestibulum in vulputate at, tempus viverra turpis.
							</div>
						</div>
					</div>
				</div>
				<!-- Nested media object -->
				<div class="media">
					<div class="media-left">
						<a href="#"> <img class="media-object"
							data-src="holder.js/64x64" alt="64x64"
							style="width: 64px; height: 64px;"
							src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjE3OTY4NzUiIHk9IjMyIiBzdHlsZT0iZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQ7ZG9taW5hbnQtYmFzZWxpbmU6Y2VudHJhbCI+NjR4NjQ8L3RleHQ+PC9nPjwvc3ZnPg=="
							data-holder-rendered="true">
						</a>
					</div>
					<div class="media-body">
						<h4 class="media-heading" id="nested-media-heading">
							Nested media heading<a class="anchorjs-link"
								href="#nested-media-heading"><span class="anchorjs-icon"></span></a>
						</h4>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum
						in vulputate at, tempus viverra turpis.
					</div>
				</div>
			</div>
		</li>
	</ul>
</div>
<jsp:include page="../footer.jsp"></jsp:include>