<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../templates/head.jsp">
    <jsp:param name="title" value="${movie.title}"/>
</jsp:include>
<body>

    <jsp:include page="../templates/header.jsp"/>

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
                    <td>${movie.dureatrion} минут</td>
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
            <button class="kp" onclick="window.open('https://www.kinopoisk.ru/film/oderzhimost-2013-725190/', '_blank')">КиноПоиск</button>
        </div>

    <%--End of the booklet    --%>
    </div>

</section>

<jsp:include page="../templates/footer.jsp"/>

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