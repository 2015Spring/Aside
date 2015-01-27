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
			<!-- 반복 -->
			<c:forEach var="comment" items="${list}">
			<div id="comment_repeat">
				<textarea id="${comment.comment_no}" readonly="readonly"
						rows="1" class="comment_textarea">${comment.comment_context}</textarea>
				
				<!-- 버튼 -->
				<c:if test="${loginInfo.user_no == comment.user_no}">
				<div id="comment_buttons">
					<button type="button" 
							onclick="gotoUpdate(${comment.comment_no})" 
							id="comment_update_btn" class="btn btn-default btn-lg">
						<span class="glyphicon glyphicon-pencil" id="comment_update_btn"></span>
					</button>
					&nbsp;&nbsp;
					<button type="button" onclick="deleteComment(${comment.comment_no})" 
							id="comment_delete_btn" class="btn btn-default btn-lg">
						<span class="glyphicon glyphicon-remove"></span>
					</button>
				</div>
				</c:if>
				
			</div>
			</c:forEach>
			
		</div>