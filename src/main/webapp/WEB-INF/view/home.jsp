<%--
  Created by IntelliJ IDEA.
  User: Averjan(Тимофей)
  Date: 05.12.2021
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="common/header.jsp"/>
<head>
    <title>Home | Hotel</title>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="localization.language" var="loc"/>
<fmt:setBundle basename="information" var="info"/>

<div class="container">
    <h3 class="pb-3 my-sm-3">Booking.</h3>
    <div class="row justify-content-center">
        <img src="static/images/hotel.jpg" class="img-fluid" width="1000" height="400">
    </div>

    <div class="row justify-content-center">

    </div>
</div>
</div>
<jsp:include page="common/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="script.js"></script>
</body>
</html>
