<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Aside</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/common.css">
<script type="text/javascript" src="../js/jquery-latest.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<style>
	#image_button_insert, #image_button_cancle {
		border: none;
	    width: 42px;
	    height: 42px;
	}
	#image_button_insert {
		background:url(../image/add,update_icon/add,update_insert.png) no-repeat;
	}
	#image_button_cancle {
		background:url(../image/add,update_icon/add,update_cancle.png) no-repeat;
	}
	
	#image_radio_open, #image_radio_comment {
		border: none;
	    width: 42px;
	    height: 42px;
	    background-size: 42px;
	    -webkit-appearance: none;
	}
	#image_radio_open {
		background:url(../image/add,update_icon/add,update_unlock.png) left center no-repeat; 
	}
	#image_radio_open:checked {
		background:url(../image/add,update_icon/add,update_lock.png) left center no-repeat; 
	}
	#image_radio_comment {
		background:url(../image/add,update_icon/add,update_cmactive.png) left center no-repeat; 
	}
	#image_radio_comment:checked {
		background:url(../image/add,update_icon/add,update_cminactive.png) left center no-repeat; 
	}
	
	#diary_form {
		width:820px;
		background-color:#E0E0E0;
		border-radius:5px;
		padding:30px;
		display:inline-block;
	}
</style>
</head>

<%
	Calendar calendar = Calendar.getInstance();
	String date = calendar.get(Calendar.YEAR) + "."
				+ (calendar.get(Calendar.MONTH) + 1) + "."
				+ calendar.get(Calendar.DATE);
%>
<body>
	<header id="diary_menu">
		<a href="#"><img src="../image/logo.png"></a>
		<a href="#"><img src="../image/menus/menu_add.png"></a>
		<a href="#"><img src="../image/menus/menu_mylist.png"></a>
		<a href="#"><img src="../image/menus/menu_bookmark.png"></a>
		<a href="#"><img src="../image/menus/menu_setting.png"></a>
		<hr>
	</header>
	
	<form action="add.do" method="post" id="diary_form">
		<div class="form-group">
			<input type="text" name="diary_date" class="form-control input-lg" value=<%=date%>>
		</div>
		<div class="form-group">
			<textarea class="form-control"></textarea>
		</div>
		<div>
			<div style="float:left">
				<label class="checkbox-inline">
					<input type="checkbox" name="diary_isopen" id="image_radio_open"> 
				</label>
				<label class="checkbox-inline">
					<input type="checkbox" name="diary_iscomment" id="image_radio_comment"> 
				</label>
			</div>
			<div style="float:right">
				<input type="submit" value="" id="image_button_insert"/>
				<input type="button" id="image_button_cancle"/>
			</div>
		</div>
	</form>
</body>
</html>