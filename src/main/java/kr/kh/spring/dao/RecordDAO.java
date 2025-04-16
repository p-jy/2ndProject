package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.model.vo.DietVO;

public interface RecordDAO {

	List<DietVO> selectDietList();

	boolean insertDietPost(@Param("diet")DietVO diet);
    
}