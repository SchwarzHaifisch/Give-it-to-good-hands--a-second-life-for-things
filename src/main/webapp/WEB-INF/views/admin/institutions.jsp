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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .larger-font {
            font-size: 18px;
        }
    </style>
</head>
<body>
<ul class="nav--actions">
    <li><a href="/logout" class="btn btn--small btn--without-border larger-font">Wyloguj się</a></li>
</ul>

<ul>
    <li><a href="/admin/main" class="btn btn--without-border active larger-font">Start</a></li>
    <li><a href="/admin/institutions" class="btn btn--without-border active larger-font">Zarządzaj fundacjami</a></li>
</ul>
<table class="table border-bottom w-100 larger-font">
    <thead>
    <tr class="d-flex">
        <th class="col">ID</th>
        <th class="col">Nazwa</th>
        <th class="col">Opis</th>
        <th class="col">Akcje</th>
    </tr>
    </thead>
    <tbody class="text-color-lighter">
    <c:forEach var="institution" items="${Institutions}">
        <tr class="d-flex">
            <td class="col">${institution.id}</td>
            <td class="col">${institution.name}</td>
            <td class="col">${institution.description}</td>
            <td class="col d-flex align-items-center justify-content-center flex-wrap">
                <form action="/" method="post">
                    <input type="hidden" id="idCon" name="idCon" value="${institution.id}"/>
                    <button type="submit" class="btn btn-success rounded-0 text-light m-1 larger-font">Edytuj</button>
                </form>
                <form action="/" method="post">
                    <input type="hidden" id="idDen" name="idDen" value="${institution.id}"/>
                    <button type="submit" class="btn btn-danger rounded-0 text-light m-1 larger-font">Usuń</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- Dodaj Bootstrap JS (jeśli jest potrzebne) -->
<%--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
</body>
</html>
