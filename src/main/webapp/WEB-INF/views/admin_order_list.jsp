<%--
  Created by IntelliJ IDEA.
  User: taewan
  Date: 2023/07/26
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ezmeal 관리자 | 주문 리스트</title>
</head>
<body>
<!-- 관리자 페이지 헤더 -->
<%@ include file="admin_header.jsp" %>  <!-- 관리자 헤더 인클루드 -->

<!-- 헤더 아래부분 전체 div
[ 메뉴 div /  관리자 담당 페이지 div  ] -->
<div class="all_container_div">

  <%@ include file="admin_menu.jsp" %> <!-- 관리자 메뉴 인클루드 -->

  <div class="admin_container_div">
    <!-- admin_container_div 내용.
    각자 맡은 관리자 페이지 내용 이 디브 안에 쓰면 됩니다.  -->
    <h1> admin orderList 입니다.</h1>
  </div>

</div>
</body>
</html>
