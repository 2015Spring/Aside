<%@page import="ktds.aside.domain.User"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	int comment_no = new Integer(request.getParameter("comment_no"));
	String comment_context = request.getParameter("comment_context");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/ktds", "root", "1234");
	Statement stmt = con.createStatement();
	
	stmt.executeUpdate("UPDATE comment SET comment_context = '" + comment_context + 
			"' WHERE comment_no=" + comment_no);
	

%>