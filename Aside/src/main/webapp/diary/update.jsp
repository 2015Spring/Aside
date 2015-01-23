<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
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
			<a href="list_mytimeline.do"><img src="../image/logo.png"></a>
		</div>
		<div style="float:right">
			<a href="add.jsp"><img src="../image/menus/menu_add.png"></a>
			<!-- .do로 바꾸기 -->
			<a href="list_othertimeline.jsp"><img src="../image/menus/menu_mylist.png"></a>
			<!-- .do로 바꾸기 -->
			<a href="list_bookmarktimeline.jsp"><img src="../image/menus/menu_bookmark.png"></a>
			<a href="#"><img src="../image/menus/menu_setting.png"></a>
		</div>
	</div>
	
	<hr>
	
	<form action="update.do" method="post">
		<input type="text" name="diary_date" value="<%="날짜받아오기"%>"/><br>
		<textarea rows="10" cols="50"><%="내용받아오기"%></textarea><br>
		<input type="checkbox" name="diary_isopen"/>공개여부
		<input type="checkbox" name="diary_iscmt"/>댓글여부
		<input type="submit" value="저장"/>
		<input type="button" value="취소"/>
	</form>
</body>
</html>