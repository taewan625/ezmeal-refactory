package com.teamProject.ezmeal.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CartDaoTest {
    @Autowired
    private CartDao cartDao;

    @Test
    public void getCartSeq() {
        Long cartSeq = cartDao.selectCartSeq(1001L);
        assertEquals((long)cartSeq, 1L);
    }
}