<%--
  Created by IntelliJ IDEA.
  User: hhju2
  Date: 2023-07-20
  Time: PM 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>간편하고 건강한 식사 ezmeal</title>
    <link rel="stylesheet" href="/css/screens/slideMain.css"/>
</head>

<body>
<!--start : 첫번째 헤더(top)-->
<div class="header_box">
    <div class="header_top">
        <div class="logo-box">
            <a href="#">
                <img src="/img/ezmeal_logo.png" class="ezmeal_logo"/>
                <img src="/img/ezmeal.png" class="ezmeal_letter">
            </a>
        </div>

        <div class="search_box">
            <input
                    id="search"
                    placeholder="검색어를 입력해주세요"
                    class="search_inner_box"
            />
            <div class="search-btn">
                <a href="#">
                    <svg focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                    </svg>
                </a>
            </div>
        </div>
        <!--end : searchbox -->

        <!--start : icon box-->
        <div class="icon_box">
            <div class="icon_inner_box">
                <a href="#">
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="31"
                            height="31"
                            viewBox="0 0 30 30"
                    >
                        <g data-name="그룹 4823">
                            <path
                                    data-name="패스 26"
                                    d="M52.156 32.352s.48-9.291 12.787-8.954 12.308 8.954 12.308 8.954"
                                    transform="translate(-49.156 -6.414)"
                                    style="
                      stroke-linecap: round;
                      stroke: #00c728;
                      stroke-width: 3px;
                      fill: none;
                    "
                            />
                            <g
                                    data-name="타원 5"
                                    transform="translate(9.349 2)"
                                    style="stroke: #00c728; stroke-width: 3px; fill: none"
                            >
                                <circle
                                        cx="6.349"
                                        cy="6.349"
                                        r="6.349"
                                        style="stroke: none"
                                />
                                <circle
                                        cx="6.349"
                                        cy="6.349"
                                        r="5.349"
                                        style="fill: none"
                                />
                            </g>
                        </g>
                    </svg>
                </a>
            </div>
            <div class="icon_inner_box">
                <a href="#">
                    <?xml version="1.0" ?>
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            height="2em"
                            viewBox="0 0 512 512"
                    >
                        <path
                                style="fill: #00c728"
                                d="M458.4 64.3C400.6 15.7 311.3 23 256 79.3 200.7 23 111.4 15.6 53.6 64.3-21.6 127.6-10.6 230.8 43 285.5l175.4 178.7c10 10.2 23.4 15.9 37.6 15.9 14.3 0 27.6-5.6 37.6-15.8L469 285.6c53.5-54.7 64.7-157.9-10.6-221.3zm-23.6 187.5L259.4 430.5c-2.4 2.4-4.4 2.4-6.8 0L77.2 251.8c-36.5-37.2-43.9-107.6 7.3-150.7 38.9-32.7 98.9-27.8 136.5 10.5l35 35.7 35-35.7c37.8-38.5 97.8-43.2 136.5-10.6 51.1 43.1 43.5 113.9 7.3 150.8z"
                        />
                    </svg>
                </a>
            </div>
            <div class="icon_inner_box">
                <a href="#">
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="35"
                            height="35"
                            viewBox="0 0 30 30"
                    >
                        <g
                                data-name="그룹 4845"
                                transform="translate(-1635.719 -78.854)"
                        >
                            <rect
                                    data-name="사각형 4912"
                                    width="3.244"
                                    height="3.244"
                                    rx="1.622"
                                    transform="translate(1645.071 104.9)"
                                    style="fill: #00c728"
                            />
                            <rect
                                    data-name="사각형 4913"
                                    width="3.244"
                                    height="3.244"
                                    rx="1.622"
                                    transform="translate(1652.737 104.9)"
                                    style="fill: #00c728"
                            />
                            <path
                                    data-name="패스 944"
                                    d="M947.719 2245.563h6.515v16h14.291l3.194-11.378h-17.485"
                                    transform="translate(689.081 -2161.756)"
                                    style="
                      fill: none;
                      stroke: #00c728;
                      stroke-linecap: round;
                      stroke-linejoin: round;
                      stroke-width: 2.5px;
                    "
                            />
                        </g>
                    </svg>
                </a>
            </div>
        </div>
        <!--end : icon box-->
    </div>
</div>
<!--end : header-top-->

<!--start : header-bottom-->
<div class="header-bottom">
    <ul class="sidebar">
        <input type="checkbox" class="openSidebarMenu" id="openSidebarMenu"/>
        <label for="openSidebarMenu" class="sidebarIconToggle">
            <div class="spinner diagonal part-1"></div>
            <!--햄버거 첫째줄-->
            <div class="spinner horizontal"></div>
            <!--햄버거 둘째줄-->
            <div class="spinner diagonal part-2"></div>
            <!--햄버거 셋째줄-->
        </label>

        <!--start : sidebar 내용-->
        <div id="sidebarMenu">
            <ul class="sidebarMenuInner">
                <!--start : 정육-->
                <li class="sidebarMenuInner-list">
                    <i class="fa-solid fa-drumstick-bite"></i>
                        <a href="#">닭가슴살</a>
                    <ul class="sidebarMenuInner-Inner">
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">전체</a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">닭가슴살</a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">스테이크</a>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">소시지</a>
                        </li>
                    </ul>
                </li>



                <!--도시락, 볶음밥-->
                <li class="sidebarMenuInner-list">
                    <a href="#">
                        <i class="fa-solid fa-bowl-rice"></i>
                        도시락 | 볶음밥
                    </a>
                    <ul class="sidebarMenuInner-Inner">
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">전체</a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">도시락</a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">볶음밥</a>
                        </li>
                    </ul>
                </li>

                <!--start : 샐러드-->
                <li class="sidebarMenuInner-list">
                    <a href="#">
                        <i class="fas fa-seedling"></i>
                        샐러드
                    </a>
                    <ul class="sidebarMenuInner-Inner">
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">전체</a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">샐러드</a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">소스</a>
                        </li>
                    </ul>
                </li>

                <!--start : 신선식품-->
                <li class="sidebarMenuInner-list">
                    <a href="#">
                        <i class="fas fa-apple-alt"></i>
                        신선식품</a
                    >
                    <ul class="sidebarMenuInner-Inner">
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">전체</a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">채소 | 과일</a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">달걀</a>
                        </li>
                    </ul>
                </li>


                <!--start : 즉석 간편식-->
                <li class="sidebarMenuInner-list">
                    <a href="#">
                        <i class="fas fa-bread-slice"></i>
                        즉석 간편식</a
                    >
                    <ul class="sidebarMenuInner-Inner">
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">전체</a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">분식 </a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">반찬 | 밀키트</a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">면 </a>
                        </li>
                        <li class="sidebarMenuInner-Innerlist">
                            <a href="#">소스 </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>



        <div class="horizonMenu-list">
            <li><a href="#"  class="main_category">신상품</a></li>
            <li><a href="#" class="main_category">베스트</a></li>
            <li><a href="#" class="ezdeliveryimg">
                <img src="/img/delideli.png" class="ezdeliveryimg">
            </a></li>
            <li><a href="#" class="main_category">알뜰쇼핑</a></li>
            <li><a href="#" class="main_category">특가 | 혜택</a></li>
        </div>

    </ul>
</div>

<!--start : img slide-->
<div class="image-slideshow">
    <div class="image fade">
        <img
                src="/img/slideimg_1.jpg"
                style="width: 100%; height: 500px"
                alt="7월신메뉴"
        />
    </div>
    <div class="image fade">
        <img
                src="/img/slideimg_2.jpg"
                style="width: 100%; height: 500px"
                alt="구독신청"
        />
    </div>
    <div class="image fade">
        <img
                src="/img/slideimg_3.jpg"
                style="width: 100%; height: 500px"
                alt="콘텐츠"
        />
    </div>
</div>
<script src="/javascript/slideMain.js"></script>

<!--end : img slide-->


<!--메인에서 팔 상품 JSP-->

<div class="main_product_div">








</div>
































<!--START : FOOTER -->
<div class="footer_topbox1">
    <!--푸터 1,2 감싸는 박스( 위로 여유 공간포함)-->
    <div class="footer_topbox2">
        <!--푸터 1,2 감싸는 박스( 딱 맞는 사이즈?)-->
        <div class="footer1">
            <div class="footer1_box">
                <!--end  : 푸터 중간이 비어있는 betweenspace적용된 박스-->
                <div class="footer1_left">
                    <!--start :왼쪽 footer-->
                    <h2 class="happycenter">고객행복센터</h2>
                    <strong class="callnum"
                    >1541-1541
                        <span class="week_time">월~금요일 오전 9시 - 오후 6시</span>
                    </strong>
                    <div class="inquery">
                        <div class="inquery_box">
                            <button class="inquery_button">1:1 문의</button>
                            <div class="inquery_content">
                                365일
                                <br/>
                                고객센터 운영시간에 순차적으로 답변드리겠습니다.
                            </div>
                        </div>
                        <div class="inquery_box">
                            <button class="inquery_button">대량주문 문의</button>
                            <div class="inquery_content">
                                월~금요일 | 오전9시 - 오후6시
                                <br/>
                                점심시간 | 낮 12시 - 오후1시
                            </div>
                        </div>
                    </div>
                    <div class="nomember">
                        비회원 문의 : A-team@namgung.com
                        <br/>
                        비회원 대량주문 문의 : A-team12@namgung.com
                    </div>
                </div>
                <!--end :왼쪽 footer -->

                <!--start: 오른쪽 footer-->
                <div class="footer1_right">
                    <ul class="footer1_list">
                        <!--start :오른쪽 푸터 첫번째 (컬리소개, 투자정보~)-->
                        <li class="footer1_list_1">
                            <a href="#" target="_self" class="introduce">컬리소개</a>
                        </li>
                        <li class="footer1_list_1">
                            <a href="#" target="_blank" class="introduce">투자정보</a>
                        </li>
                        <li class="footer1_list_1">
                            <a href="#" target="_blank" class="introduce">인재채용</a>
                        </li>
                        <li class="footer1_list_1">
                            <a href="#" target="_self" class="introduce">이용약관</a>
                        </li>
                        <li class="footer1_list_1">
                            <a href="#" target="_blank" class="introduce"
                            >개인정보처리방침</a
                            >
                        </li>
                        <li class="footer1_list_1">
                            <a href="#" target="_self" class="introduce">이용안내</a>
                        </li>
                    </ul>

                    <!--end :오른쪽 푸터 첫번째 (컬리소개, 투자정보~)-->

                    <div class="footer1_information">
                        <!--start :오른쪽 푸터 두번째 (정보)-->
                        법인명(상호) : 주식회사 A-TEAM | 사업자 등록번호 : 123-45-67890
                        <br/>
                        통신판매업 : 제 2022-서울종로-51822호 | 개인정보보호책임자 :
                        이나경
                        <br/>
                        주소 : 서울시 종로구 종로 69, 5층 | 대표이사 : 권홍백이
                        <br/>
                        제휴문의 : a-team14@namgung.com
                        <br/>
                        채용문의 : a-team15@namgung.com
                        <br/>
                        팩스 : 123-4567-8900
                    </div>
                    <!--end :오른쪽 푸터 두번째 (정보)-->

                    <!--start : 오른쪽 푸터 세번째(logo)-->
                    <div class="sns_logo_box">
                        <ul class="sns_logo">
                            <a
                                    href="#"
                                    traget="_blank"
                                    rel="noreferrer"
                                    class="sns_logos"
                            >
                                <img src="/img/instagram.png" alt="인스타바로가기"/>
                            </a>
                            <a
                                    href="#"
                                    traget="_blank"
                                    rel="noreferrer"
                                    class="sns_logos"
                            >
                                <img src="/img/facebook.png" alt="페이스북바로가기"/>
                            </a>
                            <a
                                    href="#"
                                    traget="_blank"
                                    rel="noreferrer"
                                    class="sns_logos"
                            >
                                <img src="/img/youtube.png" alt="유튜브바로가기"/>
                            </a>
                        </ul>
                        <!--end : 오른쪽 푸터 세번째(logo)-->
                    </div>
                    <!-- end : 오른쪽 푸터-->
                </div>
                <!--end  : 푸터 중간이 비어있는 betweenspace적용된 박스-->
            </div>
            <!--end  : 푸터 왼, 오 싸고있는 박스 -->
        </div>

        <div class="footer2-wrapper">
            <div class="footer2_box">
                EZMEAL에서 판매되는 상품 중에는 EZMEAL에 입점한 개별 판매자가
                마켓플레이스(오픈마켓) 상품이 포함되어 있습니다.
                <br/>마켓플레이스(오픈마켓)의 상품의 경우 컬리는 통신판매중개자로서
                통신판매의 당사자가 아닙니다. 컬리는 해당 상품의 주문, 품질,
                교환/환불 등 의무와 책임을 부담하지 않습니다
                <em class="footer2_1">A-TEAM CORP. ALL RIGHTS RESERVED</em>
            </div>
        </div>
        <!--end :푸터 1,2 감싸는 박스( 딱 맞는 사이즈?)-->
    </div>
</div>
<!--end :푸터 1,2 감싸는 박스( 위로 여유 공간포함)-->

<!--start : scroll back to top-->
<button id="backtotop-btn">
    <a href="#top" style="color: white">Top</a>
</button>

<!--end : back to top button-->
<script src="https://kit.fontawesome.com/3dd102f0de.js" crossorigin="anonymous"></script>
<%--<script src="/javascript/slideMain.js"></script>--%>
</body>
</html>
