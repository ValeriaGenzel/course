<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Personal Page</title>
</head>
<body>
<%--<c:if test="${!empty sessionScope.login}">
    <form method="post" action="login_s">
        Hello, ${sessionScope.user_login}!
        <input type="hidden" name="action" value="out">
        <input type="submit" value="Logout"/>
     </form>
    <br>
    <form>
        <input type="text" name="login" value="${requestScope.login}" readonly>
        <input type="text" name="name" value="${requestScope.name}">
        <input type="text" name="surname" value="${requestScope.surname}">
        <input type="text" name="password" value="${requestScope.name}" >
    </form>>
    </c:if>--%>
    <a href="<c:url value="/home.jsp"/>">Home</a>
    <a href="<c:url value="/doctors.jsp"/>">Doctors</a>
    <a href="<c:url value="/diseases.jsp"/>">Diseases</a>
    <a href="<c:url value="/registration.jsp"/>">Registration</a>
    <a href="<c:url value="/login.jsp"/>">Login</a>
    <a href="<c:url value="/contacts.jsp"/>">Contacts</a>

    <form action="edit_profile_s" method="post">
        <label>
            login
            <input type="text" name="login" value="${requestScope.userLogin}" required readonly> <br>
        </label>
        <label>
            password
            <input type="name" name="name" value="${requestScope.userName}" required> <br>
        </label>
        <label>
            password
            <input type="surname" name="surname" value="${requestScope.userSurname}" required> <br>
        </label>
        <label>
            password
            <input type="password" name="password" value="${requestScope.userPasswordOld}" required> <br>
        </label>
        <label>
            confirm password
            <input type="password" name="confirm" value="${requestScope.userPasswordOld}" required> <br>
        </label>
        <label>
            email
            <input type="email" name="email" value="${requestScope.userEmail}" required> <br>
        </label>
        <label>
            tel
            <input type="tel" name="tel" value="${requestScope.userTel}" required> <br>
        </label>
        <input type="hidden" name="action" value="in">
        <input type="submit" value="sign in">
    </form>

</body>
</html>
