<%@page import="memberVO.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="memberService.MemberServiceImpl"%>
<%@page import="memberService.IMemberService"%>
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
//요청시 전송데이터 받기

//service 객체가 필요
IMemberService service = MemberServiceImpl.getInstance();


List<MemberVO> list = service.getAllMember();

//처리결과로 view페이지로 이동시켜 응답데이터를 생성 - json Object배열 객체
//이동방법 
RequestDispatcher disp = request.getRequestDispatcher("view/listData.jsp");
disp.forward(request, response);
%>
</body>
</html>