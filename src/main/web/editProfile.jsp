<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Personal Page</title>
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
    <c:if test="${!empty sessionScope.login}">

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
            <label>
            Confirm Password :
                <input type="password" name="password" value="${requestScope.passwordConfirm}" >
             <br>
            </label> <br>
            <label>
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
