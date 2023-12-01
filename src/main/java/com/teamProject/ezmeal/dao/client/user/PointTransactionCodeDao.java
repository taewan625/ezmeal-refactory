package com.teamProject.ezmeal.dao.client.user;

import com.teamProject.ezmeal.domain.client.user.PointTransactionCodeDto;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class PointTransactionCodeDao {
    private final SqlSession session;
    private static final String namespace = "pointTransactionCode.";

    public PointTransactionCodeDto selectUsePointInfo(String pntTrjsCd){
        return session.selectOne(namespace + "selectUsePoint", pntTrjsCd);
    }
}
