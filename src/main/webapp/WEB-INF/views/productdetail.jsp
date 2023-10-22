<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: hhju2
  Date: 2023-06-29
  Time: AM 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ezmeal</title>
  <link rel="stylesheet" href="/css/screens/productdetail.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
</head>
<body>
<div class="empty-space" id="section0"></div>

<!-- 헤더 -->
<jsp:include page="header.jsp"/>

<!-----------------------------------------  메인 왼쪽 사진  ---------------------------------------------------->
<div class="head_main">
  <div class="head_main_left">

    <!-- 메인 이미지 -->
    <c:choose>
      <c:when test="${not empty imgList}">
        <c:forEach var="img" items="${imgList}" varStatus="status">
          <c:if test="${img.typ=='대표'}">
            <img class="main_img" src="/img/${img.url}" id="main_img"/>
          </c:if>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <img class="main_img" src="/img/ezmeal_logo.png" id="main_img"/>
      </c:otherwise>
    </c:choose>

    <!-- 미니 이미지 -->
    <ul class="mini_img_set">
      <c:forEach varStatus="status" begin="1" end="5">
        <c:choose>
          <c:when test="${not empty imgList and status.count <= imgList.size()}">
            <c:set var="img" value="${imgList[status.count-1]}" />
            <c:if test="${img.typ=='메인'}">
              <img class="mini_img 메인" src="../img/${img.url}" id="mini_img_${status.count}"/>
<%--              <img class="mini_img 메인" src="../img/${img.url}.png" id="mini_img_${status.count}"/>--%>
            </c:if>
          </c:when>
          <c:otherwise>
            <img class="mini_img 메인" src="../img/ezmeal_logo.png" id="mini_img_${status.count}"/>
          </c:otherwise>
        </c:choose>
      </c:forEach>
    </ul>

<%--    <c:forEach var="img" items="${imgList}" varStatus="status">--%>
<%--      <c:if test="${img.typ=='대표'}">--%>
<%--        <img class="main_img" src="../img/${img.url}.png"  id="main_img"/>--%>
<%--      </c:if>--%>
<%--    </c:forEach>--%>


<%--    <ul class="mini_img_set">--%>
<%--      <c:forEach var="img" items="${imgList}">--%>
<%--        <c:if test="${img.typ=='메인'}">--%>
<%--          <img class="mini_img 메인" src="../img/${img.url}.png" />--%>
<%--        </c:if>--%>
<%--      </c:forEach>--%>
<%--    </ul>--%>
<%--    <div class="main_left 아래 여백"></div>--%>
  </div>

  <!--------------------------------------------- 메인 오른쪽 정보 --------------------------------------------------->
  <div class="head_main_right">
    <div class="prod_name_div">
      <p class="prod_name"><strong>${product.getName()}</strong></p>
    </div>
    <div class="review_set">
      <!--별점만큼 보여주기-->
      <div class="stars_set">

      </div>
      <!--별점 평균-->
      <span class="score" id="reviewAvg" data-avg="${reivewAvg}">${empty reivewAvg?0:reivewAvg}</span>점
      <!--리뷰 개수-->
      (
      <span class="total_num">${reviewCount}</span>
      )
    </div>

    <!---옵션 있을 때 가격--->  <!---옵션 없을 때 가격--->
    <div class="prod_price_set ">
      <c:choose>

        <c:when test="${optList.size() > 0}">
          <c:set var="cnsmr_prc" value="${optList.get(0).getCnsmr_prc()}" />
          <c:set var="sale_prc" value="${optList.get(0).getSale_prc()}" />

          <c:if test="${cnsmr_prc != sale_prc}">
            <strong class="dc_pt">${optList.get(0).getDc_rate()}%</strong>
          </c:if>

          <strong class="sale_prc"><fmt:formatNumber value="${sale_prc}" type="number" pattern="#,##0"/>원</strong>
<%--          <strong class="sale_prc">${sale_prc}&nbsp;원</strong>--%>

          <c:if test="${cnsmr_prc != sale_prc}">
            <del class="cnsmr_prc">${cnsmr_prc}&nbsp;원</del>
          </c:if>
        </c:when>

        <c:otherwise>
          <c:set var="cnsmr_prc" value="${product.getCnsmr_prc()}" />
          <c:set var="sale_prc" value="${product.getSale_prc()}" />

          <c:if test="${cnsmr_prc != sale_prc}">
            <strong class="dc_pt">${product.getDc_rate()}%</strong>
          </c:if>
          <strong class="sale_prc"><fmt:formatNumber value="${sale_prc}" type="number" pattern="#,##0"/>원</strong>
<%--          <strong class="sale_prc">${sale_prc}&nbsp;원</strong>--%>

          <c:if test="${cnsmr_prc != sale_prc}">
            <del class="cnsmr_prc">${cnsmr_prc}&nbsp;원</del>
          </c:if>
        </c:otherwise>

      </c:choose>
    </div>

    <!------------------- 상품 안내 테이블------------------------->

    <div class="prod_info_set">
      <table class="info_table">
        <tr>
          <th>상품안내</th>
          <td>${product.getDscpt()}</td>
        </tr>
        <tr>
          <th>배송방법</th>
          <td>EZ무료배송</td>
        </tr>
        <tr>
          <th>추가혜택</th>
          <c:set var="cate_cd" value="${product.getCate_cd()}" />
            <c:choose>
              <c:when test="${cate_cd.contains('010') || cate_cd.contains('020')}">
                <td>증정품 : 불닭소스 200g</td>
              </c:when>
              <c:when test="${cate_cd.contains('030')}">
                <td>증정품 : 참깨소스 200g</td>
              </c:when>
              <c:when test="${cate_cd.contains('040')}">
                <td>증정품 : 이지밀 펭귄 포크세트</td>
              </c:when>
              <c:when test="${cate_cd.contains('050')}">
                <td>증정품 : 모짜렐라치즈 200g</td>
              </c:when>
              <c:when test="${cate_cd.contains('06')}">
                <td>증정품 : 미니도시락 세트</td>
              </c:when>
              <c:when test="${cate_cd.contains('07')}">
                <td>증정품 : 미니 샐러드 200g</td>
              </c:when>
              <c:otherwise>
                <td>증정품 : 정보가 없습니다.</td>
              </c:otherwise>
            </c:choose>
        </tr>
        <tr>
          <th>보관방법</th>
          <td>[${product.getSfkp_stus()}]&nbsp;${product.getSfkp_mtd()}</td>
          <imput type="hidden" id="typ_is" value="${product.getSfkp_stus()}"></imput>
        </tr>
      </table>
    </div>
    <div id="prod_cd_is" hidden="hidden" data-value="${product.getProd_cd()}"></div>
    <!------------------- 옵션 셀렉트 박스 ------------------------->
    <div id="is_opt" hidden="hidden" data-value="${optList.size()}"></div>
    <div class="prod_order_set">
      <c:if test="${ optList.size() > 0}">
        <div class="hidden_option" id="opt_div">
          <select class="select_box" id="opt_select">
            <c:forEach items="${optList}" var="option">
              <option value="${option.opt_seq}_${option.sale_prc}">
                &nbsp;${product.getName()}&nbsp;${option.name}&nbsp;&nbsp;${option.sale_prc}원&nbsp;&nbsp;(${option.dc_rate}% 할인)
              </option>
            </c:forEach>
          </select>
        </div>
      </c:if>

      <!------------------- 수량 변경 및 선택 , 가격 변동 ------------------------->
      <div class="qty_button_set">
        <!--수량 빼는 버튼-->
        <button type="button" class="min_btn" id="min_btn"
                onclick="decreaseQuantity(this)">-</button>
        <!--선택한 수량. 담기 버튼 누르면 보내줘야 하는 값-->
        <span id="qty" class="qty">1</span>
        <!--수량 추가 버튼-->
        <button type="button" class="pls_btn" id="pls_btn"
                onclick="increaseQuantity(this)">+</button>
        &nbsp;&nbsp;
        <c:if test="${ optList.size() > 0}">
          <button type="button" class="calculation_btn" id="calculation_btn">선택</button>
        </c:if>
        <!--수량에 따른 가격 변동-->
        <span id="amount_by_qty_x_price" class="qty"></span><span>원</span>
        <!-- 상품 가격 전송 -->
        <input type="hidden" id="prod_sale_prc" value="${product.getSale_prc()}">

      </div>

      <!------------------- 옵션 선택으로 만들어지는 ul SET ------------------------->
      <div class="make_li">

      </div>

      <!------------------- 최종 금액 ------------------------->
      <div class="order_amount">
        <span id="order_price_test" class="last_text">총 금액&nbsp;</span>
        <c:if test="${ optList.size() == 0}">
          <span id="order_amount" class="last_amonut">&nbsp;${product.getSale_prc()}</span><span>&nbsp;원</span>
        </c:if>
        <c:if test="${ optList.size() > 0}">
          <span id="order_amount_opt" class="last_amonut">&nbsp;${optList.get(0).getSale_prc()}</span><span>&nbsp;원</span>
        </c:if>
      </div>

      <!------------------- 버튼 SET ------------------------->
      <div class="button_wrapper">
        <!--찜하기-->
        <button type="button" class="wishlist_btn" id="wishlist_btn">
          <i class="fas fa fa-heart"></i>
          <span class="button_text">&nbsp;찜하기</span>
        </button>
        <!--장바구니-->
        <button type="button" class="addcart_btn" id="addcart_btn">
          <i class="fas fa fa-shopping-cart"></i>
          <span class="button_text">&nbsp;장바구니</span>
        </button>
        <!--주문하기-->
        <button type="button" class="order_btn" id="order_btn">
          <i class="far fa fa-credit-card"></i>
          <span class="button_text">&nbsp;주문하기</span>
        </button>
      </div>

    </div>
  </div>
</div>
<!-------------------------------------------  상세 시작  ---------------------------------------------->

<div class="middle_1">
  <ul class="detail_navi_set" id="section1">
    <li class="detail_navi"><a href="#section1">상품설명</a></li>
    <li class="detail_navi"><a href="#section2">상세정보</a></li>
    <li class="detail_navi"><a href="#section3">상품후기</a></li>
    <li class="detail_navi"><a href="#section4">상품문의</a></li>
  </ul>
  <c:forEach var="img" items="${imgList}">
    <div class="image-container">
      <c:if test="${img.typ=='상세'}">
        <img class="detail_img" src="/img/${img.url}" alt="Image">
      </c:if>
    </div>
  </c:forEach>

</div>
<!-----------------------------------------  나중에 쇼핑몰 광고넣을 수 있음 ------------------------------------->
<div class="middle_2">
  <img class="prod_detail_long_img" src="">
</div>
<!--------------------------------------  제품 상세 정보  ------------------------------------------>
<div class="hidden_navi_div"  id="section2"></div>
<div class="middle_3 prod_dscpt_set">
  <table class="dscpt_table">

    <c:if test="${product.getDetail() != null }">
      <tr>
        <th>상세설명</th>
        <td>${product.getDetail()}</td>
      </tr>
    </c:if>
    <tr>
      <th>보관방법</th>
      <td>${product.getSfkp_mtd()}</td>
    </tr>
    <tr>
      <th>활용법</th>
      <td>${product.getMtd()}</td>
    </tr>
    <tr>
      <th>레시피</th>
      <td>${product.getRecipe()}</td>
    </tr>
    <tr>
      <th>원산지</th>
      <td>${product.getOrplc()}</td>
    </tr>
    <tr>
      <th>유통기한</th>
      <td>${product.getDistb_tlmt()}</td>
    </tr>
  </table>
</div>


</div>
<!------------------------------------  상품후기 (상단)  ----------------------------------------------------->
<div class="hidden_navi_div"  id="section3"></div>

<div class="review_head">
  <dt class="bottm_title">&nbsp;&nbsp;상품 후기</dt>
  <button class="make_review_btn" ><a href="/index">리뷰쓰기</a></button>
</div>

<!--------------------------------------  상품후기 (내용)  --------------------------------------------->
<c:forEach var="review" items="${reviewList}" varStatus="status">
  <ul class="rv_container">
    <li class="rv_set">
      <span class="rv_wrt">${review.writer}</span>
      <span class="rv_wrt_dt">${review.wrt_dt}</span>
      <span class="rv_star">${'★'.repeat(review.star)}</span>
      <span class="rv_title">${review.title}</span>
      <span class="rv_stmt">${review.stmt}</span>

      <c:choose>

        <c:when test="${review.prod_cd == 137}">
          <span class="rv_img"><img src="/img/wm0814.png" width="100px" height="100px" id="wm_img"></span>
        </c:when>

        <c:otherwise>
          <span class="rv_img"><img src="/img/${review.prod_cd}_${status.index}.png" width="100px" height="100px" id="img_${status.index}"></span>
        </c:otherwise>
      </c:choose>

    </li>
  </ul>
</c:forEach>


<%--<ul class="rv_container">--%>
<%--  <li class="rv_set">--%>
<%--    <span class="rv_wrt">강*바</span>--%>
<%--    <span class="rv_wrt_dt">2023.06.12.</span>--%>
<%--    <span class="rv_star">★★★★★</span>--%>
<%--&lt;%&ndash;    <span class="rv_kword">가성비 굿</span>&ndash;%&gt;--%>
<%--    <span class="rv_title">맛있어요</span>--%>
<%--    <span class="rv_stmt">또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.--%>
<%--                        또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.--%>
<%--                        또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.또 먹고 싶어요 추천합니다.--%>
<%--                    </span>--%>
<%--    <span class="rv_img"><img src="../../img/4.png" width="100px" height="100px" id="img02"></span>--%>

<%--  </li>--%>

<%--</ul>--%>

<!---------------------------------  상품문의  (상단)  ----------------------------------------------------->
<div class="hidden_navi_div"  id="section4"></div>

<div class="inquiry_head">
  <dt class="bottm_title">&nbsp;&nbsp;상품 문의</dt>
  <button class="make_inquiry_btn"><a href="/index">문의하기</a></button>
</div>
<!------------------------------------ 상품문의  (내용)  --------------------------------------------->
<table class="inquiry_container">
  <thead>
  <tr class="header">
    <th class="header_title">제목</th>
    <th class="header_wrt">작성자</th>
    <th class="header_wrt_dt">작성일</th>
    <th class="header_stus">답변상태</th>
  </tr>
  </thead>
<c:if test="${product.prod_cd != 137}">
  <tbody>
  <tr>
    <td class="inquiry_title accordion">&nbsp;Q. 언제 입고돼요</td>
    <td class="inquiry_wrt">김자*</td>
    <td class="inquiry_wrt_dt">2023.05.02</td>
    <td class="inquiry_stus">답변완료</td>
  </tr>
  <tr>
    <td colspan="4">
      <div class="answer">아 고객님 연락드리겠습니다.</div>
    </td>
  </tr>

  <!-- 리뷰 하드코딩 -->

  <tr>
    <td class="inquiry_title accordion">&nbsp;Q. 불닭맛 있어요?</td>
    <td class="inquiry_wrt">한자*</td>
    <td class="inquiry_wrt_dt">2023.06.13.</td>
    <td class="inquiry_stus">답변완료</td>
  </tr>
  <tr>
    <td colspan="4">
      <div class="answer">아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.
        아 고객님 연락드리겠습니다. 아 고객님 연락드리겠습니다.


      </div>
    </td>
  </tr>

  <!-- 리뷰 하드코딩 -->
  <tr>
    <td class="inquiry_title accordion">&nbsp;Q. 5개 세트는 안파나요?</td>
    <td class="inquiry_wrt">김태*</td>
    <td class="inquiry_wrt_dt">2023.08.03.</td>
    <td class="inquiry_stus">답변완료</td>
  </tr>
  <tr>
    <td colspan="4">
      <div class="answer">
        아 고객님  저희는 10의 배수만 취급합니다.
        10개 세트 구입하시고 반 나누시면 되겠습니다.
        좋은 하루 되세요^^
      </div>
    </td>
  </tr>

  <!-- 리뷰 하드코딩 -->
  <tr>
    <td class="inquiry_title accordion">&nbsp;Q. 조리법이 궁금해요!</td>
    <td class="inquiry_wrt">황태*</td>
    <td class="inquiry_wrt_dt">2023.08.05.</td>
    <td class="inquiry_stus">답변완료</td>
  </tr>
  <tr>
    <td colspan="4">
      <div class="answer">
        전자레인지에 데워드시면 되시겠습니다.
      </div>
    </td>
  </tr>

  </tbody>
</c:if>
</table>
<div class="bottom_empty">
  <dt class="bottm_title"> </dt>
</div>
<!------------------------------------- 아래 빈 공간 ------------------------------------------->

<div class="empty-space">

</div>

<!------------------------------------- 자바스크립트 ------------------------------------------->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<%--<script src="/javascript/productdetailoption.js"></script>--%>
<%--<script src="/javascript/productdetail_img_and_order.js"></script>--%>
<%--<script src="/javascript/productdetail.js"></script>--%>
<script src="/javascript/productDetailCombined.js"></script>

<script>
  src="https://kit.fontawesome.com/6478f529f2.js"
  crossOrigin="awesome"
</script>
</body>
</html>
