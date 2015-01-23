<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/common-header.css">
	<script type="text/javascript" src="../js/jquery-latest.js"></script>
	<script type="text/javascript" src="../js/common.js"></script>
	<title>:: Say in an aside ::</title>
</head>

<body>
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
	
	<label>${diary.diary_date}</label><br>
	<p>${diary.diary_context}</p>
	<a href="update.do?no=${diary.diary_no}"><span class="glyphicon glyphicon-pencil"></span></a>
	<a href="delete.do?no=${diary.diary_no}"><span class="glyphicon glyphicon-trash"></span></a>
</body>
</html>