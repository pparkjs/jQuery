<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table{
	border: 1px solid blue;		
}
td{
	width: 300px;
	height: 40px;
	text-align: center;
}
	
	</style>
</head>
<body>
<%
	//요청시 전송데이터 받기
	 
	//데이터로 처리 수행_ DB와 연결해서 CRUD
	
	//처리결과로 응답데이터를 생성 - json 배열 객체
	String sid = "a001";
%>


<table border="1">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>이메일</td>
	</tr>
	<tr>
		<td>a001</td>
		<td>강아지</td>
		<td>010-2333-4444</td>
		<td>qkrwjdtn22@gmile.com</td>
	</tr>
	<tr>
		<td>b001</td>
		<td>배문기</td>
		<td>010-1111-4444</td>
		<td>qkrwjdtn12@gmile.com</td>
	</tr>
	<tr>
		<td>c001</td>
		<td>박정수</td>
		<td>010-7777-4444</td>
		<td>sadasd2@gmile.com</td>
	</tr>
</table>
</body>
</html>