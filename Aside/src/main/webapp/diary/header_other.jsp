<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/common-setting.css">
<script>
	var onoffSet = false;
	
	function settingLayer() {
		if(onoffSet==false){
		    document.getElementById("setLayer").style.display = "block";
		    onoffSet = true;
		}else{
		    document.getElementById("setLayer").style.display = "none";
		    onoffSet=false;
		}
	}
</script>

<script type="text/javascript">
	function layer_open(el){

		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		}else{
			temp.fadeIn();
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('.cancle').click(function(e){
			if(bg){
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});
		
		temp.find('.no').click(function(e){
			if(bg){
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}				
</script>
    
		<div id="header">
			<div style="float:left">
				<a href="list_mytimeline.do"><img src="../image/logo.png"></a>
			</div>
			<div id="diary_menu">
			
				<a href="add.jsp"><img src="../image/menus/menu_add.png"></a>
				<a href="list_othertimeline.do"><img src="../image/menus/menu_mylist.png"></a>
				<a href="list_bookmarktimeline.do"><img src="../image/menus/menu_bookmark.png"></a>
				<img src="../image/menus/menu_setting.png"
						onclick="settingLayer()" style="cursor:pointer"/>
						
				<div id="setLayer" style="display:none;" class="pop-layer">
					<div class="arrow_box">
						<ul>
							<li><a href="logout.do">로그아웃</a></li>
							<li><a href="../user/set_password.html">비밀번호 변경</a></li>
							<li onclick="layer_open('layer2');return false;"><a>탈퇴하기</a></li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
		<hr>

		<jsp:include page="layer_signout.jsp"/>