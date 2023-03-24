<%@page import="lprodVO.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//controller에서 저장한 데이터 꺼내기
 List<LprodVO> lprod = (List<LprodVO>)request.getAttribute("listValue");

%>
[
	<%
		for(int i=0; i<lprod.size(); i++){
			LprodVO vo = lprod.get(i);
			if(i > 0) out.print(",");
	%>
		{
			"id" : "<%= vo.getLprod_id() %>",
			"gu" : "<%= vo.getLprod_gu() %>",
			"nm" : "<%= vo.getLprod_nm() %>"
		}
	
	<%
		}
	%>


]



