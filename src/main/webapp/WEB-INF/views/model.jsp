<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List"%>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sending data using model </title>
</head>
<body>
<h1>Sending data using model</h1>

<%

	String name =(String) request.getAttribute("name");

	List<String> names = (List<String>)request.getAttribute("n");

%>

<h1>hello <%=name %></h1>

<%for(String s:names){ %>


<h1><%= s %></h1>



<%} %>


</body>
</html>