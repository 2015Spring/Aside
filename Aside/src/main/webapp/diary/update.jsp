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
			<!-- .do�� �ٲٱ� -->
			<a href="list_othertimeline.jsp"><img src="../image/menus/menu_mylist.png"></a>
			<!-- .do�� �ٲٱ� -->
			<a href="list_bookmarktimeline.jsp"><img src="../image/menus/menu_bookmark.png"></a>
			<a href="#"><img src="../image/menus/menu_setting.png"></a>
		</div>
	</div>
	
	<hr>
	
	<form action="update.do" method="post">
		<input type="text" name="diary_date" value="<%="��¥�޾ƿ���"%>"/><br>
		<textarea rows="10" cols="50"><%="����޾ƿ���"%></textarea><br>
		<input type="checkbox" name="diary_isopen"/>��������
		<input type="checkbox" name="diary_iscmt"/>��ۿ���
		<input type="submit" value="����"/>
		<input type="button" value="���"/>
	</form>
</body>
</html>