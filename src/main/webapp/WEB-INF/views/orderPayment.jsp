<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: taewan
  Date: 2023/07/02
  Time: 9:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>ezmeal | 주문 내역</title>
    <link rel="stylesheet" href="/css/orderPayment.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="mypageHeader.jsp"/>

<div class="main-section">
    <jsp:include page="mypageLeft.jsp"/>
    <div class="main-section-right__order-history">
        <!-- 주문 내역 및 조회 기간 -->
        <div class="order-history__period">
            <div class="order-history__period_title">
                <h2>주문 내역</h2>
                <span>조회기간 : <span
                        class="order-history__period__start_end">${startEndDate.get("start_date")} ~ ${startEndDate.get("end_date") }</span> </span>
            </div>
            <div class="order-history__period_detail">
                <span class="order-history__period_detail__title">조회 설정 </span>
                <button class="order-history__period_btn one-month">1개월</button>
                <button class="order-history__period_btn third-month">3개월</button>
                <button class="order-history__period_btn six-month">6개월</button>
                <button class="order-history__period_btn one-year">12개월</button>
                <button class="personal-period"> 기간설정</button> <!-- todo 이렇게 하면 modal 띄워야 한다. -->
                <button class="reset-period">초기화</button>
            </div>
        </div>
        <!-- 주문 내역 및 조회 기간 끝-->
        <div class="order-history__AJAX-load"></div>
        <!-- order-history__AJAX-load -->
    </div>
    <!-- main-section-right__order-history 끝 -->
</div>
<script src="/javascript/orderPayment.js"></script>
</body>
</html>