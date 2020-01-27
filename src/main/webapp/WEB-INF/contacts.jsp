<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="components/head_body.jsp"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.2/less.min.js"></script>
    <title>О КИНОТЕАТРЕ</title>
</head>
<body>

<jsp:include page="components/header.jsp"/>

<section class="about">
    <div style="background-color: rgba(10,9,12, 0.82); width: 100%;">
        <div class="container">
            <div style="padding: 24px; padding-bottom: 64px; text-align: center">
                <p>Мы находимся по адресу: <strong style="color: #65743A">ул. Дугласа Адамса, 42</strong> </p>
                <div>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2454.010445688703!2d113.48387651578975!3d52.04312267972672!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x5dca35422c80505f%3A0xec771e5ea40e81fb!2z0YPQuy4g0JPQtdC90LXRgNCw0LvQsCDQkdC10LvQuNC60LAsIDEwLCDQp9C40YLQsCwg0JfQsNCx0LDQudC60LDQu9GM0YHQutC40Lkg0LrRgNCw0LksIDY3MjAwMA!5e0!3m2!1sru!2sru!4v1513571759139" width="100%" height="420" frameborder="0" style="max-width:640px; border: 1px solid #0A090C" allowfullscreen></iframe>
                </div>
                <p>Телефон: <strong style="color: #65743A">+7 (3022) 32-33-42</strong></p>
                <p>Почта для вопросов и предложений: <strong style="color: #65743A">info@orioncinema.ru</strong></p>
            </div>
        </div>
    </div>
</section>

<jsp:include page="components/footer.jsp"/>

</body>
</html>