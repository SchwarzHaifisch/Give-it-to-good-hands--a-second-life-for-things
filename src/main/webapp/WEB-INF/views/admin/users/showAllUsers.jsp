<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<html>
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
<c:if test="${pageContext.request.userPrincipal ne null}">
    <div>
        Witaj, ${pageContext.request.userPrincipal.name}!
    </div>
</c:if>
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
    <li><a href="/admin/admins" class="btn btn--without-border active larger-font">Zarządzaj administratorami</a></li>
    <li><a href="/admin/users" class="btn btn--without-border active larger-font">Zarządzaj użytkownikami</a></li>
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
    <c:forEach var="user" items="${users}">
        <tr class="d-flex">
            <td class="col-1">${user.id}</td>
            <td class="col-3">${user.email}</td>
            <td class="col-3">${user.name}</td>
            <td class="col-3">${user.lastName}</td>
            <td class="col d-flex align-items-center justify-content-left flex-wrap">
                <form action="/admin/users/edit" method="get">
                    <input type="hidden" id="idCon" name="idCon" value="${user.id}"/>
                    <button type="submit" class="btn btn-success rounded-0 text-light m-1 larger-font">Edytuj</button>
                </form>

                <c:if test="${user.enabled == 1}">
                
                <button type="button" class="btn btn-primary rounded-0 text-light m-1 larger-font" data-toggle="modal"
                        data-target="#banModal${user.id}">
                    Ban
                </button>
                <div class="modal fade" id="banModal${user.id}" tabindex="-1" role="dialog"
                     aria-labelledby="banModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="banModalLabel">Potwierdzenie Zbanowania</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Czy na pewno chcesz zbanować tego użytkownika?
                            </div>
                            <div class="modal-footer">
                                <form action="/admin/users/ban" method="get">
                                    <input type="hidden" id="idBan" name="idBan" value="${user.id}"/>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij
                                    </button>
                                    <button type="submit" class="btn btn-danger">Zbanuj</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                </c:if>

                <c:if test="${user.enabled == 0}">

                    <button type="button" class="btn btn-primary rounded-0 text-light m-1 larger-font" data-toggle="modal"
                            data-target="#unBanModal${user.id}">
                        UnBan
                    </button>
                    <div class="modal fade" id="unBanModal${user.id}" tabindex="-1" role="dialog"
                         aria-labelledby="unBanModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="unBanModalLabel">Potwierdzenie Odbanowania</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Czy na pewno chcesz odbanować tego użytkownika?
                                </div>
                                <div class="modal-footer">
                                    <form action="/admin/users/ban" method="post">
                                        <input type="hidden" id="idUban" name="idUban" value="${user.id}"/>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij
                                        </button>
                                        <button type="submit" class="btn btn-danger">Odbanuj</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                

                <button type="button" class="btn btn-danger rounded-0 text-light m-1 larger-font" data-toggle="modal"
                        data-target="#deleteModal${user.id}">
                    Usuń
                </button>
                <div class="modal fade" id="deleteModal${user.id}" tabindex="-1" role="dialog"
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
                                <form action="/admin/users/delete" method="post">
                                    <input type="hidden" id="idDen" name="idDen" value="${user.id}"/>
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