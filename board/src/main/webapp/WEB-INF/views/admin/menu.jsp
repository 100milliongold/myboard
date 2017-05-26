<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="sidebar content-box" style="display: block;">
    <ul class="nav">
        <!-- Main menu -->
        <li class="current"><a href="/admin"><i class="glyphicon glyphicon-home"></i> Dashboard</a></li>
        <!-- 
        <li><a href="calendar.html"><i class="glyphicon glyphicon-calendar"></i> Calendar</a></li>
        <li><a href="stats.html"><i class="glyphicon glyphicon-stats"></i> Statistics (Charts)</a></li>
        <li><a href="tables.html"><i class="glyphicon glyphicon-list"></i> Tables</a></li>
        <li><a href="buttons.html"><i class="glyphicon glyphicon-record"></i> Buttons</a></li>
        <li><a href="editors.html"><i class="glyphicon glyphicon-pencil"></i> Editors</a></li>
        <li><a href="forms.html"><i class="glyphicon glyphicon-tasks"></i> Forms</a></li> 
        -->
        <li class="submenu">
             <a href="#">
                <i class="glyphicon glyphicon-list"></i> 사이트관리
                <span class="caret pull-right"></span>
             </a>
             <!-- Sub menu -->
             <ul>
                <li><a href="/admin/board"><i class="glyphicon glyphicon-list"></i>게시판관리</a></li>
            </ul>
        </li>
    </ul>
</div>