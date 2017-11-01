<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="subheader" id="subheader">

    <%--ВСЕ ДНИ--%>
        <div class="<c:if test="${empty currentDay}">active</c:if>">
            <div class="content">
                <a class="nav-link" href="<c:url value="/"/>">Все дни</a>
            </div>
        </div>

    <div class="<c:if test="${currentDay.equals(days.get(0).getDateLine())}">active</c:if>">
        <div class="content">
            <a class="nav-link" href="?day=${days.get(0).getDateLine()}">Сегодня</a>
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