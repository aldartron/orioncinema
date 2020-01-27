<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="components/head_body.jsp"/>
    <link rel="stylesheet/less" href="<c:url value="/css/schedule.less"/>"/>
    <link rel="stylesheet/less" href="<c:url value="/css/hall.less"/>"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.2/less.min.js"></script>
    <title>${movieSession.movie.title} - ${movieSession.niceTime}</title>
    <script src ="<c:url value="/js/hall.js"/>"></script>
</head>
<body>

    <jsp:include page="components/header.jsp"/>

    <c:url value="/schedule/day/" var="day_prefix"/>
    <jsp:include page="components/subheader.jsp">
        <jsp:param name="subclass" value=""/>
        <jsp:param name="href_prefix" value="${day_prefix}"/>
    </jsp:include>

<section class="hall" id="hall">
    <div class="session_info">
        <h4 class="movie_title"><a href="<c:url value="/movies/${movieSession.movie.placardName}"/>">${movieSession.movie.title}</a></h4>
        <h4><a href="/schedule/date/${movieSession.niceDate}">${movieSession.niceDate}</a></h4>
        <h4>${movieSession.niceTime}</h4>
        <h4>${movieSession.movie.age}+</h4>
    </div>
    <div class="hall_panel hall_${movieSession.hall.id}">
        <div class="screen">
            <h4>Э К Р А Н</h4>
        </div>
        <div class="table_container hall_${movieSession.hall.id}">
        <table>

            <tr><c:forEach var="i" begin="0" end="${movieSession.hall.colNumber}">
                <td class="col_label">${i}</td>
            </c:forEach> </tr>

            <c:forEach var="row" varStatus="status" items="${grid}">
                <tr>
                    <td class="row_label">${status.count}</td>
                    <c:forEach var="ticket" items="${row}">
                        <td>
                            <button <c:if test="${!busySeats.contains(ticket.seat)}"> onclick="select_seat(this)"</c:if>
                                    price="${ticket.seat.vip ? ticket.movieSession.vipCost : ticket.movieSession.commonCost}"
                                    sessionId="${movieSession.id}"
                                    seatId="${ticket.seat.id}"
                                    title="Ряд: ${ticket.seat.row}&#013;Место: ${ticket.seat.col}"
                                    class="seat ${ticket.seat.vip && movieSession.vipCost != movieSession.commonCost ? 'vip' : ''} ${busySeats.contains(ticket.seat) ? 'busy' : ''}">
                            </button>
                        </td>
                    </c:forEach>
                    <td class="row_label">${status.count}</td>
                </tr>
            </c:forEach>

            <tr><c:forEach var="i" begin="0" end="${movieSession.hall.colNumber}">
                <td class="col_label">${i}</td>
            </c:forEach> </tr>
        </table>
        </div>
    </div>
    <div class="session_info">
        <c:if test="${not empty movieSession.vipCost}">
            <h4><button class="seat vip" disabled></button> - ${movieSession.vipCost} &#8381;</h4>
        </c:if>
        <c:if test="${not empty movieSession.commonCost}">
            <h4><button class="seat" disabled></button> - ${movieSession.commonCost} &#8381;</h4>
        </c:if>
        <h4><button class="seat busy" disabled></button> - занятые места</h4>
        <h4><button class="seat checked" disabled></button> - выбранные места</h4>
        <h4>Выбрано мест: <span id="seat_count">0</span></h4>
        <h4 class="cost">Стоимость: <span id="cost">0</span></h4>
    </div>
    <button class="buy_button" onclick="go()">Приобрести билеты</button>
    <div class="action_info">
        <p>После оплаты вы получите уникальный код,<br/>который необходимо ввести в терминале кассы кинотеатра</p>
    </div>
</section>

    <jsp:include page="components/footer.jsp"/>

</body>


</html>