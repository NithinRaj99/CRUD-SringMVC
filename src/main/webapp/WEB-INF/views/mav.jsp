<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting data using ModelAndView</title>
</head>
<body>
<h1>Setting data using ModelAndView</h1>

<%

String name =(String) request.getAttribute("name");
Integer id =(Integer) request.getAttribute("id");
LocalDateTime time =(LocalDateTime ) request.getAttribute("time");

%>

<h1>My name is <%=name %></h1>
<h1>My id is <%=id %></h1>
<h1>current date and time is <%=time %></h1>


</body>
</html>