<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Aside</title>
</head>

<body>
	<a href="#">로고</a><br>
	<a href="#">새글</a>
	<a href="#">목록</a>
	<a href="#">북마크</a>
	<a href="#">설정</a>
	
	<hr>
	
	<form action="update.do" method="post">
		<input type="text" name="diary_date" value="<%="날짜받아오기"%>"/><br>
		<textarea rows="10" cols="50"><%="내용받아오기"%></textarea><br>
		<input type="checkbox" name="diary_isopen"/>공개여부
		<input type="checkbox" name="diary_iscmt"/>댓글여부
		<input type="submit" value="저장"/>
		<input type="button" value="취소"/>
	</form>
</body>
</html>