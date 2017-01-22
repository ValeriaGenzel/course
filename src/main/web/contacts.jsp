<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Contacts</title>
    </head>
    <body>
        <br>
        <table>
            <tr>
                <td>
                    <img src="" width="1110" height="250" alt=""/>
                </td>
                <td bgcolor="">
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
                        <br>
                        <a href="<c:url value="/registration.jsp"/>">Registration</a>
                    </c:if>
                    <br>
                </td>
            </tr>
        </table>
        <table align="center" width="80%" border="0">
            <tr>
                <td>
                    <header class="menu">
                        <table align="center" border="1">
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
                                        <input type="hidden" name="action" value="view_diseases">
                                        <input type="submit" value="Disease"/>
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
                    </header><br>
                    <hr>
                    <hr>
                </td>
            </tr>
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
                </td>
            </tr>
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
