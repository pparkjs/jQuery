<%@page import="prodVO.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//controller에서 저장된 결과 꺼내기
List<ProdVO> list = (List<ProdVO>)request.getAttribute("listValue");

if(list != null && list.size() > 0){
	
%>
{
	"flag" : "ok",
	"datas" : 
[
<%
	for(int i=0; i<list.size(); i++){
		ProdVO vo = list.get(i);
		if(i > 0) out.print(",");
%>
	{
		"id" : "<%= vo.getProd_id() %>",
		"name" : "<%= vo.getProd_name() %>"
	}
	
<%
	}
%>
  ]  <%--  datas에 해당하는 배열의 끝 [ for(){ {},{},{},{} } ] --%>
 } <%-- flag ok의 끝 --%>

 <%
}else{
%>
	{
		"flag" : "no"
	}	
<%	
}
 %>