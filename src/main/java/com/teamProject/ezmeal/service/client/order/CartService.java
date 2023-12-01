package com.teamProject.ezmeal.service.client.order;

import com.teamProject.ezmeal.dao.client.order.CartDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

// TODO transaction이 핵심 -> 이거의 예외, service 단의 목적
@Service
@RequiredArgsConstructor
public class CartService {
    private final CartDao cartDao;

    public Long getCartSeq(Long mbrId){
        return cartDao.selectCartSeq(mbrId);
    }
}
