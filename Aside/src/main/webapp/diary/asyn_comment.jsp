<%@page import="ktds.aside.domain.User"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	int diary_no = new Integer(request.getParameter("diary_no"));
  String comment_context = request.getParameter("comment_context");
	User user = (User) session.getAttribute("loginInfo");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/ktds", "root", "1234");
	Statement stmt = con.createStatement();
	
	stmt.executeUpdate("insert into comment (user_no, diary_no, comment_context, comment_date)"
	    +" values("+ user.getUser_no() +","+diary_no+",'"+comment_context+"',now())");

%>