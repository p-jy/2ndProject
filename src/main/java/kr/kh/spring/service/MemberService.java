package kr.kh.spring.service;

import kr.kh.spring.model.vo.MemberVO;

public interface MemberService {
	
	boolean signup(MemberVO member);
	
	MemberVO login(MemberVO member);

	boolean checkId(String id);

	boolean checkName(String name);
	
	boolean checkPhone(String phone);

	boolean updateMember(MemberVO user, MemberVO member);

	boolean deleteId(MemberVO user);

	MemberVO getMemberByCookie(String me_cookie);

	void updateCookie(MemberVO user);
}
