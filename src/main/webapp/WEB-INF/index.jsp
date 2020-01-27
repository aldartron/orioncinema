<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>

<head>
    <jsp:include page="components/head_body.jsp"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.2/less.min.js"></script>

    <title>Кинотеатр ОРИОН</title>
</head>

<body>
    <jsp:include page="components/header.jsp"/>

<section class="main">
  <div class="face" id="face">
    <div class="face-info">
      <p>ул. Дугласа Адамса, 42</p>
    </div>
    <div class="face-brand">
      <div class="container">
        <h1>О Р И О Н</h1>
        <hr>
        <h3>ТВОЙ КИНОТЕАТР</h3>
      </div>
    </div>
    <div class="face-info">
      <p>info@orioncinema.ru</p>
      <p>+7 (3022) 32-33-42</p>
    </div>
  </div>

    <jsp:include page="components/subheader.jsp">
        <jsp:param name="href_prefix" value="?day="/>
    </jsp:include>

  <div class="board row justify-content-around" id="board">
    <div class="flex-container col-md-10 col-lg-10 col-sm-12 col-xs-12">

        <c:forEach var="movie" items="${movies}">

            <div class="placard <c:if test="${movie.high}">high-prior</c:if>"
                 style="background-image: url('<c:url value="images/movies/${movie.placardName}.jpg"/>')">
                <a href="<c:url value="/movies/${movie.placardName}"/>">
                    <div class="caption">
                        <small>${movie.getNiceStartDate()} - ${movie.getNiceEndDate()}</small>
                        <h4>${movie.title}</h4>
                    </div>
                </a>
            </div>

        </c:forEach>

    </div>
  </div>
</section>

    <jsp:include page="components/footer.jsp"/>

</body>
</html>