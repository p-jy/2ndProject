package kr.kh.spring.dao;

import java.util.List;

import kr.kh.spring.model.vo.DietVO;

public interface RecordDAO {

	List<DietVO> selectDietList();
    
}