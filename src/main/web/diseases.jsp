<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a href="<c:url value="/home.jsp"/>">Home</a>
    <a href="<c:url value="/doctors.jsp"/>">Doctors</a>
    <a href="<c:url value="/diseases.jsp"/>">Diseases</a>
    <a href="<c:url value="/registration.jsp"/>">Registration</a>
    <a href="<c:url value="/login.jsp"/>">Login</a>
    <a href="<c:url value="/contacts.jsp"/>">Contacts</a>

    <c:forEach items="${requestScope.diseaseList}" var="item">
        name: ${item[0]} surname: ${item[1]} spec: ${item[2]}
    </c:forEach>

</body>
</html>
