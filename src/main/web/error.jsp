<%--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %
  Created by IntelliJ IDEA.
  User: Valeria
  Date: 14.01.2017
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
DNA ERROR PLEASE COMMIT SUICIDE<br>
${requestScope.error_msg} <br>

<a href="<c:url value="/home.jsp"/>">home</a>
<%--<form method="post" action="u">--%>
    <%--<input type="submit">--%>
<%--</form>--%>
</body>
</html>
