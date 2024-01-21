<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .form-section {
            font-size: 20px;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
<c:if test="${not empty errMessage}">
    <div class="error">
            ${errMessage}
    </div>
</c:if>
<section class="form-section">
    <form:form action="/admin/users/edit" method="post" modelAttribute="user">
        <form:hidden path="id" id="id" class="form-control" placeholder="${user.id}" required="required"/>

        <label for="name">Imię:</label>
        <form:errors path="name" cssClass="error" />
        <form:input path="name" id="name" class="form-control" placeholder="${user.name}" required="required"/>

        <label for="lastName">Nazwisko:</label>
        <form:errors path="lastName" cssClass="error" />
        <form:input path="lastName" id="lastName" class="form-control" placeholder="${user.lastName}" required="required"/>

        <label for="email">Email:</label>
        <form:input path="email" id="email" class="form-control" placeholder="${user.email}" readonly="true"/>

        <label for="password">Hasło:</label>
        <form:errors path="password" cssClass="error" />
        <form:input path="password" id="password" class="form-control" placeholder="${user.password}" required="required"/>

        <label for="passwordRep">Powtórz hasło:</label>
        <form:errors path="passwordRep" cssClass="error" />
        <form:input path="passwordRep" id="passwordRep" class="form-control" placeholder="${user.passwordRep}" required="required"/>

        <button type="submit" class="btn btn-primary">Dodaj</button>
    </form:form>
</section>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
</body>
</html>
