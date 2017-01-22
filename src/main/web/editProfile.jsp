<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Personal Page</title>
</head>
<c:if test="${!empty sessionScope.login}">
    <header>
        <form method="post" action="login">
            Hello, ${sessionScope.login}!
            <input type="hidden" name="command" value="logout">
            <input type="submit" value="Logout"/>
        </form>
        <br/>

    </header>
    <form method="post" action="edit_profile_s">
        Personal information<br>
        <label>
            Login :
            <input type="text" name="login" value="${requestScope.login}" readonly>
        </label> <br>
        <label>
            Name :
            <input type="text" name="name" value="${requestScope.name}" >
        </label> <br>
        <label>
            Surname :
            <input type="text" name="surname" value="${requestScope.surname}" >
        </label> <br>
        <label>
            Password :
            <input type="password" name="password" value="${requestScope.password}" >
        </label> <br>
        Confirm Password :
            <input type="password" name="password" value="${requestScope.passwordConfirm}" >
        </label> <br>
        </label> <br>
        Email :
            <input type="text" name="password" value="${requestScope.email}" >
        </label> <br>
        <label>
            Tel :
            <input type="text" name="tel" value="${requestScope.tel}" >
        </label> <br>


        <input name="command" type="hidden" value="update">
        <input type="submit" value="update personal data">
    </form>

</c:if>
</body>
</html>
