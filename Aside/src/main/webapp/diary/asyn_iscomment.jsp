<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	int diary_no = new Integer(request.getParameter("diary_no"));
	boolean iscomment = new Boolean(request.getParameter("iscomment"));
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ktds", "root", "1234");
	Statement stmt = con.createStatement();
	
	stmt.executeUpdate("update diary set diary_iscomment = " + iscomment + " where diary_no = " + diary_no);
%>