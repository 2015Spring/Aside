<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="head_settings.jsp"/>
</head>

<body>
	<div id="wrapper">
		<jsp:include page="header_other.jsp"/>
		
		<div id="article">
			<div id="article_list">
				<c:forEach var="diary" items="${list}">
					<div id="article_list_repeat" onclick="location.href='view.do?no=${diary.diary_no}'" style="cursor:pointer;"><!-- 반복 -->
						<label id="list_title">
							${diary.diary_date}
						</label><br>
						<pre style="background:none;">${diary.diary_context}</pre>
					</div><!-- 반복끝 -->
				</c:forEach>
				<br><br>
			</div>
			
			<jsp:include page="../diary/view_type.jsp"/>
		</div>
		
	</div>
</body>
</html>