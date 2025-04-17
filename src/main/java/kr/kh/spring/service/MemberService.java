package kr.kh.spring.service;

import java.util.List;

import kr.kh.spring.model.vo.DietVO;
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

	List<DietVO> selectDietList(String me_id, int date);

	List<MemberVO> getMemberList();
}
