<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Rejestracja</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<%@include file="header.jsp" %>

<section class="login-page">
    <form:form action="${pageContext.request.contextPath}/register" method="POST" modelAttribute="user">
        <div class="form-group">
            <input type="text" name="name" placeholder="Imię"/>
            <form:errors path="name" cssClass="error"/>
        </div>
        <div class="form-group">
            <input type="text" name="lastName" placeholder="Nazwisko"/>
            <form:errors path="lastName" cssClass="error"/>
        </div>
        <div class="form-group">
            <input type="email" name="email" placeholder="Email"/>
            <form:errors path="email" cssClass="error"/>
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło"/>
            <form:errors path="password" cssClass="error"/>
        </div>
        <div class="form-group">
            <input type="password" name="confirmPassword" placeholder="Powtórz hasło"/>
        </div>
        <div class="form-group form-group--buttons">
            <a href="${pageContext.request.contextPath}/login" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>
