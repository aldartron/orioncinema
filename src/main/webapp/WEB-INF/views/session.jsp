<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="templates/head_body.jsp"/>
    <link rel="stylesheet/less" href="<c:url value="/resources/css/schedule.less"/>"/>
    <link rel="stylesheet/less" href="<c:url value="/resources/css/hall.less"/>"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.2/less.min.js"></script>
    <title>${session.movie.title} - ${session.niceTime}</title>
    <script src ="<c:url value="/resources/js/hall.js"/>"></script>
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

<section class="hall" id="hall">
    <div class="session_info">
        <h4><a href="/movies/${session.movie.placardName}">${session.movie.title}</a></h4>
        <h4><a href="/schedule/date/${session.niceDate}">${session.niceDate}</a></h4>
        <h4>${session.niceTime}</h4>
        <h4>${session.movie.age}+</h4>
        <h4>Выбрано мест: <span id="seat_count">0</span></h4>
        <h4>Стоимость: <span id="cost">0</span></h4>
    </div>
    <div class="hall_panel hall_${session.hall.id}">
        <div class="screen">
            <h4>Э К Р А Н</h4>
        </div>
        <table>

            <tr><c:forEach var="i" begin="0" end="${session.hall.colNumber}">
                <td class="col_label">${i}</td>
            </c:forEach> </tr>

            <c:forEach var="row" varStatus="status" items="${grid}">
                <tr>
                    <td class="row_label">${status.count}</td>
                    <c:forEach var="ticket" items="${row}">
                        <td>
                            <button onclick="select_seat(this)"
                                    price="${ticket.seat.vip ? ticket.session.vipCost : ticket.session.commonCost}}"
                                    sessionId="${session.id}"
                                    seatId="${ticket.seat.id}"
                                    title="Ряд: ${ticket.seat.row}&#013;Место: ${ticket.seat.col}"
                                    class="seat ${ticket.seat.vip ? 'vip' : ''}">
                            </button>
                        </td>
                    </c:forEach>
                    <td class="row_label">${status.count}</td>
                </tr>
            </c:forEach>

            <tr><c:forEach var="i" begin="0" end="${session.hall.colNumber}">
                <td class="col_label">${i}</td>
            </c:forEach> </tr>
        </table>
    </div>
</section>

</body>
<script>
    document.onload = function() {

    }
</script>
</html>