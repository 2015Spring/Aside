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
			$.post("./list_add.do?page="+page, function(data){
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
		<jsp:include page="header_other.jsp"/>
		
		<div id="article"><!-- common -->
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
				
				<div id="list_div">
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
				</c:otherwise>
				</c:choose>
				<br><br>
			</div>
			
			<jsp:include page="../diary/view_type_bookmark.jsp"/>
		</div>
		
	</div>
</body>
</html>