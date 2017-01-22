<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Doctors</title>
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
                </header><br>
                <hr/>
            </td>
        </tr>
        <tr align="centre">
            <td><c:forEach items="${requestScope.doctorList}" var="item">
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
                    <tr>
                        <input type = "text" value="${item[3]}" align="centre" readonly>
                    </tr>
                    <tr>
                        <c:if test="${!empty sessionScope.login}">
                        <c:choose>
                        <c:when test="${sessionScope.user_role == 'm'}">
                        <input type = "text" value="${item[4]}" align="centre" readonly>
                        </c:when></c:choose>
                        </c:if>


                    </tr>
                </table>
            </td>
            </c:forEach>
            <c:if test="${!empty sessionScope.login}">
                <c:choose>
                    <c:when test="${sessionScope.user_role == 'm'}">

                        <form method="post" action="add_doctor_s">
                            <input type = "text" name="dLogin">
                            <input type = "text" name="dPassword">
                            <input type = "text" name="dName">
                            <input type = "text" name="dSurname">
                            <input type = "text" name="doctorEmail">
                            <input type = "text" name="dSpeciality">
                            <input type = "text" name="password">
                            <input type="submit" name="add doctor"/>
                        </form>
                        <form method="post" action="delete_doctor_s">
                            <input type = "text" name="dLogin">
                            <input type = "text" name="password">
                            <input type="submit" name="add doctor"/>
                        </form>
                    </c:when>
                </c:choose>
            </c:if>
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
