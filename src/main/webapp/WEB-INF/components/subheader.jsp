<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="subheader ${param.subclass}" id="subheader">

    <%--ВСЕ ДНИ--%>
    <c:if test="${not empty movies}">
        <div class="<c:if test="${empty currentDay}">active</c:if>">
            <div class="content">
                <a class="nav-link" href="<c:url value="/"/>">Все дни</a>
            </div>
        </div>
    </c:if>

    <div class="<c:if test="${currentDay.equals(days.get(0).getDateLine())}">active</c:if>">
        <div class="content">
            <a class="nav-link" href="${param.href_prefix}${days.get(0).getDateLine()}">Сегодня</a>
        </div>
    </div>
    <div class="<c:if test="${currentDay.equals(days.get(1).getDateLine())}">active</c:if>">
        <div class="content">
            <a class="nav-link" href="${param.href_prefix}${days.get(1).getDateLine()}">Завтра</a>
        </div>
    </div>

    <c:forEach var="i" begin="2" end="6">

        <div class="<c:if test="${currentDay.equals(days.get(i).getDateLine())}">active</c:if>">
            <div class="content">
                <a class="nav-link" href="${param.href_prefix}${days.get(i).getDateLine()}">${days.get(i).getDayOfWeek()} <sup>${days.get(i).getDay()}</sup></a>
            </div>
        </div>

    </c:forEach>

    <div id="calendar">
        <div class="content">
            <button id="calendar_button" onclick="go_calendar()">
                <span style="color: #EEF0F2; font-size: 1.2em">▥</span>
            </button>
        </div>
    </div>
    <div id="calendar_panel">
        <c:forEach var="i" begin="7" end="${days.size()-1}">
            <div class="content">
                <li>
                    <a href="${param.href_prefix}${days.get(i).getDateLine()}">${days.get(i).getNiceDate()}</a>
                </li>
            </div>
        </c:forEach>
    </div>
</nav>