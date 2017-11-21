<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="templates/head_body.jsp"/>
        <link rel="stylesheet/less" href="<c:url value="/resources/css/schedule.less"/>"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.2/less.min.js"></script>
        <title>${movie.title}</title>
    </head>
    <body>

    <jsp:include page="templates/header.jsp"/>

    <c:url value="/schedule/day/" var="day_prefix"/>
    <jsp:include page="templates/subheader.jsp">
        <jsp:param name="subclass" value="fixed"/>
        <jsp:param name="href_prefix" value="${day_prefix}"/>
    </jsp:include>

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

    <div class="wrapper">
    <div class="movie_schedule">
        <%--MOVIE SCHEDULE--%>
        <div class="schedule">
            <c:forEach var="days" items="${schedule}">
                <div class="main_line">
                    <div class="main_line_head">
                        <h3><a href="<c:url value='/schedule/day/${days.key.dateLine}'/>">${days.key.niceDate}</a></h3>
                        <p>${days.key.dayOfWeek}</p>
                    </div>
                    <div class="halls">
                        <c:forEach var="hall" items="${halls}">
                            <div class="hall_line">
                                <div class="hall_name"><p>${hall.name}</p></div>
                                <div class="sessions">
                                    <%--<c:if test="${days.key.calendar.time.month == now.month and days.key.calendar.time.day == now.day}">--%>
                                        <%--<div class="pointer" style="--%>
                                                <%--left: ${(now.minutes+((now.hours == 0 ? 24 : now.hours)-8)*60-30)/11.4}%;--%>
                                                <%--"></div>--%>
                                    <%--</c:if>--%>
                                    <c:forEach var="session" items="${days.value}">
                                        <c:if test="${session.hall.id == hall.id}">
                                            <%--TODO: Manage this shit--%>
                                            <div class="session ${session.datetime.after(now) ? '' : 'disabled'}" style="
                                                    width: ${session.movie.duration/11.4}%;
                                                    left: ${(session.datetime.minutes+((session.datetime.hours == 0 ? 24 : session.datetime.hours)-8)*60-30)/11.4}%;
                                                    ">
                                                <a href="<c:url value="/schedule/session/${session.id}"/>">
                                                    <p>${session.niceTime}</p>
                                                    <small>${session.commonCost} - ${session.vipCost} &#8381;</small>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
        </div>

        <%--END OF MOVIE SCHEDULE--%>
    </div>
    </div>

</section>

<jsp:include page="templates/footer.jsp"/>

    <%--TRAILER --%>

    <div id="frame" style="display: none" onclick="close_frame()">
        <%--<iframe id="youtube" height="480" width="854" src="https://www.youtube.com/embed/gCcx85zbxz4?rel=0&amp;showinfo=0&enablejsapi=1" frameborder="0" allowfullscreen></iframe>--%>
        <div id="youtube"></div>
    </div>

    <script src="//www.youtube.com/player_api"></script>
    <script src="<c:url value="/resources/js/player.js"/>"></script>
    <script>
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