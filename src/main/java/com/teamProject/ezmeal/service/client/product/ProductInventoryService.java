package com.teamProject.ezmeal.service.client.product;

import com.teamProject.ezmeal.dao.client.product.ProductInventoryDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class ProductInventoryService {
    private final ProductInventoryDao productInventoryDao;

}
