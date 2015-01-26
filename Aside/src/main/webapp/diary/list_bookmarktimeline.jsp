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
function bookmark(ctrl) {
	createAjax();
	xmlReq.open("POST", "asyn_bookmark.jsp?diary_no="+ctrl.value+"&bookmark="+ctrl.checked, true);
	xmlReq.send(null);
}
</script>
</head>

<body>
	<div id="wrapper">
		<jsp:include page="header_other.jsp"/>
		
		<div id="article">
			<div id="article_list">
				<c:choose>
				<c:when test="${list.equals([])}">
					<div id="empty_list">
						<a href="list_othertimeline.do">
							<img src="../image/menus/menu_otherlist.png" style="float:left; margin:3px 20px 20px;"/>
							공유 된 일기를 보고, 마음에 드는 일기를 즐겨찾기 해 보세요!<br><br>
							<img src="../image/bookmark_inactive.png"/>&nbsp;&nbsp;버튼을 눌러 즐겨찾기를 설정하고<br>
							<img src="../image/bookmark_active.png"/>&nbsp;&nbsp;버튼을 눌러 즐겨찾기를 해제할 수 있습니다.<br>
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="diary" items="${list}">
						<div id="article_list_repeat_div">
							<label id="bookmark">
							<c:choose>
								<c:when test="${diary.user_no != loginInfo.user_no}">
									<input type="hidden" id="diary_no" value="${diary.diary_no}">
									<input type="checkbox" name="diary_bookmark" id="diary_bookmark" value="${diary.diary_no}" onclick="bookmark(this)" checked="checked">
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
				</c:otherwise>
				</c:choose>
				<br><br>
			</div>
			
			<jsp:include page="../diary/view_type.jsp"/>
		</div>
		
	</div>
</body>
</html>