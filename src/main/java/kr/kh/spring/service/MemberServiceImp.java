
package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.MemberDAO;
import kr.kh.spring.model.vo.DietVO;
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
		
		MemberVO user = memberDao.selectMember(member.getMe_id());
		if(user != null) {
			return false;
		}
		
		//암호화
		String encodedPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encodedPw);
		return memberDao.insertMember(member);
	}
	
	@Override
	public boolean checkId(String id) {
		MemberVO user = memberDao.selectMember(id);
		return user == null;
	}
	
	@Override
	public boolean checkName(String name) {
		MemberVO user = memberDao.selectMemberByName(name);
		return user == null;
	}
	
	@Override
	public boolean checkPhone(String phone) {
		MemberVO user = memberDao.selectMemberByPhone(phone);
		return user == null;
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

	@Override
	public boolean updateMember(MemberVO user, MemberVO member) {
		if(user == null || member == null ) {
			return false;
		}
		
		user.setMe_name(member.getMe_name());
		if(member.getMe_pw().length() != 0) {
			String encPw = passwordEncoder.encode(member.getMe_pw());
			user.setMe_pw(encPw);
		}
		return memberDao.updateMember(user);
	}

	@Override
	public boolean deleteId(MemberVO user) {
		return memberDao.deleteId(user);
	}

	@Override
	public MemberVO getMemberByCookie(String me_cookie) {
		if(me_cookie == null) {
			return null;
		}
		return memberDao.selectMemberByCookie(me_cookie);
	}

	@Override
	public void updateCookie(MemberVO user) {
		memberDao.updateCookie(user);
	}

	@Override
	public List<DietVO> selectDietList(String me_id, int date) {
		if(me_id == null || me_id == "") {
			return null;
		}
		return memberDao.selectDietList(me_id, date);
	}

	@Override
	public List<MemberVO> getMemberList() {
		
		return memberDao.selectMemberList();
  }
  
  @Override
	public List<DietVO> selectWorkoutList(String me_id, int date) {
		if(me_id == null || me_id == "") {
			return null;
		}
		return memberDao.selectWorkoutList(me_id, date);
	}

	@Override
	public List<DietVO> selectInbodyList(String me_id, int date) {
		if(me_id == null || me_id == "") {
			return null;
		}
		return memberDao.selectInbodyList(me_id, date);

	}

	
	

	
}
