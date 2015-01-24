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
						onclick="settingLayer()" style="cursor:pointer"/>
						
				<div id="setLayer" style="display:none;" class="pop-layer">
					<div class="arrow_box">
						<ul>
							<li><a href="logout.do">로그아웃</a></li>
							<li><a href="../user/set_password.html">비밀번호 변경</a></li>
							<li><a href="signout.do">탈퇴하기</a></li>
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
			
			function layer_open(el){

				var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
				var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

				if(bg){
					$('.layer').fadeIn();
				}else{
					temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
				}

				// 화면의 중앙에 레이어를 띄운다.
				if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
				else temp.css('top', '0px');
				if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
				else temp.css('left', '0px');

				temp.find('a.cbtn').click(function(e){
					if(bg){
						$('.layer').fadeOut();
					}else{
						temp.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
					}
					e.preventDefault();
				});

				$('.layer .bg').click(function(e){
					$('.layer').fadeOut();
					e.preventDefault();
				});

			}				
		</script>
		<hr>