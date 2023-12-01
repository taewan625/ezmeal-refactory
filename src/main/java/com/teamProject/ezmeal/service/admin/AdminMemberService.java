package com.teamProject.ezmeal.service.admin;


import com.teamProject.ezmeal.dao.admin.AdminMemberDao;
import com.teamProject.ezmeal.domain.admin.AdminMemberDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AdminMemberService {

    private final AdminMemberDao adminMemberDao;

    // 로그인 한 관리자 정보 조회
    public AdminMemberDto getLoginAdminInfo(int empId) {
        return adminMemberDao.selectLoginAdminInfo(empId);
    }

    // 회원 목록 조회
    public List<Map<String, Object>> getMemberList(){
        return adminMemberDao.selectMemberList();
    }

    // 동적으로 조건에 따라 회원 정보 조회
    public List<Map<String, Object>> getMembers(Map<String, String> memberMap) {
        try {
            return adminMemberDao.selectMembers(memberMap);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

}
