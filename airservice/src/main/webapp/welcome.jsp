<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setHeader("cache-control","no-cache,no-store,must-revalidate");
		if(session.getAttribute("user_name")==null){
			response.sendRedirect("login.jsp");
		}
	%>
	<h1>welcome</h1>
	<form action="logout" method="post">
		<button type="submit">logout</button>
	</form>
</body>
</html>