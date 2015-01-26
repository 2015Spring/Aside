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
				<c:choose>
				<c:when test="${list.equals([])}">
					<!-- 으니야 여기다 새 글을 등록해보세요 이미지를 넣으렴!! -->
					글이없쪙!!!
				</c:when>
				<c:otherwise>
					<c:forEach var="diary" items="${list}">
					<div id="article_list_repeat_div">
						<div id="article_list_repeat" onclick="location.href='view.do?no=${diary.diary_no}'"><!-- 반복 -->
							<div id="list_title">
								<label>
									<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${diary.diary_date}" />
								</label>
							</div>
							<pre>${diary.diary_context}</pre>
						</div><!-- 반복끝 -->
					</div>
					</c:forEach>
				</c:otherwise>
				</c:choose>
				<br><br>
			</div>
			
			<jsp:include page="view_type.jsp"/> 
		</div>
		
	</div>
</body>
</html>