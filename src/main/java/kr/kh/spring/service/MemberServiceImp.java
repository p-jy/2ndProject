package kr.kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.MemberDAO;
import kr.kh.spring.model.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public boolean signup(MemberVO member) {
		if(member == null) {
			return false;
		}
		
		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);
		
		try {
			return memberDao.insertMember(member);
		} catch(Exception e) {
			return false;
		}
	}
	
	@Override
	public MemberVO login(MemberVO member) {
		if(member == null) {
			return null;
		}
		
		MemberVO user = memberDao.selectMember(member.getMe_id());
		
		if(user == null) {
			return null;
		}
		
		if(!passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
			return null;
		}
		return user;
	}

	
}
