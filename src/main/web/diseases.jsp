<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
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
                    <a href="<c:url value="/editProfile.jsp"/>">Personal page</a>
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
        <c:forEach items="${requestScope.diseaseList}" var="item">
            <table align="centre">
                <tr>
                    <input type = "text" value="${item[0]}" align="centre" readonly>
                </tr>
                <tr>
                    <input type = "text" value="${item[1]}" align="centre" readonly>
                </tr>
                <tr>
                    <input type = "text" value="${item[2]}" align="centre" readonly>
                </tr>

            </table>
        </c:forEach>
    </tr>
    <tr>
        <c:if test="${!empty sessionScope.login}">
            <c:choose>
                <c:when test="${sessionScope.user_role == 'd'}">

                    <form method="post" action="add_disease_s">

                        <input type = "text" name="dName">
                        <input type = "text" name="sName">
                        <input type = "text" name="desc">
                        <input type = "text" name="password">
                        <input type="submit" name="add disease"/>
                    </form>

                    <form method="post" action="update_disease_s">

                        <input type = "text" name="dName">
                        <input type = "text" name="desc">
                        <input type = "text" name="password">
                        <input type="submit" name="update disease"/>
                    </form>


                </c:when>
            </c:choose>
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
