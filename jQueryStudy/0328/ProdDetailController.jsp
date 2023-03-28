<%@page import="prodVO.ProdVO"%>
<%@page import="prodService.ProdServiceImpl"%>
<%@page import="prodService.IProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	
	IProdService service = ProdServiceImpl.getInstance();
	
	ProdVO vo = service.detailProd(id);
	
	request.setAttribute("voValue", vo);
	
	RequestDispatcher disp = request.getRequestDispatcher("/view/ProdDetail.jsp");
	disp.forward(request, response);
%>
</body>
</html>