<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../header.jsp"></jsp:include>
<div class="row">
	<div class="col-md-12">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title">${ member.username} 정보</div>
			</div>
			<form:form class="form-horizontal" role="form" commandName="MemberVO" action="/admin/member/${member.username}" method="PATCH">
				<div class="panel-body">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">회원아이디</label>
						<div class="col-sm-10">
							<input type="text" name="username" class="form-control" id="username" value="${ member.username}" placeholder="ID" readonly="readonly" >
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">회원명</label>
						<div class="col-sm-10">
							<input type="text" name="name" class="form-control" id="name" value="${ member.name}" placeholder="Name" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">패스워드</label>
						<div class="col-sm-10">
							<input type="password" name="password" class="form-control" id="password" value="" placeholder="Password">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-primary">회원정보 수정</button>
							<a href="/admin/member" class="btn btn-info">회원 목록</a>
							<button type="button" data-id="${member.username}" class="btn btn-danger button__delete">삭제</button>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>

<script type="text/javascript">
// https://github.com/appkr/l5code appkr님 소스 참조
$(document).ready(function() {
	$('.button__delete').on('click', function (e) {
	    var memberId = $(this).data('id');
	    if (confirm('복구가 안됩니다. 정말로 삭제하시겠습니까?')) {
	      $.ajax({
	        type: 'DELETE',
	        url: '/admin/member/' + memberId
	      }).then(function () {
	        window.location.href = '/admin/member';
	      });
	    }
	});
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>