package com.teamProject.ezmeal.service;

import com.teamProject.ezmeal.domain.admin.AdminMemberDto;
import com.teamProject.ezmeal.service.admin.AdminMemberService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class AdminMemberServiceTest {
    
    @Autowired
    AdminMemberService adminMemberService;
    
    @Test
    public void getLoginAdminInfo() {
        AdminMemberDto loginAdminInfo = adminMemberService.getLoginAdminInfo(18);
        System.out.println("loginAdminInfo = " + loginAdminInfo);
    }
    
    @Test
    public void selectMemberList(){
//        List<Map> memberList = adminMemberService.getMemberList();
//        System.out.println("memberList.get(0) = " + memberList.get(0));
    }
}