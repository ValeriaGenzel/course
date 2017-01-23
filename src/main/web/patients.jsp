<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patients</title>
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
            <hr>
        </td>
    </tr>
    <br>
    <tr>
        <c:if test="${!empty sessionScope.login}">
            <c:choose>
                <c:when test="${sessionScope.user_role == 'm'}">
                    <c:forEach items="${requestScope.patientList}" var="item">
                        <input type = "text" value="${item[0]}" align="centre" readonly>
                        <input type = "text" value="${item[1]}" align="centre" readonly>
                        <input type = "text" value="${item[2]}" align="centre" readonly>
                        <input type = "text" value="${item[3]}" align="centre" readonly>
                        <input type = "text" value="${item[4]}" align="centre" readonly>

                    </c:forEach>
                    <form method="post" action="ban_s">

                        <input type = "text" name="uLogin">
                        <input type = "text" name="password">
                        <input type="submit" name="ban user"/>
                    </form>
                    <form method="post" action="unban_s">

                        <input type = "text" name="uLogin">
                        <input type = "text" name="password">
                        <input type="submit" name="unban user"/>
                    </form>
                </c:when></c:choose>
        </c:if>

    </tr>
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
