<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><!-- 가운데 정렬을 합시다! -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>:: Say in an aside ::</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/common.css">
	<script type="text/javascript" src="../js/jquery-latest.js"></script>
	<script type="text/javascript" src="../js/common.js"></script>
</head>

<%
	Calendar calendar = Calendar.getInstance();
	String date = calendar.get(Calendar.YEAR) + "/"
				+ (calendar.get(Calendar.MONTH) + 1) + "/"
				+ calendar.get(Calendar.DATE);
%>
<body>
	<div id="wrapper">
		<div id="header">
			<div style="float:left">
				<a href="list_mytimeline.do"><img src="../image/logo.png"></a>
			</div>
			<div id="diary_menu">
				<a href="add.jsp"><img src="../image/menus/menu_add.png"></a>
				<!-- .do로 바꾸기 -->
				<a href="list_othertimeline.jsp"><img src="../image/menus/menu_mylist.png"></a>
				<!-- .do로 바꾸기 -->
				<a href="list_bookmarktimeline.jsp"><img src="../image/menus/menu_bookmark.png"></a>
				<a href="#"><img src="../image/menus/menu_setting.png"></a>
			</div>
		</div>
	
		<hr>
		
		<div id="article">
		<form action="add.do" method="post" id="diary_form">
			<div class="form-group">
				<input type="text" name="diary_date" class="form-control input-lg" value=<%=date%>>
			</div>
			<div class="form-group">
				<textarea name="diary_context" class="form-control"></textarea>
			</div>
			<div>
				<div style="float:left">
					<input type="checkbox" name="diary_isopen" id="image_radio_open"> 
					<input type="checkbox" name="diary_iscomment" id="image_radio_comment"> 
				</div>
				<div style="float:right">
					<input type="submit" value="" id="image_button_insert"/>
					<input type="button" id="image_button_cancle"
							onclick="history.back();"/>
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>
