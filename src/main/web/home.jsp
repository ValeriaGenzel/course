<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
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

    <form method="post" action="view_doctors">
        <input type="hidden" name="action" value="view_doctors">
        <input type="submit" value="Doctors"/>
    </form>

    <form method="post" action="view_diseases">
        <input type="hidden" name="action" value="view_diseases">
        <input type="submit" value="Diseases"/>
    </form>

    <a href="<c:url value="/registration.jsp"/>">Registration</a>

    <%--<c: if test="${!sessionScope.user_login}">--%>
        <%--<form method="post" action="login_s">--%>
            <%--<input type="hidden" name="action" value="out">--%>
            <%--<input type="submit" value="Login"/>--%>
        <%--</form>--%>
    <%--</c:>--%>
    <form method="post" action="view_main_doctor">
        <input type="hidden" name="action" value="view_main_doctor">
        <input type="submit" value="Contacts"/>
    </form>




</body>
</html>
