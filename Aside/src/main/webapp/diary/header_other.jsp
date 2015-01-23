<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/common-setting.css">
    
    
		<div id="header">
			<div style="float: left">
				<a href="list_mytimeline.do"><img src="../image/logo.png"></a>
			</div>
			<div id="diary_menu">
			
				<a href="add.jsp">
					<img src="../image/menus/menu_add.png">
				</a>
				
				<a href="list_othertimeline.do">
				  <img src="../image/menus/menu_mylist.png">
				</a>
				
				<a href="list_bookmarktimeline.do">
					<img src="../image/menus/menu_bookmark.png">
				</a>
				
				<img src="../image/menus/menu_setting.png"
						onclick="settingLayer()"/>
						
				<div id="setLayer" style="display:none;">
					<div class="arrow_box">
						<ul>
							<li>로그아웃</li>
							<li>비밀번호 변경</li>
							<li>탈퇴하기</li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
		
		<script>
			var onoff = false;
			
			function settingLayer() {
				if(onoff==false){
				    document.getElementById("setLayer").style.display = "block";
				    onoff = true;
				}else{
				    document.getElementById("setLayer").style.display = "none";
					onoff=false;
				}
			}
		</script>
		<hr>