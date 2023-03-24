<%@page import="lprodVO.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="lprodService.LprodServiceImpl"%>
<%@page import="lprodService.ILprodService"%>
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

	//요청 데이터
	
	//service객체를 얻어오기
	ILprodService service = LprodServiceImpl.getService();
	//service메소드 호출 - 결과값 받기
	List<LprodVO> list = service.selectAll();
	
	//결과값을 request에 저장
	request.setAttribute("listValue", list);
	
	//view페이지로 이동
	RequestDispatcher req = request.getRequestDispatcher("/view/LprodList.jsp");
	req.forward(request, response);
	
%>
</body>
</html>