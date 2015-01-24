<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %> 
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
					<a href="view.do?no=${diary.diary_no}">
					<div id="article_list_repeat"><!-- 반복 -->
						<span id="list_title">
							<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${diary.diary_date}" />
						</span>
						<br>
						<pre>${diary.diary_context}</pre>
					</div><!-- 반복끝 -->
					</a>
				</c:forEach>
				<br><br>
			</div>
			
			<jsp:include page="view_type.jsp"/> 
		</div>
		
	</div>
</body>
</html>