<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctors</title>
</head>
<body>

    <c:if test="${!empty sessionScope.user_login}">
        <form method="post" action="login_s">
            Hello, ${sessionScope.user_login}!
            <input type="hidden" name="action" value="out">
            <input type="submit" value="Logout"/>
            <a href="<c:url value="/editProfile.jsp"/>">Personal page</a>
            <a href="<c:url value="/diseaseHistory.jsp"/>">Disease history</a>
        </form>
    </c:if>

    <a href="<c:url value="/home.jsp"/>">Home</a>
    <%--<a href="<c:url value="/doctors.jsp"/>">Doctors</a>--%>
    <a href="<c:url value="/diseases.jsp"/>">Diseases</a>
    <a href="<c:url value="/registration.jsp"/>">Registration</a>
    <a href="<c:url value="/login.jsp"/>">Login</a>
    <a href="<c:url value="/contacts.jsp"/>">Contacts</a>
    <br>

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
        <c:if test="${!empty sessionScope.user_login}">
            <c:choose>
                <c:when test="${sessionScope.main_doctor}">

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
