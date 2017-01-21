<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    LOGIN<br>
    <a href="<c:url value="/home.jsp"/>">Home</a>
    <a href="<c:url value="/doctors.jsp"/>">Doctors</a>
    <a href="<c:url value="/diseases.jsp"/>">Diseases</a>
    <a href="<c:url value="/registration.jsp"/>">Registration</a>
    <a href="<c:url value="/login.jsp"/>">Login</a>
    <a href="<c:url value="/contacts.jsp"/>">Contacts</a>
    <form action="login_s" method="post">
        <label>
            login
            <input type="text" name="login" required> <br>
        </label>
        <label>
            password
            <input type="password" name="password" required> <br>
        </label>
        <input type="hidden" name="action" value="in">
        <input type="submit" value="sign in">
    </form>
</body>
</html>
