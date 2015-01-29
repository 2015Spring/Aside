<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %> 
<!DOCTYPE HTML>
<html>
<head>
	<jsp:include page="head_settings.jsp"/>
	<script language="JavaScript"> 
		function showCalendar(y, m) {
			  var today;
			  var data_today;
			  var flag = 0;
			    var text = '<table>\n<tr><td colspan=7 style="text-align:center">'; 
			    text += '<span onclick="showCalendar('+(y-1)+','+m+')"> Y- </span>'; 
			    text += '<span onclick="showCalendar('+(m==1?(y-1)+','+12:y+','+(m-1))+')"> M- </span>'; 
			    text += '[' + y + '/' + ((m < 10) ? ('0' + m) : m) + ']'; 
			    text += '<span onclick="showCalendar('+(m==12?(y+1)+','+1:y+','+(m+1))+')"> M+ </span>'; 
			    text += '<span onclick="showCalendar('+(y+1)+','+m+')"> Y+ </span>'; 
			    text += '</td>'; 
			
			    var d1 = (y+(y-y%4)/4-(y-y%100)/100+(y-y%400)/400 
			          +m*2+(m*5-m*5%9)/9-(m<3?y%4||y%100==0&&y%400?2:3:4))%7; 
			    for (i = 0; i < 42; i++) { 
			        if (i%7==0){
			        	text += '</tr>\n<tr>';
			        }
			        if (i < d1 || i >= d1+(m*9-m*9%8)/8%2+(m==2?y%4||y%100==0&&y%400?28:29:30)){
		            	text += '<td> </td>';
			        }else{
			        	today = y + "-" + ((m < 10) ? ('0' + m) : m) + "-" 
			        		+(((i+1-d1) < 10) ? ('0' + (i+1-d1)) : (i+1-d1));
			        	
			        	var tmp;
			        	text += '<td' + (i%7 ? '' : ' style="color:red;"') + 
			            	' id="date_val'+today+'">' + (i+1-d1) + '</td>';
			        	}
		    	} 
		    document.getElementById('calendarDiv').innerHTML = text + '</tr>\n</table>'; 
		    print(y, m);
		} 
	
		function print(y, m){
			var d1 = (y+(y-y%4)/4-(y-y%100)/100+(y-y%400)/400 
			        +m*2+(m*5-m*5%9)/9-(m<3?y%4||y%100==0&&y%400?2:3:4))%7; 
			for (i = 0; i < 42; i++) { 
				today = y + "-" + ((m < 10) ? ('0' + m) : m) + "-" 
				+(((i+1-d1) < 10) ? ('0' + (i+1-d1)) : (i+1-d1));
				var tmp;
				  
				<c:forEach var="date" items="${list}">
				  //alert("<fmt:formatDate pattern="yyyy-MM-dd" value="${date}"/>");
				  tmp = "<fmt:formatDate pattern="yyyy-MM-dd" value="${date}"/>";
				//alert(tmp);
				if(today == tmp)
				  {
				    //alert(today);
				    $('#date_val'+today).css('font-weight','bold');
				  }
				</c:forEach>
			}
		}
	</script>
</head>

<body onload="showCalendar(2015,1)">
	<div id="wrapper">
		<jsp:include page="header_other.jsp"/>
		
		<div id="article">
			<div id="calendarDiv" style="font-family:Gulim;font-size:9pt;"></div>			
			<jsp:include page="view_type_my.jsp"/> 
		</div>
		
	</div>
</body>
</html>