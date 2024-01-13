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
<%@include file="header.jsp"%>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>
    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>
        <form:form action="/donation" method="post" modelAttribute="donation">
        <!-- STEP 1: class .active is switching steps -->
        <div data-step="1" class="active">
            <h3>Zaznacz co chcesz oddać:</h3>
            <c:forEach items="${categories}" var="category">
                <div class="form-group form-group--checkbox">
                    <label>
                        <form:radiobutton path="categories" value="${category.id}" data-name="${category.name}"/>
                            <%--                            <form:checkbox path="categories" value="${category.id}" data-name="${category.name}"/>--%>
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
        <div data-step="2">
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
        <div data-step="3">
            <h3>Wybierz organizacje, której chcesz pomóc:</h3>
            <c:forEach items="${institutions}" var="institution">
                <div class="form-group form-group--checkbox">
                    <label>
                        <form:radiobutton path="institution" value="${institution.id}" data-name="${institution.name}"/>
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
        <div data-step="4">
            <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>
            <div class="form-section form-section--columns">
                <div class="form-section--column">
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
        <div data-step="5">
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
    </div>
    </form:form>
</section>

<%@include file="footer.jsp"%>

<script>
    // document.addEventListener("DOMContentLoaded", function() {
    //
    //   /**
    //    * Form Select
    //    */
    //   class FormSelect {
    //     // ... (bez zmian)
    //   }
    //
    //   document.querySelectorAll(".form-group--dropdown select").forEach(el => {
    //     new FormSelect(el);
    //   });
    //
    //   /**
    //    * Hide elements when clicked on document
    //    */
    //   document.addEventListener("click", function(e) {
    //     // ... (bez zmian)
    //   });
    //
    //   /**
    //    * Switching between form steps
    //    */
    //   class FormSteps {
    //     constructor(form) {
    //       this.$form = form;
    //       this.$next = form.querySelectorAll(".next-step");
    //       this.$prev = form.querySelectorAll(".prev-step");
    //       this.$step = form.querySelector(".form--steps-counter span");
    //       this.currentStep = 1;
    //
    //       this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
    //       const $stepForms = form.querySelectorAll("form > div");
    //       this.slides = [...this.$stepInstructions, ...$stepForms];
    //
    //       this.init();
    //     }
    //
    //     /**
    //      * Init all methods
    //      */
    //     init() {
    //       this.events();
    //       this.updateForm();
    //     }
    //
    //     /**
    //      * All events that are happening in form
    //      */
    //     events() {
    //       // Next step
    //       this.$next.forEach(btn => {
    //         btn.addEventListener("click", e => {
    //           e.preventDefault();
    //           this.currentStep++;
    //           this.updateForm();
    //         });
    //       });
    //
    //       // Previous step
    //       this.$prev.forEach(btn => {
    //         btn.addEventListener("click", e => {
    //           e.preventDefault();
    //           this.currentStep--;
    //           this.updateForm();
    //         });
    //       });
    //
    //       // Form submit
    //       this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
    //     }
    //
    //     /**
    //      * Update form front-end
    //      * Show next or previous section etc.
    //      */
    //     updateForm() {
    //       this.$step.innerText = this.currentStep;
    //
    //       // TODO: Validation
    //
    //       this.slides.forEach(slide => {
    //         slide.classList.remove("active");
    //
    //         if (slide.dataset.step == this.currentStep) {
    //           slide.classList.add("active");
    //         }
    //       });
    //
    //       this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 5;
    //       this.$step.parentElement.hidden = this.currentStep >= 5;
    //
    //       // TODO: get data from inputs and show them in summary
    //     }
    //
    //     // TODO: Define the submit method
    //     submit(e) {
    //       // Implement your form submission logic here
    //     }
    //   }
    //
    //   const form = document.querySelector(".form--steps");
    //   if (form !== null) {
    //     new FormSteps(form);
    //   }
    // });
    document.addEventListener("DOMContentLoaded", function() {

        /**
         * Form Select
         */
        class FormSelect {
            constructor($el) {
                this.$el = $el;
                this.options = [...$el.children];
                this.init();
            }

            init() {
                this.createElements();
                this.addEvents();
                this.$el.parentElement.removeChild(this.$el);
            }

            createElements() {
                // Input for value
                this.valueInput = document.createElement("input");
                this.valueInput.type = "text";
                this.valueInput.name = this.$el.name;

                // Dropdown container
                this.dropdown = document.createElement("div");
                this.dropdown.classList.add("dropdown");

                // List container
                this.ul = document.createElement("ul");

                // All list options
                this.options.forEach((el, i) => {
                    const li = document.createElement("li");
                    li.dataset.value = el.value;
                    li.innerText = el.innerText;

                    if (i === 0) {
                        // First clickable option
                        this.current = document.createElement("div");
                        this.current.innerText = el.innerText;
                        this.dropdown.appendChild(this.current);
                        this.valueInput.value = el.value;
                        li.classList.add("selected");
                    }

                    this.ul.appendChild(li);
                });

                this.dropdown.appendChild(this.ul);
                this.dropdown.appendChild(this.valueInput);
                this.$el.parentElement.appendChild(this.dropdown);
            }

            addEvents() {
                this.dropdown.addEventListener("click", e => {
                    const target = e.target;
                    this.dropdown.classList.toggle("selecting");

                    // Save new value only when clicked on li
                    if (target.tagName === "LI") {
                        this.valueInput.value = target.dataset.value;
                        this.current.innerText = target.innerText;
                    }
                });
            }
        }
        document.querySelectorAll(".form-group--dropdown select").forEach(el => {
            new FormSelect(el);
        });

        /**
         * Hide elements when clicked on document
         */
        document.addEventListener("click", function(e) {
            const target = e.target;
            const tagName = target.tagName;

            if (target.classList.contains("dropdown")) return false;

            if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
                return false;
            }

            if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
                return false;
            }

            document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el => {
                el.classList.remove("selecting");
            });
        });

        /**
         * Switching between form steps
         */
        class FormSteps {
            constructor(form) {
                this.$form = form;
                this.$next = form.querySelectorAll(".next-step");
                this.$prev = form.querySelectorAll(".prev-step");
                this.$step = form.querySelector(".form--steps-counter span");
                this.currentStep = 1;

                this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
                const $stepForms = form.querySelectorAll("form > div");
                this.slides = [...this.$stepInstructions, ...$stepForms];

                this.init();
            }

            /**
             * Init all methods
             */
            init() {
                this.events();
                this.updateForm();
            }

            /**
             * All events that are happening in form
             */
            events() {
                // Next step
                this.$next.forEach(btn => {
                    btn.addEventListener("click", e => {
                        e.preventDefault();
                        this.currentStep++;
                        this.updateForm();
                    });
                });

                // Previous step
                this.$prev.forEach(btn => {
                    btn.addEventListener("click", e => {
                        e.preventDefault();
                        this.currentStep--;
                        this.updateForm();
                    });
                });

                // Form submit
                this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
            }

            /**
             * Update form front-end
             * Show next or previous section etc.
             */
            updateForm() {
                this.$step.innerText = this.currentStep;

                this.slides.forEach(slide => {
                    slide.classList.remove("active");

                    if (slide.dataset.step == this.currentStep) {
                        slide.classList.add("active");
                    }
                });

                this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 5;
                this.$step.parentElement.hidden = this.currentStep >= 5;

                if (this.currentStep === 5) {
                    const categories = Array.from(document.querySelectorAll('input[name="categories"]:checked')).map(input => input.dataset.name);
                    const quantity = document.querySelector('input[name="quantity"]').value;
                    const institution = document.querySelector('input[name="institution"]:checked').dataset.name;
                    const street = document.querySelector('input[name="street"]').value;
                    const city = document.querySelector('input[name="city"]').value;
                    const zipCode = document.querySelector('input[name="zipCode"]').value;
                    const pickUpDate = document.querySelector('input[name="pickUpDate"]').value;
                    const pickUpTime = document.querySelector('input[name="pickUpTime"]').value;
                    const pickUpComment = document.querySelector('textarea[name="pickUpComment"]').value;

                    document.querySelector('#summary-quantity').innerText = `${quantity} worków: ${categories.join(', ')}`;
                    document.querySelector('#summary-institution').innerText = institution;

                    document.querySelector('#summary-street').innerText = street;
                    document.querySelector('#summary-city').innerText = city;
                    document.querySelector('#summary-zipCode').innerText = zipCode;

                    document.querySelector('#summary-pickUpDate').innerText = pickUpDate;
                    document.querySelector('#summary-pickUpTime').innerText = pickUpTime;
                    document.querySelector('#summary-pickUpComment').innerText = pickUpComment;
                }
            }

        }
        const form = document.querySelector(".form--steps");
        if (form !== null) {
            new FormSteps(form);
        }
    });
</script>
</body>
</html>