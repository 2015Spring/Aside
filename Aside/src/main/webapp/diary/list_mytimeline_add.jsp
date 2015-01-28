<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="diary" items="${list}">
<div id="article_list_repeat_div">
	<div id="article_list_repeat" onclick="location.href='view.do?no=${diary.diary_no}'"><!-- 반복 -->
		<div id="list_title">
			<label>
				<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${diary.diary_date}" />
			</label>
		</div>
		<!-- 이미지 -->
		<c:choose>
		<c:when test="${diary.diary_image!=null }">
		 	<img id="list_image" src="../files/${diary.diary_image}">
			<pre id="list_text_img">${diary.diary_context}</pre>
		</c:when>
		<c:otherwise>
			<pre id="list_text">${diary.diary_context}</pre>
		</c:otherwise>
		</c:choose>
	</div><!-- 반복끝 -->
</div>
</c:forEach>

</body>
</html>