<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
    <a href="<c:url value="/home.jsp"/>">Home</a>
    <a href="<c:url value="/doctors.jsp"/>">Doctors</a>
    <a href="<c:url value="/diseases.jsp"/>">Diseases</a>
    <a href="<c:url value="/registration.jsp"/>">Registration</a>
    <a href="<c:url value="/login.jsp"/>">Login</a>
    <a href="<c:url value="/contacts.jsp"/>">Contacts</a>
    <form action="registration_s" method="post">
        <label>
            name
            <input type="text" name="name" required> <br>
        </label>
        <label>
            surname
            <input type="text" name="surname" required> <br>
        </label>
        <label>
            login
            <input type="text" name="login" required> <br>
        </label>
        <label>
            password
            <input type="password" name="password" required pattern="[a-zA-Z0-9]{6,20}"> <br>
        </label>
        <label>
            confirm password
            <input type="password" name="passwordConfirm" required pattern="[a-zA-Z0-9]{6,20}"> <br>
        </label>
        <input type="submit">
    </form>
</body>
</html>
