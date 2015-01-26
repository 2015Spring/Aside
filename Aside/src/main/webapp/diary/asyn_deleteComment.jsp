<%@page import="ktds.aside.domain.User"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	int comment_no = new Integer(request.getParameter("comment_no"));
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/ktds", "root", "1234");
	Statement stmt = con.createStatement();
	
	stmt.executeUpdate("DELETE FROM comment WHERE comment_no=" + comment_no);

%>