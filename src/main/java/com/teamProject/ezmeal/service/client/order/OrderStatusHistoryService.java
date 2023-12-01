package com.teamProject.ezmeal.service.client.order;

import com.teamProject.ezmeal.dao.client.order.OrderStatusHistoryDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderStatusHistoryService {
    private final OrderStatusHistoryDao orderStatusHistoryDao;

    public int setFixedComplete(Long orderDetailId) {
        return orderStatusHistoryDao.insertFixedComplete(orderDetailId);
    }
}
