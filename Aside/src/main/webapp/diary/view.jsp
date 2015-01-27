<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %> 
<!DOCTYPE HTML>
<html>
<head>
  <jsp:include page="head_settings.jsp"/>
  
  <script>
   $(window).load(function() {
       $('#diary_form').css('display', 'none');  
       $('#diary_view #image_radio_open').attr('checked', getBoolean($('#diary_view #image_radio_open_label').html()));
       $('#diary_view #image_radio_comment').attr('checked', getBoolean($('#diary_view #image_radio_comment_label').html()));
       
       $(function() {
           $('#image_button_update').click(function() {
             $('#diary_view').css('display', 'none');
             $('#diary_form').css('display', 'block');
             $('#diary_form #diary_date').val($('#diary_view #diary_date').val());
             $('#diary_form #diary_context').val($('#diary_view #diary_context').val());
             $('#diary_form #image_radio_open').attr('checked', getBoolean($('#diary_view #image_radio_open_label').html()));
             $('#diary_form #image_radio_comment').attr('checked', getBoolean($('#diary_view #image_radio_comment_label').html()));
           });
           
           $('#image_button_cancle').click(function() {
             $('#diary_view').css('display', 'block');
             $('#diary_form').css('display', 'none');
           });
           
       });
   });
   
   function getBoolean(str) {
     if(str.trim() == "true") return true;
     else return false;
   }
   
   var xmlReq;
   function createAjax() {
   	xmlReq = new XMLHttpRequest();
   }
   
   function bookmark(ctrl) {
   	createAjax();
   	xmlReq.open("POST", "asyn_bookmark.jsp?diary_no="+ctrl.value+"&bookmark="+ctrl.checked, true);
   	xmlReq.send(null);
   }
   
   function comment() {
       var diary_no = document.getElementById("diary_no");
       var comment_context = document.getElementById("comment_context");
       
       if(comment_context.value != ""){
    	createAjax();
        
        xmlReq.open("POST", "asyn_comment.jsp?diary_no="+diary_no.value
            +"&comment_context="+comment_context.value, false);
        xmlReq.send(null);
        
        comment_context.value = "";
        
        $("#comment").load("./comment.do?no=${diary.diary_no}");
        }
   }
   
   function deleteComment(comment_no)
   {
	   createAjax();
       
       xmlReq.open("POST", "asyn_deleteComment.jsp?comment_no="+comment_no, false);
       xmlReq.send(null);
       
       $("#comment").load("./comment.do?no=${diary.diary_no}");
   }
   
   function updateComment(comment_no, update_text)
   {	
	   createAjax();
       
       xmlReq.open("POST", "asyn_updateComment.jsp?comment_no="
    		   +comment_no+"&comment_context="+update_text, false);
       xmlReq.send(null);
       
       
       $("#comment").load("./comment.do?no=${diary.diary_no}");
   }
   
   var onoff = false;
   function commentView(){
       
    if(onoff==false){
      onoff=true;
      document.getElementById("comment").style.display = "block";
      }else{
        onoff=false;
        document.getElementById("comment").style.display = "none";
      }
    }
   
   function gotoUpdate(comment_no){
	  var updateButton = document.getElementById("comment_update_"+comment_no);
		
	  if($("#"+comment_no).prop("readonly")==true){
		  $("#"+comment_no).prop("readonly", false);
		  updateButton.className = "glyphicon glyphicon-ok";
	  }else{
		  updateComment(comment_no, $("#"+comment_no).val());
		  $("#"+comment_no).prop("readonly", true);
		  updateButton.className = "glyphicon glyphicon-pencil";
	  }
   }
   
  </script>
</head>

<body>
  <div id="wrapper">
    <jsp:include page="header_other.jsp"/>

    <div id="article">
    
    <!-- 보기 -->
    <div id="diary_view">
      <!-- 날짜 -->
      <c:choose>
        <c:when test="${diary.user_no == loginInfo.user_no}">
          <div class="form-group">
              <input type="text" id="diary_date" class="form-control input-lg" readonly
                value="<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${diary.diary_date}"/>"/>
          </div>
          <br><br>
        </c:when>
        <c:otherwise>
          <div class="form-group">
              <input type="text" id="diary_date_other" class="form-control input-lg" readonly
                value="<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${diary.diary_date}"/>"/>
              <c:choose>
              <c:when test="${diary.is_bookmark > 0}">
              	<input type="checkbox" id="diary_bookmark" class="diary_other_bookmark" checked="checked" />
              </c:when>
              <c:otherwise>
              	<input type="checkbox" id="diary_bookmark" class="diary_other_bookmark"/>
              </c:otherwise>
              </c:choose>
          </div>
          <br><br>
        </c:otherwise>
      </c:choose>
      
      <!-- 내용 -->
      <div class="form-group">
        <textarea id="diary_context" class="form-control" readonly="readonly">${diary.diary_context}</textarea>
      </div>
      
      <div id="article_buttons">
        <div id="article_button_left">
          <label id="image_radio_open_label" style="display: none">${diary.diary_isopen}</label>
          <label id="image_radio_comment_label" style="display: none">${diary.diary_iscomment}</label>
          <input type="checkbox" name="diary_isopen" id="image_radio_open"
            onclick="return false"> <input type="checkbox"
            name="diary_iscomment" id="image_radio_comment"
            onclick="return false">
          <!-- 댓글쓰기 버튼 -->
          <c:choose>
            <c:when test="${diary.diary_iscomment == true}">
              <div style="float: right;" onclick="commentView()">
                <img src="../image/view_icon/view_comment.png" id="comment_btn"/>
              </div>
            </c:when>
          </c:choose>
          
        </div>
        
        <div id="article_button_right">
          <c:choose>
            <c:when test="${diary.user_no == loginInfo.user_no}">
              <input type="button" id="image_button_update"/>
              <input type="button" id="image_button_delete"
                onclick="location.href='delete.do?no=${diary.diary_no}';"/>
            </c:when>
          </c:choose>
        </div>
        
      </div>
    </div>

    <!-- 수정 -->
    <form action="update.do" method="post" id="diary_form">
      <input type="hidden" name="diary_no" value="${diary.diary_no}">
      <div class="form-group">
        <input type="text" name="diary_date" id="diary_date" readonly
          class="form-control input-lg">
      </div>
      <br><br>
      <div class="form-group">
        <textarea name="diary_context" id="diary_context"
          class="form-control"></textarea>
      </div>
      
      <div id="article_buttons">
        <div style="float: left">
          <input type="checkbox" name="diary_isopen" id="image_radio_open">
          <input type="checkbox" name="diary_iscomment"
            id="image_radio_comment">
        </div>
        <div style="float: right; margin:5px 0px 0px;">
          <input type="submit" value="" id="image_button_insert"/>
          <input type="button" id="image_button_cancle"/>
        </div>
      </div>
    </form>
    
    
    <!-- 댓글창 -->
    <div style="display:none;" id="comment">
      
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
						<span class="glyphicon glyphicon-pencil" id="comment_update_${comment.comment_no}"></span>
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
		
		
    </div>
    
    <!-- article -->
    </div>
  <!-- wrapper -->
  </div>
</body>
</html>