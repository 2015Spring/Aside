<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	int diary_no = new Integer(request.getParameter("diary_no"));
	boolean isopen = new Boolean(request.getParameter("isopen"));
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ktds", "root", "1234");
	Statement stmt = con.createStatement();
	
	stmt.executeUpdate("update diary set diary_isopen = " + isopen + " where diary_no = " + diary_no);
%>