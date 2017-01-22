<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctors</title>
</head>
<body>

<br>
<table>
    <tr>
        <td>
            <img src="" width="1110" height="250" alt=""/>
        </td>
        <td bgcolor="">
            <c:if test="${!empty sessionScope.login}">
                <form method="post" action="login_s">
                    Hello, ${sessionScope.login}!
                    <input type="hidden" name="action" value="out">
                    <input type="submit" value="Logout"/>
                    <a href="<c:url value="/editProfile.jsp"/>">Personal page</a>
                    <a href="<c:url value="/diseaseHistory.jsp"/>">Disease history</a>
                </form>
            </c:if>
            <c:if test="${empty sessionScope.login}">
                <form method="post" action="login_s">
                    <input type="hidden" name="action" value="in">
                    <input type="submit" value="Login"/>
                </form>
                <br>
                <a href="<c:url value="/registration.jsp"/>">Registration</a>
            </c:if>
            <br>
        </td>
    </tr>
</table>

    <c:forEach items="${requestScope.doctorList}" var="item">

        <%--name: ${item[0]} surname: ${item[1]} spec: ${item[2]} email: ${item[3]}--%>
        <table>
            <tr>
                <input type = "text" value="${item[0]}">
                <input type = "text" value="${item[1]}">
                <input type = "text" value="${item[2]}">
                <input type = "text" value="${item[3]}">
            </tr>
        </table>

    </c:forEach>
        <c:if test="${!empty sessionScope.login}">
            <c:choose>
                <c:when test="${sessionScope.user_role}">

                    <form method="post" action="add_doctor_s">
                        <input type = "text" value ="${sessionScope.dLogin}">
                        <input type = "text" value="${sessionScope.dPassword}">
                        <input type = "text" value ="${sessionScope.dName}">
                        <input type = "text" value ="${sessionScope.dSurname}">
                        <input type = "text" value ="${sessionScope.doctorEmail}">
                        <input type = "text" value="${sessionScope.dSpeciality}">
                        <input type="submit" value="add doctor"/>

                    </form>
                </c:when>
            </c:choose>
        </c:if>

</body>
</html>
