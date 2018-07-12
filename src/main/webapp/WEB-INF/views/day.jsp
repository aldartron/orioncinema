<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="templates/head_body.jsp"/>
    <link rel="stylesheet/less" href="<c:url value="/resources/css/schedule.less"/>"/>
    <link rel="stylesheet/less" href="<c:url value="/resources/css/hall.less"/>"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.2/less.min.js"></script>
    <title>${helper.getNiceDate(date)}</title>
    <script src ="<c:url value="/resources/js/hall.js"/>"></script>
</head>
<body>

<jsp:include page="templates/header.jsp"/>

<c:url value="/schedule/day/" var="day_prefix"/>
<jsp:include page="templates/subheader.jsp">
    <jsp:param name="class" value="fixed"/>
    <jsp:param name="href_prefix" value="${day_prefix}"/>
</jsp:include>

<section>
    <h1>Расписание на ${niceDate}</h1>
    <div class="wrapper">
        <div class="movie_schedule">
            <%--MOVIE SCHEDULE--%>
            <div class="schedule">
                <c:forEach var="movies" items="${schedule}">
                    <div class="main_line movie_line">
                        <div class="main_line_head">
                            <h3><a href="<c:url value='/movies/${movies.key.placardName}'/>">${movies.key.title}</a></h3>
                            <p>${movies.key.age}+</p>
                        </div>
                        <div class="halls">
                            <c:forEach var="hall" items="${halls}">
                                <div class="hall_line">
                                    <div class="hall_name"><p>${hall.name}</p></div>
                                    <div class="sessions">
                                        <c:forEach var="session" items="${movies.value}">
                                            <c:if test="${session.hall.id == hall.id}">
                                                <div class="session ${session.datetime.after(now) ? '' : 'disabled'}" style="
                                                        width: ${session.movie.duration/11.4}%;
                                                        left: ${(session.datetime.minutes+((session.datetime.hours == 0 ? 24 : session.datetime.hours)-8)*60-30)/11.4}%;
                                                        ">
                                                    <a href="<c:url value="/schedule/session/${session.id}"/>">
                                                        <p>${session.niceTime}</p>
                                                        <small>${session.commonCost}<c:if test="${session.commonCost != session.vipCost}"> - ${session.vipCost}</c:if> &#8381;</small>
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

<script>
    var isCalendarOpened = false;

    go_calendar = function() {
        var panel = document.getElementById("calendar_panel");
        var button = document.getElementById("calendar_button");
        panel.setAttribute(
            "style","left: " + (button.getBoundingClientRect().left - 150 + 19 + 66) + "px; " +
            "top: " + document.getElementById("subheader_fixed").clientHeight +"px"
        );

        if (!isCalendarOpened) {
            isCalendarOpened = true;
            button.classList.add("active");
            panel.classList.add("enabled");
        } else {
            isCalendarOpened = false;
            button.classList.remove("active");
            panel.classList.remove("enabled");
        }
    };
</script>
</body>
</html>
