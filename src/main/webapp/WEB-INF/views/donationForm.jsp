<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="/resources/css/style.css"/>
</head>
<body>
<%@include file="header.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="form-step active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2" class="form-step">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3" class="form-step">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4" class="form-step">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>
    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>
        <form:form action="/donation" method="post" modelAttribute="donation">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="form-step active">
                <h3>Zaznacz co chcesz oddać:</h3>
                <c:forEach items="${categories}" var="category">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <form:radiobutton path="categories" value="${category.id}" data-name="${category.name}"/>
                            <span class="checkbox"></span>
                            <span class="description">${category.name}</span>
                        </label>
                    </div>
                </c:forEach>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>
            <!-- STEP 2 -->
            <div data-step="2" class="form-step">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>
                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
                        <form:input type="number" path="quantity" placeholder="Ilość worków"/>
                    </label>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>
            <!-- STEP 3 -->
            <div data-step="3" class="form-step">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>
                <c:forEach items="${institutions}" var="institution">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <form:radiobutton path="institution" value="${institution.id}"
                                              data-name="${institution.name}"/>
                            <span class="checkbox radio"></span>
                            <span class="description">
                                <div class="title">${institution.name}</div>
                                <div class="subtitle">${institution.description}</div>
                            </span>
                        </label>
                    </div>
                </c:forEach>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>
            <!-- STEP 4 -->
            <div data-step="4" class="form-step">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>
                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres E-mail</h4>
                        <div class="form-group form-group--inline">
                            <label>
                                Email
                                <form:input type="text" path="email"/>
                            </label>
                        </div>
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label>
                                Ulica
                                <form:input type="text" path="street"/>
                            </label>
                        </div>
                        <div class="form-group form-group--inline">
                            <label>
                                Miasto
                                <form:input type="text" path="city"/>
                            </label>
                        </div>
                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy
                                <form:input type="text" path="zipCode"/>
                            </label>
                        </div>
                    </div>
                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label>
                                Data
                                <form:input type="date" path="pickUpDate"/>
                            </label>
                        </div>
                        <div class="form-group form-group--inline">
                            <label>
                                Godzina
                                <form:input type="time" path="pickUpTime"/>
                            </label>
                        </div>
                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <form:textarea name="more_info" path="pickUpComment"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>
            <!-- STEP 5 -->
            <div data-step="5" class="form-step">
                <h3>Podsumowanie Twojej darowizny</h3>
                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span id="summary-quantity" class="summary--text"></span>
                            </li>
                            <li>
                                <span class="icon icon-hand"></span>
                                <span id="summary-institution" class="summary--text"></span>
                            </li>
                        </ul>
                    </div>
                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li id="summary-street"></li>
                                <li id="summary-city"></li>
                                <li id="summary-zipCode"></li>
                                <li id="summary-phone"></li>
                            </ul>
                        </div>
                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li id="summary-pickUpDate"></li>
                                <li id="summary-pickUpTime"></li>
                                <li id="summary-pickUpComment"></li>
                            </ul>
                        </div>
                    </div>
                    <div class="form-group form-group--buttons">
                        <button type="button" class="btn prev-step">Wstecz</button>
                        <button type="submit" class="btn">Potwierdzam</button>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</section>

<%@include file="footer.jsp" %>
<script src="/resources/js/app.js"></script>
</body>
</html>
