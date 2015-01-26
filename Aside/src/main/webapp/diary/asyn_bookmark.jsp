<%@page import="ktds.aside.domain.User"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	int diary_no = new Integer(request.getParameter("diary_no"));
	boolean bookmark = new Boolean(request.getParameter("bookmark"));
	User user = (User) session.getAttribute("loginInfo");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/ktds", "root", "1234");
	Statement stmt = con.createStatement();
	
	if(bookmark == true) { // insert
		stmt.executeUpdate("insert into bookmark (user_no, diary_no) values("+ user.getUser_no() +","+diary_no+")");
	} else { // delete
		stmt.executeUpdate("delete from bookmark where user_no="+ user.getUser_no() +" and diary_no="+diary_no);
	}
%>