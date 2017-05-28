<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../header.jsp"></jsp:include>
<div class="row">
	<div class="col-md-12">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title">${boardconfig.board_name } 게시판 수정</div>
			</div>
			<div class="panel-body">
				<form:form class="form-horizontal" role="form"  commandName="BoardConfigVO" action="/admin/board/${ boardconfig.board_table}" method="PATCH">
					<div class="form-group">
						<label for="board_table" class="col-sm-2 control-label">게시판 테이블</label>
						<div class="col-sm-10">
							<input type="text" name="board_table" class="form-control" id="board_table"  disabled="disabled" value="${ boardconfig.board_table}" placeholder="Table" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label for="board_name" class="col-sm-2 control-label">게시판 명</label>
						<div class="col-sm-10">
							<input type="text" name="board_name" class="form-control" id="board_name" value="${boardconfig.board_name }" placeholder="Name" required="required">
						</div>
					</div>
					<!-- <div class="form-group">
						<label class="col-sm-2 control-label">Textarea</label>
						<div class="col-sm-10">
							<textarea class="form-control" placeholder="Textarea" rows="3"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Readonly</label>
						<div class="col-sm-10">
							<span class="form-control">Read only text</span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label> <input type="checkbox"> Checkbox </label>
							</div>
							<div class="checkbox">
								<label> <input type="checkbox"> Checkbox </label>
							</div>
						</div>
					</div> -->
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">게시판 수정</button>
							<a href="/admin/board" class="btn btn-info">게시판 목록</a>
							<button type="button" data-id="${ boardconfig.board_table}" class="btn btn-danger button__delete">삭제</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
// https://github.com/appkr/l5code appkr님 소스 참조
$(document).ready(function() {
	$('.button__delete').on('click', function (e) {
	    var boardId = $(this).data('id');
	    if (confirm('복구가 안됩니다. 정말로 삭제하시겠습니까?')) {
	      $.ajax({
	        type: 'DELETE',
	        url: '/admin/board/' + boardId
	      }).then(function () {
	        window.location.href = '/admin/board';
	      });
	    }
	});
});
</script>
<jsp:include page="../footer.jsp"></jsp:include>