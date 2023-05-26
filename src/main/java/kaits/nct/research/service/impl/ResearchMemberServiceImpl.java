package kaits.nct.research.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kaits.nct.common.model.PagingVO;
import kaits.nct.common.utility.DataScrty;
import kaits.nct.research.mapper.ResearchMemberMapper;
import kaits.nct.research.model.ResearchMemberVO;
import kaits.nct.research.service.ResearchMemberService;

@Service
public class ResearchMemberServiceImpl implements ResearchMemberService {
	
	
	@Resource(name = "researchMemberMapper")
	private ResearchMemberMapper researchMemberMapper;

	/**
	 * 로그인 처리
	 */
	@Override
	public ResearchMemberVO ResearchLoginCheck(ResearchMemberVO member) {
		// TODO Auto-generated method stub
        try {
            String encPw = DataScrty.encryptPassword(member.getRscMemPassword());
            member.setRscMemPassword(encPw);
            ResearchMemberVO loginMember = researchMemberMapper.ResearchLoginCheck(member);
            return loginMember;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
	}
}