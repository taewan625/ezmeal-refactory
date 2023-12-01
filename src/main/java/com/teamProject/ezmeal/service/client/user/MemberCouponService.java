package com.teamProject.ezmeal.service.client.user;

import com.teamProject.ezmeal.dao.client.user.MemberCouponDao;
import com.teamProject.ezmeal.domain.client.user.MemberCouponDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberCouponService {
    private final MemberCouponDao memberCouponDao;

    // 사용한 쿠폰의 pk 가져올려고 생성
    public MemberCouponDto getMemberCoupon (Long memberCouponId){
        return memberCouponDao.selectMemberCoupon(memberCouponId);
    }
}
