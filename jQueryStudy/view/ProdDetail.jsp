<%@page import="com.google.gson.Gson"%>
<%@page import="prodVO.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProdVO vo = (ProdVO)request.getAttribute("voValue");
Gson gson = new Gson();
String result = gson.toJson(vo);

out.print(result);
out.flush();
%>
<%-- {
 	 "id" : "<%= vo.getProd_id() %>",
	 "name" : "<%= vo.getProd_name() %>",
	 "lgu" : "<%= vo.getProd_lgu() %>",
	 "buyer" : "<%= vo.getProd_buyer() %>",
	 "cost" : "<%= vo.getProd_cost() %>",
	 "price" : "<%= vo.getProd_price() %>",
	 "sale" : "<%= vo.getProd_sale() %>",
	 "outline" : "<%= vo.getProd_outline() %>",
	 "detail" : "<%= vo.getProd_detail() %>"
}
 --%>