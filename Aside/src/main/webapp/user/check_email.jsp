<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
String email = request.getParameter("email"); 

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ktds", "root", "1234");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select user_email from user where user_email = '" + email + "'");

StringBuffer str = new StringBuffer();
str.append("<?ml version='1.0' encoding='utf-8'?>");
str.append("<root>");
if(rs.next()) {
	str.append("false");
} else {
	str.append("true");
}
str.append("</root>");

response.setContentType("text/xml;charset=utf-8");
response.getWriter().write(str.toString());
%>