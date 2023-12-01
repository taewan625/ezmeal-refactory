package com.teamProject.ezmeal.service.client.order;

import com.teamProject.ezmeal.dao.client.product.ProductDao;
import com.teamProject.ezmeal.dao.client.order.WishListDao;
import com.teamProject.ezmeal.domain.client.product.ProductDto;
import com.teamProject.ezmeal.domain.client.order.WishListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WishListService {
    @Autowired
    WishListDao wishListDao;

    @Autowired
    ProductDao productDao;

    /*매개변수로 받는 wishListDto 있는지 확인하고 같으면 0반환, Insert*/
    public boolean insertWishList(WishListDto wishListDto) throws SQLException {
        System.out.println("--------서비스 진입---------");
        boolean existSelect = wishListDao.selectWishList(wishListDto)==null ? false : true;  /*없을 때 false*/

        try {
            if (!existSelect){
                System.out.println("[서비스] select 없음 = insert 가능");
                Integer insertResult = wishListDao.insertWishList(wishListDto);
                return insertResult==1 ? true : false;
            } else {
                System.out.println("[서비스] select 있음 = insert 못한다고 말해");
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            e.getMessage();
            return false;
        }

    }


    public List<Long> myWishListProdCd(Long mbr_id) throws SQLException {
        List<WishListDto> wishProdList = wishListDao.selectMembersList(mbr_id);
        List<Long> prodCdList = new ArrayList<>();
        wishProdList.forEach(a->prodCdList.add(a.getProd_cd()));
        return prodCdList;
    }


    public Map<Long, String> allProductsName() throws SQLException {
        Map<Long, String> map = new HashMap<>();
        List<ProductDto> list = productDao.selectAllProdListForWishList();
        list.forEach(a->map.put(a.getProd_cd(), a.getName()));
        return map;
    }

}