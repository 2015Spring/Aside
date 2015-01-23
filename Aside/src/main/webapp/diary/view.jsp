<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %> 
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
	
	<script>
	 $(window).load(function() {
	     $('#diary_form').css('display', 'none');  
	     $('#diary_view #image_radio_open').attr('checked', getBoolean($('#diary_view #image_radio_open_label').html()));
	     $('#diary_view #image_radio_comment').attr('checked', getBoolean($('#diary_view #image_radio_comment_label').html()));
	     
	     $(function() {
	         $('#image_button_update').click(function() {
	           $('#diary_view').css('display', 'none');
	           $('#diary_form').css('display', 'block');
	           $('#diary_form #diary_date').val($('#diary_view #diary_date').html());
	           $('#diary_form #diary_context').val($('#diary_view #diary_context').html());
	           $('#diary_form #image_radio_open').attr('checked', getBoolean($('#diary_view #image_radio_open_label').html()));
	           $('#diary_form #image_radio_comment').attr('checked', getBoolean($('#diary_view #image_radio_comment_label').html()));
	         });
	         
	         $('#image_button_cancle').click(function() {
	           $('#diary_view').css('display', 'block');
	           $('#diary_form').css('display', 'none');
	         });
	     });
	 });
	 
	 function getBoolean(str) {
		 if(str.trim() == "true") return true;
		 else return false;
	 }
	</script>
</head>

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
	
	<div id="diary_view" style="background-color:lightgray">
		<label id="diary_date"><fmt:formatDate pattern="yyyy/MM/dd" value="${diary.diary_date}" /></label><br>
		<p id="diary_context">${diary.diary_context}</p>
		<div>
        <div style="float:left">
          <label id="image_radio_open_label" style="display:none">${diary.diary_isopen} </label>
          <label id="image_radio_comment_label" style="display:none">${diary.diary_iscomment}</label>
          <input type="checkbox" name="diary_isopen" id="image_radio_open" onclick="return false">
          <input type="checkbox" name="diary_iscomment" id="image_radio_comment" onclick="return false">
        </div>
        <div style="float:right">
					<button id="image_button_update"><span class="glyphicon glyphicon-pencil"></span></button>
					<a href="delete.do?no=${diary.diary_no}"><span class="glyphicon glyphicon-trash"></span></a>
				</div>
    </div>
	</div>
	<form action="update.do" method="post" id="diary_form">
	    <input type="hidden" name="diary_no" value="${diary.diary_no}">
      <div class="form-group">
        <input type="text" name="diary_date" id="diary_date" class="form-control input-lg">
      </div>
      <div class="form-group">
        <textarea name="diary_context" id="diary_context" class="form-control"></textarea>
      </div>
      <div>
        <div style="float:left">
          <input type="checkbox" name="diary_isopen" id="image_radio_open"> 
          <input type="checkbox" name="diary_iscomment" id="image_radio_comment"> 
        </div> 
        <div style="float:right">
          <input type="submit" value="" id="image_button_insert"/>
          <input type="button" id="image_button_cancle"/>
        </div>
      </div>
  </form>
  </div>
</body>
</html>