package com.teamProject.ezmeal.domain.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageHandlerDto {
    private int totalCnt; // 총 게시물 갯수
    private int naviSize = 10; // 페이지 내비게이션의 크기
    private int totalPage; // 전체 페이지의 갯수
    private int beginPage; // 내비게이션의 첫 번째 페이지
    private int endPage; // 내비게이션의 마지막 페이지  < 1 2 3 4 5 > html <div> 3 <a> </a> </div>
    private boolean showPrev; // 이전 페이지로 이동하는 링크를 보여줄 것인지의 여부
    private boolean showNext; // 다음 페이지로 이동하는 링크를 보여줄 것인지의 여부

    private int page; // 현재 페이지
    private int pageSize; // 한 페이지의 크기 = 해당 페이지의 게시물 개수


    public PageHandlerDto(int totalCnt, int page) {
        this(totalCnt, page, 10);
    }

    // 페이징 계산하는데 필요한게 3가지
    public PageHandlerDto(int totalCnt, int page, int pageSize) { // localhost:8080/
        this.totalCnt = totalCnt;
        this.page = page;
        this.pageSize = pageSize;

        totalPage = (int) Math.ceil(totalCnt / (double) pageSize);
        beginPage = (page-1) / naviSize * naviSize + 1;
        endPage = Math.min(beginPage + naviSize - 1, totalPage);
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
    }

    void print() {
        System.out.println("page = " + page);
        System.out.print(showPrev ? "< " : "");
        for (int i = beginPage; i <= endPage; i++) {
            System.out.print(i + " ");
        }
        System.out.println(showNext ? ">" : "");
    }


}
