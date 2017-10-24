<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Orion Cinema</title>
  <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
  <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-grid.min.css"/>"/>
  <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
  <script src="<c:url value="/resources/js/face.js"/>"></script>
  <link rel="stylesheet/less" href="<c:url value="/resources/css/master.less"/>"/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.2/less.min.js"></script>
</head>
<body>

<header>
  <nav class="nav-fixed" id="fixed">

    <div class="navigation">
      <a class="brand" href="#">ОРИОН</a>
      <a href="#">О КИНОТЕАТРЕ</a>
      <a href="#">СЕАНСЫ</a>
      <a href="#">ГАЛЛЕРЕЯ</a>
      <a href="#">КОНТАКТЫ</a>
    </div>

    <div class="social">
      <a id="vk" href="#"><div></div></a>
      <a id="fb" href="#"><div></div></a>
      <a id="ok" href="#"><div></div></a>
      <a id="tw" href="#"><div></div></a>
      <a id="ig" href="#"><div></div></a>
    </div>

  </nav>
</header>
<section class="main">
  <div class="face" id="face">
    <div class="face-info">
      <p>ул. Дугласа Адамса, 42</p>
    </div>
    <div class="face-brand">
      <div class="container">
        <h1>О Р И О Н</h1>
        <hr>
        <h3>КИНОТЕАТР БУДУЩЕГО</h3>
      </div>
    </div>
    <div class="face-info">
      <p>info@orioncinema.ru</p>
      <p>+7 (3022) 32-33-42</p>
    </div>
  </div>
  <nav class="nav-sticky" id="sticky">
      <div class="<c:if test="${currentDay.equals(days.get(0).getDateLine())}">active</c:if>">
          <div class="content">
              <a class="nav-link" href="<c:url value="/"/>">Сегодня</a>
          </div>
      </div>
      <div class="<c:if test="${currentDay.equals(days.get(1).getDateLine())}">active</c:if>">
          <div class="content">
              <a class="nav-link" href="?day=${days.get(1).getDateLine()}">Завтра</a>
          </div>
      </div>

      <c:forEach var="i" begin="2" end="${days.size()-1}">

          <div class="<c:if test="${currentDay.equals(days.get(i).getDateLine())}">active</c:if>">
              <div class="content">
                  <a class="nav-link" href="?day=${days.get(i).getDateLine()}">${days.get(i).getDayOfWeek()} <sup>${days.get(i).getDay()}</sup></a>
              </div>
          </div>

      </c:forEach>

  </nav>
  <div class="board row justify-content-around" id="board">
    <div class="flex-container col-md-10 col-lg-10 col-sm-12 col-xs-12">

        <c:forEach var="movie" items="${movies}">

            <div class="placard <c:if test="${movie.high}">high-prior</c:if>" style="background-image: url('<c:url value="/placards/${movie.placardName}.jpg"/>')">
                <a href="#">
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
<footer>
  <div class="row justify-content-around">
    <div class="col col-md-4">
      <p>ул. Дугласа Адамса, 42</p>
      <p>Бронирование билетов по телефону: +7 (3022) 32-33-42</p>
      <p>Вопросы и предложения присылайте на почту: info@orioncinema.ru</p>
    </div>
    <div class="col col-md-4">
      <p>Разработка и сопровождение сайта: aldartron@retrowave.ru</p>
      <p>Права никак не защищены</p>
      <p>Чита 10.2017</p>
    </div>
  </div>
</footer>
</body>
</html>