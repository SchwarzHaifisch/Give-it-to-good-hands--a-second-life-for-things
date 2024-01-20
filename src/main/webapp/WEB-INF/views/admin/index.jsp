<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>
<ul class="nav--actions">
    <li><a href="/logout" class="btn btn--small btn--without-border">Wyloguj się</a></li>
</ul>

<ul>
    <li><a href="/admin/main" class="btn btn--without-border active">Start</a></li>
    <li><a href="/admin/institution/institutions" class="btn btn--without-border active">Zarządzaj fundacjami</a></li>
</ul>
<c:if test="${not empty successMessage}">
    <div class="alert alert-success">
            ${successMessage}
    </div>
</c:if>

<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
</body>
</html>
