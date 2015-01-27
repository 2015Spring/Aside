<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

		<!-- 댓글쓰는부분 -->
		<br><br>
		<form id="diary_form">
			<input type="hidden" name="diary_no" value="${diary.diary_no}" id ="diary_no">
			
			<div class="form-group">
				<textarea name="comment_context" id="comment_context"
					class="form-control" 
					onKeyDown="if(event.keyCode == 13){ comment(); return false;}" 
					onKeyUp="if(event.keyCode == 13) return false;" 
					onKeyPress="if(event.keyCode == 13) return false;"></textarea>
			</div>
		</form>
      
		<!-- 댓글 보이는 부분 -->
		<div id="comment_repeat_form">
			<c:forEach var="comment" items="${list}">
			<!-- 반복시작 -->
			<div style="background-color:#E0E0E0; border-radius:5px;">
				<div id="comment_list_repeat">
				
					<div id="comment_area">
						${comment.comment_context}
					</div>
					
					<c:if test="${loginInfo.user_no == comment.user_no}">
						<div id="comment_buttons">
							<button type="button" onclick="" 
									id="comment_update_btn" class="btn btn-default btn-lg">
								<span class="glyphicon glyphicon-pencil"></span>
							</button>
							&nbsp;&nbsp;
							<button type="button" onclick="deleteComment(${comment.comment_no})" 
									id="comment_delete_btn" class="btn btn-default btn-lg">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</div>
					</c:if>
				</div>
			</div>
			<!-- 반복끝 -->
			</c:forEach>
		</div>