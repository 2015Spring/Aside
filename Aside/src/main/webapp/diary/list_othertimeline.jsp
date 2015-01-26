<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %> 
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="head_settings.jsp"/>
<script>
var xmlReq;
function createAjax() {
	xmlReq = new XMLHttpRequest();
}
$(function() {
	$('#diary_bookmark').click(function() {
      createAjax();
      xmlReq.onreadystatechange = callBack;
      xmlReq.open("POST", "asyn_bookmark.jsp?diary_no="+$('#diary_no').val()+"&bookmark="+$(this).is(':checked'), true);
      xmlReq.send(null);
  	});
	function callBack() {
	}
});
</script>
</head>

<body>	
	<div id="wrapper">
		<jsp:include page="header_my.jsp"/>
		
		<div id="article">
			<div id="article_list">
				<c:forEach var="diary" items="${list}">
					<div id="article_list_repeat_div">
						<label id="bookmark">
						<c:choose>
							<c:when test="${diary.user_no != loginInfo.user_no}">
								<input type="hidden" id="diary_no" value="${diary.diary_no}">
								<c:choose>
								<c:when test="${diary.is_bookmark > 0}">
									<input type="checkbox" name="diary_bookmark" id="diary_bookmark" checked="checked">
								</c:when>
								<c:otherwise>
									<input type="checkbox" name="diary_bookmark" id="diary_bookmark">
								</c:otherwise>
								</c:choose>
							</c:when>
						</c:choose>
						</label>
					
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
				<br><br>
			</div>
			
			<jsp:include page="view_type.jsp"/>
		</div>
		
	</div>
</body>