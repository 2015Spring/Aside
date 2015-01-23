<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/common.css">
	<!-- <link rel="stylesheet" href="../css/common-header.css"> -->
	<link rel="stylesheet" href="../css/common-header2.css">
	<script type="text/javascript" src="../js/jquery-latest.js"></script>
	<script type="text/javascript" src="../js/common.js"></script>
	<title>:: Say in an aside ::</title>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div style="float:left">
				<a href="list_mytimeline.do"><img src="../image/logo.png"></a>
			</div>
			<div id="diary_menu">
				<a href="add.jsp"><img src="../image/menus/menu_add.png"></a>
				<a href="list_mytimeline.do"><img src="../image/menus/menu_otherlist.png"></a>
				<!-- .do로 바꾸기 -->
				<a href="list_bookmarktimeline.jsp"><img src="../image/menus/menu_bookmark.png"></a>
				<a href="#"><img src="../image/menus/menu_setting.png"></a>
			</div>
		</div>
		
		<hr>
		
		<div id="article">
			<div id="article_list">
				<c:forEach var="diary" items="${list}">
					<div><!-- 반복 -->
						<a href="view.do?no=${diary.diary_no}"><label>${diary.diary_date}</label></a><br>
						<p>${diary.diary_context}</p>
					</div><!-- 반복끝 -->
				</c:forEach>
			</div>
			
			<div id="view_type">
				<a href="#"><img src="../image/view_type/viewtype_list.png"/></a>
				<a href="#"><img src="../image/view_type/viewtype_gird.png"/></a>
				<a href="#"><img src="../image/view_type/viewtype_calender.png"/></a>
			</div>
		</div>
		
	</div>
</body>