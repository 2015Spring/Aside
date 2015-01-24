<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/common-setting.css">

		<div class="layer">
			<div class="bg"></div>
			<div id="layer2" class="pop-layer2">
				<div class="pop-conts">
				
				<img src="../image/signout_cancle.png" class="cancle"/>
				<br>
				[탈퇴하기]<br>
				정말로 가실거예요...?<br>
				가지마세요
				<Br>
				
				<a class="no">
					<button class="btn btn-danger btn-lg" style="width:154px">
						아니요!
					</button>
				</a>
				<a href="signout.do">
					<button class="btn btn-info btn-lg" style="width:154px">
						네, 안녕히계세요.
					</button>
				</a>

				</div>
			</div>
		</div>