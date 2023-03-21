<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Insert title here</title>
  <style>
    h1 {
      color: red;
    }

    p {
      font-size: 2em;
    }
  </style>
</head>
<body>
  <h1>JSP : Java Server Page</h1>

  <% //request : 내장객체 - HttpRequest String stxt = 
  String stxt = request.getParameter("txt"); 
  String pass = request.getParameter("pass"); 
  %>

  <p><%= stxt %></p>
  <p><%= pass %></p>
</body>
</html>