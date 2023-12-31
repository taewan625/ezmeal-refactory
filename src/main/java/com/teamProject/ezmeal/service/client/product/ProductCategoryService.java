package com.teamProject.ezmeal.service.client.product;

import com.teamProject.ezmeal.dao.client.product.ProductCategoryDao;
import com.teamProject.ezmeal.domain.client.product.ProductCategoryDto;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.*;


@Service
@RequiredArgsConstructor
public class ProductCategoryService {
    @Autowired
    ProductCategoryDao productCategoryDao;

    public Map<String, String> getAllProdCateCdAndNameList() throws SQLException {
        List<ProductCategoryDto> cateList = productCategoryDao.selectCateCdAndNameList();
        Map map = new HashMap();
        for(ProductCategoryDto dto : cateList){
            map.put(dto.getCate_cd(), dto.getName());
        }
        return map;
    }



}
