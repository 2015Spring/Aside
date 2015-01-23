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
	
	<script>
	 
	</script>
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
	
	<div id="diary_view">
		<label>${diary.diary_date}</label><br>
		<p>${diary.diary_context}</p>
		<button onclick="showUpdate()" id="image_button_update"><span class="glyphicon glyphicon-pencil"></span></button>
		<a href="delete.do?no=${diary.diary_no}"><span class="glyphicon glyphicon-trash"></span></a>
	</div>
	
  <form action="update.do" method="post" id="diary_form">
      <div class="form-group">
        <input type="text" name="diary_date" class="form-control input-lg" value="${diary.diary_date} }">
      </div>
      <div class="form-group">
        <textarea name="diary_context" class="form-control">${diary.diary_context}</textarea>
      </div>
      <div>
        <div style="float:left">
          <input type="checkbox" name="diary_isopen" value="1" id="image_radio_open"> 
          <input type="checkbox" name="diary_iscomment" value="1" id="image_radio_comment"> 
        </div>
        <div style="float:right">
          <input type="submit" value="" id="image_button_update"/>
          <input type="button" id="image_button_cancle"/>
        </div>
      </div>
    </form>
</body>
</html>