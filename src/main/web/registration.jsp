<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <link href="css.css" rel="stylesheet" type="text/css" />
</head>
<body>

<table>
    <tr>
        <td>
            <c:if test="${!empty sessionScope.login}">
                <form method="post" action="login_s">
                    Hello, ${sessionScope.login}!
                    <input type="hidden" name="action" value="out">
                    <input type="submit" value="Logout"/>
                    <form method="post" action="personal_page">
                        <input type="submit" value="Personal page">
                    </form>
                    <a href="<c:url value="/diseaseHistory.jsp"/>">Disease history</a>
                </form>
            </c:if>
            <c:if test="${empty sessionScope.login}">
                <a href="<c:url value="/login.jsp"/>">Login</a>
                <a href="<c:url value="/registration.jsp"/>">Registration</a>
            </c:if>
        </td>
    </tr>
</table>
<br>
<hr>
<table align="center" width="80%" border="0">
    <tr>
        <td>
            <header class="menu">
                <table align="center" border="0">
                    <tr>
                        <td>
                            <a href="<c:url value="/home.jsp"/>">Home</a></td>
                        <td>
                            <form method="post" action="view_doctors">
                                <input type="hidden" name="action" value="view_doctors">
                                <input type="submit" value="Doctors"/>
                            </form>
                        </td>
                        <td>
                            <form method="post" action="view_diseases">
                                <input type="hidden" name="action" value="view_main_doctor">
                                <input type="submit" value="Diseases"/>
                            </form>
                        </td>
                        <td>
                            <form method="post" action="view_main_doctor">
                                <input type="hidden" name="action" value="view_main_doctor">
                                <input type="submit" value="Contacts"/>
                            </form>
                        </td>
                    </tr>
                </table>
            </header>
            <br>

        </td>
    </tr>
    <br>
    <td>
        <form action="registration_s" method="post">
            <label>
                Name:<br>
                <input type="text" name="name" required pattern="[a-zA-Z]{1,25}"> <br>
            </label>
            <label>
                Surname:<br>
                <input type="text" name="surname" required pattern="[a-zA-Z]{1,25}"> <br>
            </label>
            <label>
                Login:<br>
                <input type="text" name="login" required pattern="[a-zA-Z]{1,25}"> <br>
            </label>
            <label>
                Password:<br>
                <input type="password" name="password" required pattern="[a-zA-Z0-9]{6,20}"> <br>
            </label>
            <label>
                Confirm password<br>
                <input type="password" name="passwordConfirm" required pattern="[a-zA-Z0-9]{6,20}"> <br>
            </label>
            <input type="submit" valur = "Register">
        </form>
    </td>
    <hr>
    <tr>
        <td>
            <footer align="center">
                @CopyRight
            </footer>
        </td>
    </tr>
</table>
</body>
</html>
