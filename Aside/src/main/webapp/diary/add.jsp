<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="head_settings.jsp"/>
</head>

<%
	Calendar calendar = Calendar.getInstance();
	String date = calendar.get(Calendar.YEAR) + "/"
				+ (calendar.get(Calendar.MONTH) + 1) + "/"
				+ calendar.get(Calendar.DATE);
%>
<body>
	<div id="wrapper">
		<jsp:include page="header_other.jsp"/>
		
		<div id="article">
		<form action="add.do" method="post" id="diary_form">
			<div class="form-group">
				<input type="text" name="diary_date" class="form-control input-lg" value="<%=date%>">
			</div>
			<div class="form-group">
				<textarea id="diary_context" name="diary_context" class="form-control"></textarea>
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
