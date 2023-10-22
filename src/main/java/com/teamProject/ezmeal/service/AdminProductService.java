package com.teamProject.ezmeal.service;

import com.teamProject.ezmeal.dao.*;
import com.teamProject.ezmeal.domain.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminProductService {

    @Autowired
    ProductDao productDao;
    @Autowired
    ProductDiscountDao productDiscountDao;
    @Autowired
    ProductImgService productImgService;
    @Autowired
    ProductImgDao productImgDao;
    @Autowired
    ProductInventoryDao productInventoryDao;
    @Autowired
    ProductOptionDao productOptionDao;
    @Autowired
    ProductReviewDao productReviewDao;
    @Autowired
    ProductCategoryDao productCategoryDao;
    @Autowired
    CustDao custDao;
    @Autowired
    ProductStatusDao productStatusDao;
    @Autowired
    ProductCategoryService productCategoryService;
    @Autowired
    ProductReviewService productReviewService;

    private static final Logger logger = LoggerFactory.getLogger(AdminProductService.class);

    /*-----------------------------------------------  관리자  -----------------------------------------*/


    /*관리자 상품 관리 페이지(읽기, 수정용)*/
    public HashMap getOneProductByProdCdForMng (Long prod_cd) throws SQLException {
        /*상품 객체*/
        ProductDto product = productDao.selectProductByProdCdForMng(prod_cd);
        /*옵션 List*/
        List<ProductOptionDto> optList = productOptionDao.selectOptionProductsByProdCd(prod_cd);
        /*이미지 List*/
        List<ProductImgDto> imgList = productImgDao.selectProdCdImgAll(prod_cd);

        /*할인,카테고리,거래처,상태  리스트 받아오기*/
        HashMap listMap = getListForProductRegist();


        HashMap registProductMap = new HashMap();
        registProductMap.put("product",product);
        registProductMap.put("optList",optList);
        registProductMap.put("imgList",imgList);
        registProductMap.put("dcList",listMap.get("dcList"));
        registProductMap.put("cateList",listMap.get("cateList"));
        registProductMap.put("custList",listMap.get("custList"));
        registProductMap.put("stusList",listMap.get("stusList"));

        return registProductMap;
    }

    /* 관리자 페이지 읽기, 수정 시 -> 할인,카테고리,거래처,상태 리스트 받아오기 */
    public HashMap getListForProductRegist () throws SQLException {

        /*할인코드 List*/
        List<ProductDiscountDto> dcList = productDiscountDao.selectDiscountListByCateCd();
        /*카테고리 List*/
        List<ProductCategoryDto> cateList =  productCategoryDao.selectCategoryList();
        /*거래처 List*/
        List<CustDto> custList = custDao.selectCustList();
        /*상품 상태코드 List*/
        List<ProductStatusDto> stusList = productStatusDao.selectAllProdStus();

        HashMap registProductMap = new HashMap();

        registProductMap.put("dcList",dcList);
        registProductMap.put("cateList",cateList);
        registProductMap.put("custList",custList);
        registProductMap.put("stusList",stusList);

        return registProductMap;

    }

    /*관리자 상품 등록 메서드*/
    /*상품 1개와 옵션 리스트를 매개변수로 받는다. 이거 PK중요해서 트랜잭션 해야함
    *optList size() == 0이면 바로 아래 로직.
    *optList size() > 0이면 새 옵션 객체 만들기
    *상품 변수로 생성. optList의 index 0번 으로 넣기
    * -------------------------------
    *상품에 prod_cd가 ==null이면 Insert하고 1 받기, pk받기(가장 큰수의 pK)
    *prod_cd != null 이면 update하고 1받기. pk 꺼내기
    *꺼낸 pk -> option에 setProd_cd() 해주기
    *prod_cd로 찾은 optList랑 equals면 update / 아니면 insert
    *옵션 update, insert 카운트 해주기. optUpdateCnt / optInsertCnt
    *알려줄것들 Map(prodInsertCnt, prodUpdateCnt,optUpdateCnt, optInsertCnt)으로 반환
    * */
    public HashMap<String, Integer> prodAndOptionRegist(ProductDto productDto, List<ProductOptionDto> productOptionDtos) throws SQLException {
        Integer prodInsertCnt = 0;
        Integer prodUpdateCnt = 0;
        Integer optInsertCnt = 0;
        Integer optUpdateCnt = 0;
        HashMap<String, Integer> map = new HashMap<>();

        /*혹시 낱개 옵션 만들어야 할까봐 미리 만드는 옵션 객체*/
        ProductOptionDto prodOptOne = null;
        int optListSize = productOptionDtos.size();
        System.out.println("optListSize (1) = " + optListSize);


        try {
            if(optListSize>0) {
                /*상품정보로 낱개 옵션 만들기*/
                prodOptOne = new ProductOptionDto(null, productDto.getDc_cd(), "낱개", "qty", 1,
                                productDto.getCnsmr_prc(), productDto.getSale_prc(), productDto.getDc_rate(), productDto.getIn_id(), productDto.getUp_id());
                /*옵션 List 0번째로 낱개 옵션 넣어주기*/
                productOptionDtos.add(0, prodOptOne);
                /*옵션 있을 때 일반 상품에서 소비자가, 판매가 없애기로 했음*/
                productDto.setCnsmr_prc(null);
                productDto.setSale_prc(null);
            }

            optListSize = productOptionDtos.size();
            System.out.println("optListSize (2) = " + optListSize);

            System.out.println("상품 Insert하기 전. PK_Prod_Cd: "+productDao.selectMaxProdCd());
            /*상품 PK prod_cd*/
            Long pkProdCd = 0L;
            pkProdCd =  productDto.getProd_cd();
            System.out.println("productDto.getProd_cd() = " + pkProdCd);

            /*상품 Insert나 Update하기*/
            if(pkProdCd==null){
                prodInsertCnt += productDao.insertProduct(productDto);
                pkProdCd = productDao.selectMaxProdCd() ;
                System.out.println("Insert 후 pkProdCd "+pkProdCd);
            } else {
                /*이미 있는 상품*/
                System.out.println("이미 있어서 UPDATE");
                prodUpdateCnt += productDao.updateProductInfo(productDto);
            }

            if(optListSize>0) {
                /*prod_cd로 찾아오는 optList*/
                boolean optEq = false;
                List<ProductOptionDto> compareOptList = productOptionDao.selectOptionProductsByProdCd(pkProdCd);
                /*반복문으로 옵션 없으면 Insert 있으면 Update*/
                for (ProductOptionDto newOption : productOptionDtos) { /*폼에서 받아온 옵션 리스트*/
                    // 옵션에 상품코드 넣어주기
                    newOption.setProd_cd(pkProdCd);
                    newOption.setTyp("qty");
                    newOption.setIn_id("ezmeal");
                    newOption.setUp_id("ezmeal");

                    // 기존에 동일한 옵션이 있는지 확인
                    boolean found = false;
                    for (ProductOptionDto existingOption : compareOptList) {
                        if (newOption.equals(existingOption)) {
                            found = true;
                            break;
                        }
                    }

                    // 기존에 동일한 옵션이 있다면 update, 그렇지 않으면 insert
                    if (found) {
                        optUpdateCnt += productOptionDao.optionUpdate(newOption);
                    } else {
                        optInsertCnt += productOptionDao.optionInsert(newOption);
                    }
                }
            }
            System.out.println("prodInsertCnt: "+prodInsertCnt);
            System.out.println("prodUpdateCnt: "+prodUpdateCnt);
            System.out.println("optInsertCnt: "+optInsertCnt);
            System.out.println("optUpdateCnt: "+optUpdateCnt);

            int intPkProdCd = pkProdCd.intValue();
            map.put("prod_cd", intPkProdCd);
            map.put("prodInsertCnt",prodInsertCnt);
            map.put("prodUpdateCnt",prodUpdateCnt);
            map.put("optInsertCnt",optInsertCnt);
            map.put("optUpdateCnt",optUpdateCnt);

            return map;

        } catch (SQLException e) {
            System.out.println("SQLException");
            return map;
        } catch (NullPointerException e) {
            System.out.println("NullPointerException");
            return map;
        } catch (Exception e) {
            e.printStackTrace();  // 예외 정보를 출력합니다.
            System.out.println("Exception: " + e.getMessage());  // 예외 메시지를 출력합니다.
            return map;
        }
    }


    public HashMap<String, Integer> uploadAllImg(HashMap map, MultipartFile representativeImg,
                                                 MultipartFile[] mainImgs, MultipartFile detailImg ) throws SQLException, IOException {
        HashMap map2 = map;
        Long prod_cd = (Long)map.get("pkProdCd");
        int repreImgUploadInsertCnt = productImgService.uploadMultipleImageOne(representativeImg, prod_cd, "대표");
        int mainImgUploadInsertCnt = productImgService.uploadMultipleImages(mainImgs, prod_cd);
        int detailImgUploadInsertCnt = productImgService.uploadMultipleImageOne(detailImg, prod_cd, "상세");

        map.put("repreImgUploadInsertCnt", repreImgUploadInsertCnt);
        map.put("mainImgUploadInsertCnt", mainImgUploadInsertCnt);
        map.put("detailImgUploadInsertCnt", detailImgUploadInsertCnt);

        return map2;
    }


    @Transactional(rollbackFor = Exception.class)
    public HashMap<String, Integer> registerProductAndUploadImage(ProductDto productDto, List<ProductOptionDto> productOptionDtos,
                                                                  MultipartFile representativeImg, MultipartFile[] mainImgs, MultipartFile detailImg)
                                                                  throws SQLException, IOException {
        // 상품 및 옵션 등록
        HashMap<String, Integer> map = prodAndOptionRegist(productDto, productOptionDtos);

        // 이미지 등록
        map = uploadAllImg(map, representativeImg, mainImgs, detailImg);

        return map;
    }



    /*-----------관리자용-------------------*/
    /*상품 등록 페이지-> 상품, 할인, 이미지, 재고(0,safe), 옵션(y일 경우) n개 생성*/

    /*상품 등록 트랜잭션-> 상품등록, 이미지등록, 재고(0,safe)생성, 옵션(y일 경우) n개 생성*/

    /*상품 읽기/수정 페이지  전체 상품 목록을 가져온다. 할인, 이미지, 옵션 가져오기*/

    /*상품 수정 완료 -> 전체상품목록이랑 비교해서 equals가 아닌것만 update, 이미지 리스트도 마찬가지. 옵션도 마찬가지*/






    /*만들일 없을 것 같지만. 관리자의 할인코드 생성/수정/삭제 */



}



//@Service
//@EnableRetry
//public class ProductService {

/*이런게 있다고 함 */
//    @Retryable(value = SQLException.class, maxAttempts = 3, backoff = @Backoff(delay = 1000))
//    @Recover
//    public void recover(SQLException e) {
//        logger.error("Error occurred in getProductListByCateCd", e);
//        throw new RuntimeException("DB 조회 중 에러가 발생했습니다.", e);
//    }
