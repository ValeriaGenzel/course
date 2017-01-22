<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
    <c:forEach items="${requestScope.diseaseList}" var="item">
        name: ${item[0]} surname: ${item[1]} spec: ${item[2]}
    </c:forEach>

</body>
</html>
