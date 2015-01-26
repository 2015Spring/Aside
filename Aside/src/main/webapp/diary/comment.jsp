<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<br><br>
      <!-- 엔터치면 등록되도록! -->
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
      
      <div style="margin:5px 0px 0px;">
        <c:forEach var="comment" items="${list}">
          <div id="comment_list_repeat"><!-- 반복 -->
            <pre>${comment.comment_context}</pre>
          </div><!-- 반복끝 -->
        </c:forEach>
      </div>