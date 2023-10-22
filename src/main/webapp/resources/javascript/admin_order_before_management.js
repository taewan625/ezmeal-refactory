/* DOCUMENT 변수명 */
const periodBtnAll = document.querySelectorAll(".admin__period_btn"); // due - btn
const dynamicTable = document.querySelector('.admin-order__content-table > tbody'); // 동적 data 들어가는 table

const selectAllBtn = document.querySelector('.admin-order__content-table thead input[type="checkbox"]'); // check box 전체 선택
let selectBtns;
const checkPayment = document.querySelector('.admin-order__check-order > button'); // 발주 확인 btn   # 개별
// check_box_module의 변수로 SELECT_SEQ_LIST, dynamicNum 가 존재
let ORDER_ID_LIST = []; // 선택된 발주 버튼

/* Rendering 함수 */
const renderHTMLFrom = function (adminBeforeManageInfoList) {
    let HTML_STRING = '';
    adminBeforeManageInfoList.forEach((info) => {
        // js에서 undefined가 나올 경우 default 값 주기
        const in_dtm = info.in_dtm ?? '';
        const ord_id = info.ord_id ?? '';
        const prod_smry = info.prod_smry ?? '';
        const name = info.name ?? '';
        const pay_mtd = info.pay_mtd ?? '';
        const bank = info.bank ?? '';
        const card_num = info.card_num ?? '';
        const rmk = info.rmk ?? '';

        HTML_STRING += `<tr ord_id="${ord_id}">
                            <td><input type="checkbox"/></td>
                            <td>${in_dtm}</td>
                            <td>${ord_id}</td>
                            <td>${prod_smry}</td>
                            <td>${name}</td>
                            <td>${pay_mtd}</td>
                            <td>${bank}</td>
                            <td>${card_num}</td>
                            <td>${rmk}</td>
                        </tr>`;
    });

    dynamicTable.innerHTML = HTML_STRING;

    // 동적 생성 요소에 관한 /* DOCUMENT 변수명 */ 및 /* EVENT 함수 */ TODO 따로 함수로 빼는 것이 조금 더 코드를 보기가 깔끔할 듯 하다.
    selectBtns = document.querySelectorAll('.admin-order__content-table tbody input[type="checkbox"]'); // check box 선택
    selectBtns.forEach((selectBtn) => {
        selectBtn.addEventListener("click",
            event => selectProduct(event, 'tr', 'ord_id')
        );
    }); // 상품 선택 이벤트
}

/* 사용 함수 */

// checkbox 선택 후, 해당 ord_id를 list에 담음
// 전체 선택 btn
// 개별 선택 btn

// 발주 확인 버튼, update 함수
// 현재 함수표현식으로 이미 정의를 했기 때문에 이전에 하던 방식대로 function을 밖으로 분리를 하면 함수가 2번 호출 된다.
// handleClickCheckPaymentBtn('/admin/order/before-management', SELECT_SEQ_LIST);

/* EVENT 함수 */

// 처음 html loading 후, 바로 수행되는 함수, html 문서 load 된 후 실행되는 js 함수
document.addEventListener('DOMContentLoaded',
    (event) => firstRenderData('dynamic-before-management', event)
);
// 기간 btn 누를 경우 , dynamic 수행
periodBtnAll.forEach((periodBtn) => {
    periodBtn.addEventListener('click',
        (event) => handlePeriodAndRender(event, '/admin/order/dynamic-before-management')
    );
})
// 전체 선택 버튼 누를 경우
selectAllBtn.addEventListener("click",
    () => selectAllProduct('tr', 'ord_id')
);
checkPayment.addEventListener("click",
    () => handleClickCheckPaymentBtn('/admin/order/before-management', '/admin/order/dynamic-before-management' ,SELECT_SEQ_LIST)
); // 발주 확인 이벤트