<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %> 
<!DOCTYPE HTML>
<html>
<head>
	<c:choose>
		<c:when test="${viewType==1}">
			<jsp:include page="head_settings.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="head_settings-grid.jsp"/>
		</c:otherwise>
	</c:choose>
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

var page = 5;
$(window).scroll(function() {
	if($(window).scrollTop()+$(window).height() == $(document).height()) {
		$contentLoadTriggered = true;
		$.post("./list_othertimeline_add.do?page="+page, function(data){
            $("#list_div").append(data);
            $contentLoadTriggered = false;
        });
		page = page + 5;
	}
});
</script>
</head>
<body>	
	<div id="wrapper">
		<jsp:include page="header_my.jsp"/>
		
		<div id="article">
			<div id="article_list">
			<div id="list_div">
				<c:forEach var="diary" items="${list}">
					<div id="article_list_repeat_div">
						<label id="bookmark">
						<c:choose>
							<c:when test="${diary.user_no != loginInfo.user_no}">
								<c:choose>
								<c:when test="${diary.is_bookmark > 0}">
									<input type="checkbox" name="diary_bookmark" id="diary_bookmark" value="${diary.diary_no}" onclick="bookmark(this)" checked="checked">
								</c:when>
								<c:otherwise>
									<input type="checkbox" name="diary_bookmark" id="diary_bookmark" value="${diary.diary_no}" onclick="bookmark(this)">
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
			</div>
				<br><br>
			</div>
			
			<jsp:include page="view_type_other.jsp"/>
		</div>
		
	</div>
</body>