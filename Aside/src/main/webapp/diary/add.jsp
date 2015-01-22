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
	<link rel="stylesheet" href="../css/common-header.css">
	<script type="text/javascript" src="../js/jquery-latest.js"></script>
	<script type="text/javascript" src="../js/common.js"></script>
	
	<script>
		$(function() {
			$('#image_radio_open').click(function() {
			  if($(this).is(":checked")) {$(this).attr('value', 0)} // 0
			  else {$(this).attr('value', 1)} // 1
			});
			$('#image_radio_comment').click(function() {
			    if($(this).is(":checked")) {$(this).attr('value', 0)} // 0
			    else {$(this).attr('value', 1)} // 1
			  });
		});
</script>
</head>

<%
	Calendar calendar = Calendar.getInstance();
	String date = calendar.get(Calendar.YEAR) + "/"
				+ (calendar.get(Calendar.MONTH) + 1) + "/"
				+ calendar.get(Calendar.DATE);
%>
<body >
	<div id="diary_menu">
		<div style="float:left">
			<a href="list_timeline.jsp"><img src="../image/logo.png"></a>
		</div>
		<div style="float:right">
			<a href="add.jsp"><img src="../image/menus/menu_add.png"></a>
			<a href="#"><img src="../image/menus/menu_mylist.png"></a>
			<a href="#"><img src="../image/menus/menu_bookmark.png"></a>
			<a href="#"><img src="../image/menus/menu_setting.png"></a>
		</div>
	</div>

	<hr>
	
	<form action="add.do" method="post" id="diary_form">
		<div class="form-group">
			<input type="text" name="diary_date" class="form-control input-lg" value=<%=date%>>
		</div>
		<div class="form-group">
			<textarea name="diary_context" class="form-control"></textarea>
		</div>
		<div>
			<div style="float:left">
				<input type="checkbox" value="0" name="diary_isopen" id="image_radio_open"> 
				<input type="checkbox" value="0" name="diary_iscomment" id="image_radio_comment"> 
			</div>
			<div style="float:right">
				<input type="submit" value="" id="image_button_insert"/>
				<input type="button" id="image_button_cancle"/>
			</div>
		</div>
	</form>
</body>
</html>
