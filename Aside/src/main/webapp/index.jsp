<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Hello! This is INDEX</h1>
<div>
<c:choose>
  <c:when test="${empty loginInfo}">
    <a href="aside/login.html">로그인</a>
  </c:when>
  <c:otherwise>
		${loginInfo.user_email}<br>
		${loginInfo.user_password }<br>
		<a href="aside/logout.do">로그아웃</a>
  </c:otherwise>
</c:choose>
</div>
</body>
</html>