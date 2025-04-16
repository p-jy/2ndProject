package kr.kh.spring.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.model.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO member);
	
	MemberVO selectMember(@Param("me_id")String me_id);

	MemberVO selectMemberByName(@Param("me_name")String name);
	
	MemberVO selectMemberByPhone(@Param("me_phone")String phone);

	boolean updateMember(@Param("user")MemberVO user);

	boolean deleteId(@Param("user")MemberVO user);

	MemberVO selectMemberByCookie(@Param("me_cookie")String me_cookie);

	void updateCookie(@Param("user")MemberVO user);
	
}