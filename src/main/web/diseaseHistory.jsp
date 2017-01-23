<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diseases</title>
    <link href="css.css" rel="stylesheet" type="text/css"/>
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
        <td>

            <table align="centre" align="center">
                <%--<c:if test="${!empty sessionScope.login}">--%>
                <%--<c:choose>--%>
                <%--<c:when test="${sessionScope.user_role == 'u'}">--%>
                <c:forEach items="${requestScope.historyList}" var="item">
                    <tr>
                    <td><input type="text" value="${item[0]}" align="centre" readonly></td>

                    <td><input type="text" value="${item[1]}" align="centre" readonly></td>

                    <td><input type="text" value="${item[2]}" align="centre" readonly></td>
                    <td><input type="text" value="${item[3]}" align="centre" readonly></td>
                    <td><input type="text" value="${item[4]}" align="centre" readonly></td>
                        <c:if test="${sessionScope.user_role == 'd'}">
                            <td><input type="text" value="${item[5]}" align="centre" readonly></td>
                        </c:if>
                    </tr>
                </c:forEach>
                <%--</c:when>--%>
                <%--</c:choose>--%>
                <%--</c:if>--%>
            </table>
        </td>
    </tr>
    <tr>
        <c:if test="${!empty sessionScope.login}">
            <c:choose>
                <c:when test="${sessionScope.user_role == 'd'}">

                    <h4>To update disease input</h4>
                    <form method="post" action="add_record_s">
                        Patient name: <br>
                        <input type="text" name="uLogin"
                               placeholder="Patient name">
                        Disease name: <br>
                        <input type="text" name="dName"
                               placeholder="Disease name">
                        <br>Hospital begin: <br>
                        <input type="text" name="hBegin"
                               placeholder="Hospital begin"><br>
                        Hospital end:<br>
                        <input type="text" name="hEnd"
                               placeholder="Hospital end"><br>
                        Doctor`s password:<br>
                        <input type="password" name="password" required pattern="[a-zA-Z0-9]{1,20}"
                               placeholder="Password" size="20"><br>
                        <input type="submit" value="Update disease"/>
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
