<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//controller에서 저장한 데이터 꺼내기
String res = (String)request.getAttribute("resValue");
if(res != null){
%>
	{
		"flag" : "사용불가능 id입니다."
	}	
	
<% }else{ %>

	{
		"flag" : "사용 가능 id입니다."
	}
	
<%
}
%>
