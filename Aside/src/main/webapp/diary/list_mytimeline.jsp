<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
		var page = 5;
		$(window).scroll(function() {
			if($(window).scrollTop()+$(window).height() == $(document).height()) {
				$contentLoadTriggered = true;
				$.post("./list_mytimeline_add.do?page="+page, function(data){
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
		
		<div id="article">
			<div id="article_list">
				<c:choose>
				<c:when test="${list.equals([])}">
					<div id="empty_list">
						<a href="add.jsp">
							<img src="../image/menus/menu_add.png" style="float:left; margin:3px 20px 0px;"/>
							버튼을 통해 첫 일기를 작성 해 보세요!<br> 
							오늘 하루동안 느꼈던 점, 즐거웠던 일을 작성하고 확인버튼을 누르세요.<br>
							글을 작성할 때에는 공유/비공유 버튼과 댓글 허용/비허용을 선택하는 것을 잊지마세요!
						</a>
					</div>
				</c:when>
				<c:otherwise>
				<div id="list_div">
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
				</div>
				</c:otherwise>
				</c:choose>
				<br><br>
			</div>
			
			<jsp:include page="view_type_my.jsp"/> 
		</div>
		
	</div>
</body>
</html>