<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Sample Java Webapp</title>
</head>
<body>
    <h1>Sample Java Webapp</h1>
    <p>Current server time: <%= new java.util.Date() %></p>
    <p><a href="${pageContext.request.contextPath}/hello">Call HelloServlet</a></p>
</body>
</html>
