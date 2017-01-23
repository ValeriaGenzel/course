<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Error</title>
    </head>
    <body>
        Error...
        <br>
        ${requestScope.error_msg}
        <br>
<%-- commit suicide--%>
        <a href="<c:url value="/home.jsp"/>">Back home</a>
    </body>
</html>
