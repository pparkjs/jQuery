<%@page import="com.google.gson.Gson"%>
<%@page import="memberVO.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ZipVO> list = (List<ZipVO>)request.getAttribute("dongListValue");

	Gson gson = new Gson();
	String result = gson.toJson(list);
	
	out.print(result);
	out.flush();
%>
