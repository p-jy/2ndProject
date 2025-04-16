package kr.kh.spring.dao;

import java.util.List;

import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.MemberVO;

public interface RecordDAO {

	List<DietVO> selectDietList();

	boolean selectDietRecord(MemberVO user, int date);
    
}