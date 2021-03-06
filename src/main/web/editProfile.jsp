<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Personal Page</title>
        <link href="css.css" rel="stylesheet" type="text/css" />
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
                        <form method="post" action="personal_page">
                            <input type="submit" value="Personal page">
                        </form>
                        <a href="<c:url value="/diseaseHistory.jsp"/>">Disease history</a>
                    </form>
                </c:if>
                <c:if test="${empty sessionScope.login}">
                    <form method="post" action="login_s">
                        <input type="hidden" name="action" value="in">
                        <input type="submit" value="Login"/>
                    </form>
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
                                    <input type="submit" value="Contacts"/>
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
                </header><br><hr/>
            </td>
        </tr>
        <br>
        <tr><h2>Personal page</h2></tr>
        <tr>
            <c:if test="${!empty sessionScope.login}">

                <form method="post" action="edit_profile_s">
                    Personal information<br>
                    <label>
                        Login :
                        <input type="text" name="login" value="${requestScope.login}" readonly>
                    </label> <br>
                    <label>
                        Name :
                        <input type="text" name="name" value="${requestScope.name}" pattern="[a-zA-Z]{1,25}" >
                    </label> <br>
                    <label>
                        Surname :
                        <input type="text" name="surname" value="${requestScope.surname}" pattern="[a-zA-Z]{1,25}">
                    </label> <br>
                    <label>
                        New Password :
                        <input type="password" name="password" value="${requestScope.password}" pattern="[a-zA-Z0-9]{1,20}" >
                    </label> <br>
                    <label>
                        Confirm Password :
                        <input type="password" name="passwordConfirm" value="${requestScope.password}" pattern="[a-zA-Z0-9]{1,25}">
                        <br>
                    </label> <br>
                    <label>
                        Email :
                        <input type="text" name="email" value="${requestScope.email}" pattern="[a-zA-Z]{1,25}" >
                    </label> <br>
                    <label>
                        Tel :
                        <input type="text" name="tel" value="${requestScope.tel}" >
                    </label> <br>

                    <label>
                        Password :
                        <input type="password" name="passwordOld" required>
                    </label> <br>
                    <input type="submit" value="Update personal info">

                </form>
                <form method="post" action="view_main_doctor">
                    <input type="hidden" name="action" value="view_main_doctor">
                    <input type="submit" value="Contacts"/>
                </form>

            </c:if>
        </tr>
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
