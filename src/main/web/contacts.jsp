<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contacts</title>
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

    <tr align="centre">
        <td>

            <c:forEach items="${requestScope.mainDoctorList}" var="item">
                <table border = "0">
                    <tr>
                        <input type = "text" value="${item[0]}" readonly>
                        <input type = "text" value="${item[1]}" readonly>
                        <input type = "text" value="${item[2]}" readonly>
                        <input type = "text" value="${item[3]}" readonly>
                        <input type = "text" value="${item[4]}" readonly>
                    </tr>
                </table>
            </c:forEach>
        </td

        <td>
            <table border = "0">
            <tr>Simptoms:</tr>
            <c:forEach items="${requestScope.simptomsList}" var="item">

                    <tr><td>
                        <input type = "text" value="${item[0]}" readonly><td>

                    </tr>

            </c:forEach>
            </table>
        </td>
    </tr>
   <br>
    <br>
    <br>
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
