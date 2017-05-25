<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="./header.jsp"></jsp:include>

<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
        <div class="col-md-3 col-lg-2 sidebar-offcanvas" id="sidebar" role="navigation">
        	<!-- 메뉴 -->
            <jsp:include page="./menu.jsp"></jsp:include>
            <!-- //메뉴 -->
        </div>
        <!--/col-->

        <div class="col-md-9 col-lg-10 main">

           
            <p class="hidden-md-up">
                <button type="button" class="btn btn-primary-outline btn-sm" data-toggle="offcanvas"><i class="fa fa-chevron-left"></i> Menu</button>
            </p>

            <h1 class="display-2 hidden-xs-down">
            Bootstrap 4 Dashboard
            </h1>
        </div>
    </div>
</div>
<jsp:include page="./footer.jsp"></jsp:include>