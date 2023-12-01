package com.teamProject.ezmeal.service.admin;

import com.teamProject.ezmeal.dao.admin.AdminMemberDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AdminLoginService {

    private final AdminMemberDao adminMemberDao;

    public int getEmpId(String id) {
        return adminMemberDao.selectEmpId(id);
    }

}
