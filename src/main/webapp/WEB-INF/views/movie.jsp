<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="templates/head_body.jsp"/>
        <title>${movie.title}}</title>
    </head>
<body>

    <jsp:include page="templates/header.jsp"/>
    <nav class="subheader" id="subheader_fixed">
        <div class="">
            <div class="content">
                <a class="nav-link" href="<c:url value="/"/>">Сегодня</a>
            </div>
        </div>
        <div class="">
            <div class="content">
                <a class="nav-link" href="?day=${days.get(1).getDateLine()}">Завтра</a>
            </div>
        </div>

        <c:forEach var="i" begin="2" end="${days.size()-1}">
            <div class="">
                <div class="content">
                    <a class="nav-link" href="?day=${days.get(i).getDateLine()}">${days.get(i).getDayOfWeek()} <sup>${days.get(i).getDay()}</sup></a>
                </div>
            </div>
        </c:forEach>
    </nav>

<section class="movie">


    <div class="booklet">
        <img src="<c:url value="/resources/images/movies/posters/${movie.placardName}-poster.jpg"/>">
        <div class="movie_info">
            <h2>${movie.title}</h2>
            <em>${movie.originalTitle}</em>
            <hr>
            <table>
                <tr>
                    <td>Год</td>
                    <td>${movie.year}</td>
                </tr>
                <tr>
                    <td>Страна</td>
                    <td>${movie.country}</td>
                </tr>
                <tr>
                    <td>Режиссер</td>
                    <td>${movie.director}</td>
                </tr>
                <tr>
                    <td>В ролях</td>
                    <td>${movie.cast}</td>
                </tr>
                <tr>
                    <td>Жанр</td>
                    <td>${movie.genre}</td>
                </tr>
                <tr>
                    <td>Возраст</td>
                    <td>${movie.age}+</td>
                </tr>
                <tr>
                    <td>Длительность</td>
                    <td>${movie.duration} минут</td>
                </tr>
                <tr>
                    <td>В прокате</td>
                    <td>с ${movie.getNiceStartDate()} по ${movie.getNiceEndDate()}</td>
                </tr>
            </table>
        </div>
        <div class="movie_additional_info">
            <p>${movie.annotation}</p>
            <button class="trailer" id="trailer" onclick="go_trailer()">Смотреть трейлер</button>
            <button class="kp" onclick="window.open('https://www.kinopoisk.ru/film/${movie.kinopoiskName}/', '_blank')">КиноПоиск</button>
        </div>

    <%--End of the booklet    --%>
    </div>

    <div class="movie_schedule">
        <%--MOVIE SCHEDULE--%>
        <table>
            <c:forEach var="days" items="${schedule}">
                <tr>
                <td>
                        ${days.key}
                </td>
                <td>
                    <table>
                        <c:forEach var="hall" items="${halls}">
                            <tr>
                                <td>${hall.name}</td>
                                <td>
                                    <c:forEach var="session" items="${days.value}">
                                        <c:if test="${session.hall.id == hall.id}">
                                            ${session.niceTime}
                                        </c:if>
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </td>
                </tr>
            </c:forEach>
        </table>

        <%--END OF MOVIE SCHEDULE--%>
    </div>

</section>

<jsp:include page="templates/footer.jsp"/>

    <%--TRAILER --%>

    <div id="frame" style="display: none" onclick="close_frame()">
        <%--<iframe id="youtube" height="480" width="854" src="https://www.youtube.com/embed/gCcx85zbxz4?rel=0&amp;showinfo=0&enablejsapi=1" frameborder="0" allowfullscreen></iframe>--%>
        <div id="youtube"></div>
    </div>

    <script src="//www.youtube.com/player_api"></script>
    <script>
       var play;
       function onYouTubePlayerAPIReady() {
           play = new YT.Player('youtube', {
               videoId: '${movie.trailerLink}',
               height: 480,
               width: 854,
               playerVars: {'showinfo' : 0, 'rel' : 0}
           });
       }
    </script>


</body>
</html>