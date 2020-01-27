<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="components/head_body.jsp"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.2/less.min.js"></script>
    <title>О КИНОТЕАТРЕ</title>
</head>
<body>

<jsp:include page="components/header.jsp"/>

<%--<c:url value="/schedule/day/" var="day_prefix"/>--%>
<%--<jsp:include page="templates/subheader.jsp">--%>
    <%--<jsp:param name="subclass" value=""/>--%>
    <%--<jsp:param name="href_prefix" value="${day_prefix}"/>--%>
<%--</jsp:include>--%>

<section class="about">
    <div style="background-color: rgba(10,9,12, 0.82); width: 100%; height: 100%">
        <div class="container">
            <h4 class="slogan">Кинотеатр ОРИОН - прогрессивный кинотеатр для тех, кто умеет проводить время качественно.</h4>
            <div style="border: 8px double #EEF0F2; padding: 36px;">
                <p>Мы хотим, чтобы каждая минута просмотра приносила максимум наслаждения зрителям,<br> поэтому
                уделяем большое внимание репертуару показываемых фильмов.</p>
                <p>Мы показываем крутые фильмы в удобном кинозале с техническим оснащением высшего класса.</p>
            </div>
        </div>
    </div>
</section>

<jsp:include page="components/footer.jsp"/>

</body>
</html>