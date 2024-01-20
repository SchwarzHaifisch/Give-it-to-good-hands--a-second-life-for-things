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
    </style>
</head>
<body>
<section class="form-section">
    <form:form action="/admin/institution/edit" method="post" modelAttribute="institution">
        <label for="name">Nazwa:</label>
        <form:input path="name" id="name" class="form-control" placeholder="Nazwa Instytucji" required="required"/>
        <label for="description">Opis:</label>
        <form:input path="description" id="description" class="form-control" placeholder="Opis Instytucji"
                    required="required"/>
        <button type="submit" class="btn btn-primary">Dodaj</button>
    </form:form>
</section>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
</body>
</html>
