<%--
  Created by IntelliJ IDEA.
  User: hhju2
  Date: 2023-07-20
  Time: PM 7:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>


<!--메인 페이지에 보여줄 상품만 list에 담기-->
<c:forEach var="prod" items="${prodList}" varStatus="status">
  <!-- 4개씩 ul 태그로 감싸기 -->
  <c:if test="${status.index % 4 == 0}">
    <ul class="prod_list_ul">
  </c:if>

  <li class="prod_list_li">
    <div class="prod_outer"  data-prod-idx="${status.index}">
      <!--------------------------------------------------------------------------------------------->
      <figure class="prod_top top_figure">
        <a href="/product/detail?cate_cd=05&prod_cd=${prod.getProd_cd()}"> <!--상품 대표 이미지-->
          <c:set var="productImg" value="${prodImgList[status.index].url}"/>
          <img id="prod_top top_img"
               src="/img/${productImg}.png"/>
            <%--               src="/img/${empty productImg ? 'ezmeal_logo' : productImg}.png"/>--%>
        </a>

        <!--냉동/냉장/상온 아이콘-->
        <c:if test="${prod.getSfkp_stus() == '냉동'}">
                <span class="iceTyp sfkp-stus" data-index="${status.index}" value="${prod.getSfkp_stus()}">
                    <i class="fas fa-igloo"></i>
                </span>
        </c:if>
        <c:if test="${prod.getSfkp_stus() == '냉장'}">
                <span class="iceTyp sfkp-stus" data-index="${status.index}" value="${prod.getSfkp_stus()}">
                    <i class="fas fa-tint"></i>
                </span>
        </c:if>
        <c:if test="${prod.getSfkp_stus() == '상온'}">
                <span class="iceTyp sfkp-stus" data-index="${status.index}" value="${prod.getSfkp_stus()}">
                    <i class="fas fa-seedling"></i>
                </span>
        </c:if>


      </figure>
      <!--------------------------------------------------------------------------------------------->
      <div class="prod_bottom">
        <!--상품 관련 평균평점 및 리뷰 (리뷰테이블이 오면 값넣음)-->
        <div class="review_set">
          <a href="/product/detail?cate_cd=05&prod_cd=${prod.getProd_cd()}#section3">

            <!--별 이미지(고정)-->
            <span class="star_img"></span>
            <c:set var="starAvg" value="${reviewAngMap[prod.prod_cd].avg}" />
            <!--평균 점수-->
            <span class="score">${empty starAvg ? 0 : starAvg}</span>
            <c:set var="reviewCnt" value="${reviewCntMap[prod.prod_cd].count}" />
            <!--리뷰 수-->
            <span class="total_num">(${empty reviewCnt ? 0 : reviewCnt})</span>
          </a>
        </div>

        <div class="in_middle">
          <a href="/product/detail?cate_cd=05&prod_cd=${prod.getProd_cd()}">

            <p class="prod_title"> <!--상품 이름-->
              <span class="prod_title prod_name" >${prod.getName()}</span>
            </p>

            <div class="dc_cd_prod_dscpt_wrapper"> <!-- 할인정보, 판매가격, 소비자가격 세트 -->

              <c:choose>
                <c:when test="${not empty prodOptMap[prod.prod_cd]}"> <!--옵션 있을 때--------------->


                  <c:set var="cnsmr_prc_opt" value="${prodOptMap[prod.prod_cd].get(0).cnsmr_prc}" />
                  <c:set var="sale_prc_opt" value="${prodOptMap[prod.prod_cd].get(0).sale_prc}" />

                  <!--할인 퍼센트-->
                  <c:if test="${cnsmr_prc_opt != sale_prc_opt}">
                      <span class="dc_cd">
                        <strong>${(cnsmr_prc_opt - sale_prc_opt) / cnsmr_prc_opt * 100}</strong>%
                      </span>&nbsp;
                  </c:if>

                  <!--판매 가격-->
                  <span class="sale_prc">
                          <strong>${sale_prc_opt}</strong>원
                  </span>

                  <!--소비자 가격-->
                  <c:if test="${cnsmr_prc_opt != sale_prc_opt}">
                    <p class="cnsmr_prc">
                      <span>${cnsmr_prc_opt}</span>원
                    </p>
                  </c:if>

                </c:when>
                <c:otherwise> <!--옵션 있을 때----------------------------------------------->

                  <c:set var="cnsmr_prc" value="${prod.getCnsmr_prc()}" />
                  <c:set var="sale_prc" value="${prod.getSale_prc()}" />

                  <!--할인 퍼센트-->
                  <c:if test="${cnsmr_prc != sale_prc}">
                      <span class="dc_cd">
                        <strong>${(cnsmr_prc - sale_prc) / cnsmr_prc * 100}</strong>%
                      </span>&nbsp;
                  </c:if>

                  <!--판매 가격-->
                  <span class="sale_prc">
                        <strong>${prod.getSale_prc()}</strong>원
                  </span>

                  <!--소비자 가격-->
                  <c:if test="${cnsmr_prc != sale_prc}">
                    <p class="cnsmr_prc">
                      <span>${prod.getCnsmr_prc()}</span>원
                    </p>
                  </c:if>

                </c:otherwise>
              </c:choose>

            </div>
          </a>
        </div>

        <!--------------------------------------------------------------------------------------------->
        <!--상품 목록 페이지에서 바로 장바구니에 넣는 버튼-->
          <%--        <div class="add_cart">--%>
          <%--          <form id="cart_form_${status.index}" class="cart_form">--%>
        <div class="button_wrapper">
          <!--수량 빼는 버튼-->
          <button type="button" class="min_btn" id="min_btn_${status.index}" onclick="decreaseQuantity(this)">-</button>
          <!--선택한 수량. 담기 버튼 누르면 보내줘야 하는 값-->
          <span id="qty_${status.index}" class="qty">1</span>
          <!--수량 추가 버튼-->
          <button type="button" class="pls_btn" id="pls_btn_${status.index}" onclick="increaseQuantity(this)">+</button>
          &nbsp;&nbsp;
          <!--(히든)장바구니 담기버튼 눌렀을 때 상품 코드도 함께 전송-->
          <input type="hidden" id="prod_cd_${status.index}" value="${prod.getProd_cd()}">
          <!--상품찜하기 버튼-->
          <button type="button" class="wishlist_btn" id="wishlist_btn_${status.index}" >
            <i class="far fa fa-heart"></i>
          </button>
          <!--제출 버튼-->
          <button type="button" class="submit_btn" id="submit_btn_${status.index}" >
            <i class="fas fa fa-shopping-cart"></i>
          </button>
        </div>
          <%--          </form>--%>
          <%--        </div>--%>

        <c:if test="${not empty prodOptMap[prod.prod_cd]}">
          <div class="hidden_option" id="opt_div_${status.index}">
            <select class="select_box" id="opt_select_${status.index}">
              <!-- prodOptMap에서 해당 prod_cd의 ProductOptionDto List를 가져와 각 항목에 대해 옵션 태그를 생성 -->
              <c:forEach var="optList" items="${prodOptMap[prod.prod_cd]}"  varStatus="opt_status">
                <option value="${optList.opt_seq}">${optList.name}</option>
              </c:forEach>
            </select>
          </div>
        </c:if>

      </div>
      <!--------------------------------------------------------------------------------------------->
    </div>
  </li>

  <!-- 4개마다 ul 태그 닫기 -->
  <c:if test="${status.index % 4 == 3 || status.last}">
    </ul>
  </c:if>
</c:forEach>


</body>
</html>
