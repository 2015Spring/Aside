<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:: Say in an aside ::</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/common.css">
<script type="text/javascript" src="../js/jquery-latest.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
</head>
<%
int user_no = new Integer(request.getParameter("no"));
%>
<body>
	<header id="logo_area">
		<img src="../image/logo.png" id="logo">
	</header>
	
	<form action="setpassword.do" method="post" id="account">
		<input type="hidden" name="user_no" value="<%=user_no%>"/>
		<div class="form-group">
			<input type="password" name="user_password" class="form-control input-lg" placeholder="password">
		</div>
		<div class="form-group">
			<input type="password" name="user_password_retype" class="form-control input-lg" placeholder="retype password">
		</div>
		<div class="form-group">
			<input type="submit" value="CHANGE" class="btn btn-primary input-lg btn-block">
		</div>
	</form>
</body>
</html>