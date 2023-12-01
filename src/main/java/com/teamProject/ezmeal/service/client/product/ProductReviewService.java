package com.teamProject.ezmeal.service.client.product;

import com.teamProject.ezmeal.dao.client.product.ProductReviewDao;
import com.teamProject.ezmeal.domain.client.product.ProductReviewDto;
import com.teamProject.ezmeal.domain.client.product.ProductReviewTotalDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductReviewService {
    @Autowired
    ProductReviewDao productReviewDao;


//    Map<Long,Object> reviewAvgMap = productReviewDao.selectReviewAvgAllProduct();
//    Map<Long,Integer> reviewCntMap = productReviewDao.selectReviewCntAllProduct();
    /*위의 것 만들어주기*/
public Map<Long,Object> selectReviewAvgAllProduct() {
    try {
        List<ProductReviewTotalDto> list = productReviewDao.selectReviewAvgAllProduct();

        if (list == null || list.isEmpty()) {
            return new HashMap<>();
        }

        HashMap<Long,Object> map = new HashMap<>();
        for(ProductReviewTotalDto dto : list){
            map.put(dto.getProd_cd(), dto.getRvAvg());
        }
        return map;
    } catch (SQLException e) {
        System.err.println(e.getMessage());
        return null;
    }
}

    public Map<Long,Integer> selectReviewCntAllProduct() {
        try {
            List<ProductReviewTotalDto> list = productReviewDao.selectReviewCntAllProduct();

            if (list == null || list.isEmpty()) {
                return new HashMap<>();
            }

            HashMap<Long,Integer> map = new HashMap<>();
            for(ProductReviewTotalDto dto : list){
                map.put(dto.getProd_cd(), dto.getRvCnt());
            }
            return map;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return null;
        }
    }


    // taewan
    /*리뷰 생성하기*/
    public Integer writeReviewFromOrderDetail(ProductReviewDto productReviewDto) {
        return productReviewDao.insertReviewFromOrderDetail(productReviewDto);
    }

}