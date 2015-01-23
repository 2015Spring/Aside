<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    	<style>
    		.arrow_box {
				position: relative;
				background: #ECECEC;
				border: 3px solid #D2D7D3;
				
				padding: 40px;
				width: 280px;
				height: 100px;
				border-radius: 6px; 
			}
			.arrow_box:after, .arrow_box:before {
				bottom: 100%;
				left: 50%;
				border: solid transparent;
				content: " ";
				height: 0;
				width: 0;
				position: absolute;
				pointer-events: none;
			}
			
			.arrow_box:after {
				border-color: rgba(236, 236, 236, 0);
				border-bottom-color: #ECECEC;
				border-width: 22px;
				margin-left: -22px;
			}
			.arrow_box:before {
				border-color: rgba(210, 215, 211, 0);
				border-bottom-color: #D2D7D3;
				border-width: 26px;
				margin-left: -26px;
			}
    	</style>
    
    
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
				
				<a href="../bookmark/list_bookmarktimeline.do">
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