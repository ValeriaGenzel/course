<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diseases</title>
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


                    <table align="centre" align="center">
                      <tr>  <input type="text" value="Disease" align="centre" readonly size="30">
                        <input type="text" value="Simptom" align="centre" readonly size="30">
                        <input type="text" value="Description" align="centre" readonly size="80"></tr><br>
                        <c:forEach items="${requestScope.diseaseList}" var="item">
                            <tr><input type="text" value="${item[0]}" align="centre" readonly size="30"></tr>

                            <tr><input type="text" value="${item[1]}" align="centre" readonly size="30"></tr>

                            <tr><input type="text" value="${item[2]}" align="centre" readonly size="80"></tr>

                        </c:forEach>
                    </table>

            </tr>
            <tr>
                <c:if test="${!empty sessionScope.login}">
                    <c:choose>
                        <c:when test="${sessionScope.user_role == 'd'}">
                            <h4>To add new disease input</h4>
                            <form method="post" action="add_disease_s">
                                Disease name: <br>
                                <input type="text" name="dName" required pattern="[a-zA-Z]{1,30}"
                                       placeholder="Disease name" size="30"><br>
                                Simptom name:<br>
                                <input type="text" name="sName" required pattern="[a-zA-Z]{1,30}"
                                       placeholder="Simptom name" size="30"><br>
                                Disease description:<br>
                                <input type="text" name="desc" pattern="[a-zA-Z0-9]{1,80}"
                                       placeholder="Disease description" 80><br>
                                Doctor`s password:<br>
                                <input type="text" name="password" required pattern="[a-zA-Z0-9]{1,20}"
                                       placeholder="Password" size="20"><br>
                                <input type="submit" name="add disease" value="Add disease"/>
                            </form>
                            <h4>To update disease input</h4>
                            <form method="post" action="update_disease_s">
                                Disease name: <br>
                                <input type="text" name="dName" required pattern="[a-zA-Z]{1,30}"
                                   placeholder="Disease name" size="30"><br>
                            Disease description:<br>
                            <input type="text" name="desc" pattern="[a-zA-Z0-9]{1,80}"
                                   placeholder="Disease description" size="30"><br>
                            Doctor`s password:<br>
                            <input type="text" name="password" required pattern="[a-zA-Z0-9]{1,20}"
                                   placeholder="Password" size="20"><br>
                            <input type="submit" name="update disease" value="Update disease"/>
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
