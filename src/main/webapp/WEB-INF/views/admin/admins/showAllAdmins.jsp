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
<c:if test="${not empty successMessage}">
    <div class="alert alert-success">
            ${successMessage}
    </div>
</c:if>
<ul class="nav--actions">
    <li><a href="/logout" class="btn btn--small btn--without-border larger-font">Wyloguj się</a></li>
</ul>

<ul>
    <li><a href="/admin/main" class="btn btn--without-border active larger-font">Start</a></li>
    <li><a href="/admin/institution/institutions" class="btn btn--without-border active larger-font">Zarządzaj
        fundacjami</a></li>
    <li><a href="/admin/admins" class="btn btn--without-border active larger-font">Zarządzaj
        administratorami</a></li>
    <li><a href="/admin/admins/add" class="btn btn--without-border active larger-font">Dodaj administratora</a></li>
</ul>
<table class="table border-bottom w-100 larger-font">
    <thead>
    <tr class="d-flex">
        <th class="col-1">ID</th>
        <th class="col-3">Email</th>
        <th class="col-3">Imię</th>
        <th class="col-3">Nazwisko</th>
        <th class="col">Akcje</th>
    </tr>
    </thead>
    <tbody class="text-color-lighter">
    <c:forEach var="admin" items="${admins}">
        <tr class="d-flex">
            <td class="col-1">${admin.id}</td>
            <td class="col-3">${admin.email}</td>
            <td class="col-3">${admin.name}</td>
            <td class="col-3">${admin.lastName}</td>
            <td class="col d-flex align-items-center justify-content-left flex-wrap">
                <form action="/admin/admins/edit" method="get">
                    <input type="hidden" id="idCon" name="idCon" value="${admin.id}"/>
                    <button type="submit" class="btn btn-success rounded-0 text-light m-1 larger-font">Edytuj</button>
                </form>
                <button type="button" class="btn btn-danger rounded-0 text-light m-1 larger-font" data-toggle="modal"
                        data-target="#deleteModal${admin.id}">
                    Usuń
                </button>
                <div class="modal fade" id="deleteModal${admin.id}" tabindex="-1" role="dialog"
                     aria-labelledby="deleteModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteModalLabel">Potwierdzenie Usunięcia</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Czy na pewno chcesz usunąć ten element?
                            </div>
                            <div class="modal-footer">
                                <form action="/admin/admins/delete" method="post">
                                    <input type="hidden" id="idDen" name="idDen" value="${admin.id}"/>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij
                                    </button>
                                    <button type="submit" class="btn btn-danger">Usuń</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
