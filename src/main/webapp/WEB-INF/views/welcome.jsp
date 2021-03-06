<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
        </h2>


        <table border="1">
            <tr>
                <th align="center">Task</th>
                <th align="center">Status</th>
            </tr>
            <c:forEach items="${tasks}" var="task">
                <tr>
                    <td align="center"> ${task.task}</td>
                    <td align="center">${task.status}</td>

                </tr>
            </c:forEach>
        </table>
    </c:if>

    <form name="Task" action="/addtask" method="post">
        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        <p>user_id</p>
        <input title="user_id" type="number" name="user_id">
        <p>task</p>
        <input title="task" type="text" name="task">
        <p>status</p>
        <input title="status" type="number" name="status">
        <input type="submit" value="OK">
    </form>

    <button class="btn btn-lg btn-primary btn-block" type=" ">Add task</button>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>