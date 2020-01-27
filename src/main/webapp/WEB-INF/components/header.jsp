<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Aldartron
  Date: 25.10.2017
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <nav class="nav-fixed" id="fixed">

        <div class="navigation">
            <a class="brand" href="<c:url value="/"/>">ГЛАВНАЯ</a>
            <a href="<c:url value="/schedule/day/"/>">СЕАНСЫ</a>
            <a href="<c:url value="/about"/>">О КИНОТЕАТРЕ</a>
            <a href="<c:url value="/contacts" />">КОНТАКТЫ</a>
        </div>

    </nav>
</header>