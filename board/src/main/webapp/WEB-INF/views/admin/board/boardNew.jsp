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
				<div class="panel-title">게시판 생성</div>
			</div>
			<div class="panel-body">
				<form:form class="form-horizontal" role="form" commandName="BoardVO" action="/admin/board" method="POST">
					<div class="form-group">
						<label for="board_table" class="col-sm-2 control-label">게시판 테이블</label>
						<div class="col-sm-10">
							<input type="text" name="board_table" class="form-control" id="board_table" placeholder="Table" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="board_name" class="col-sm-2 control-label">게시판 명</label>
						<div class="col-sm-10">
							<input type="text" name="board_name" class="form-control" id="board_name"	placeholder="Name" required="required">
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
							<button type="submit" class="btn btn-primary">게시판 생성</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>