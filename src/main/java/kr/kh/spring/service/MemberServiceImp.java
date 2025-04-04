package kr.kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.MemberDAO;
import kr.kh.spring.model.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	MemberDAO memberDao;

	@Override
	public MemberVO login(MemberVO member) {
		if(member == null) {
			return null;
		}
		
		MemberVO user = memberDao.selectMember(member.getMe_id());
		
		if(user == null) {
			return null;
		}
		
		if(!member.getMe_pw().equals(user.getMe_pw())) {
			return null;
		}
		return user;
	}
}
