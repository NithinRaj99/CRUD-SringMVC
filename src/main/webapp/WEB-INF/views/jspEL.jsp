<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Expression Language</title>
</head>
<body>
<h1>My name is ${name} </h1>
<h1>My id is ${id}</h1>
<h1>current date and time is ${time}</h1>

<c:forEach var="item" items="${num}">
<h1>${item }</h1>


</c:forEach>
<hr>
</body>
</html>