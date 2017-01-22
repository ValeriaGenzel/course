<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add</title>
</head>
<body>
<c:if test="${!empty sessionScope.login}">
    <%--<c:choose>--%>
    <%--<c:when test="${sessionScope.main_doctor}">--%>

    <form method="post" action="add_doctor_s">

        <input type = "text" value ="${sessionScope.login}">
        <input type = "text" value ="${sessionScope.dLogin}">
        <input type = "text" value="${sessionScope.dPassword}">
        <input type = "text" value ="${sessionScope.dName}">
        <input type = "text" value ="${sessionScope.dSurname}">
        <input type = "text" value ="${sessionScope.doctorEmail}">
        <input type = "text" value="${sessionScope.dSpeciality}">
        <input type="submit" value="add doctor"/>

    </form>

    <c:choose>
        <c:when test="${!sessionScope.m}">
            <input type="text" value="doctor"/>
        </c:when>
    </c:choose>
    <%--</c:when>--%>
    <%--</c:choose>--%>
</c:if>
</body>
</html>
