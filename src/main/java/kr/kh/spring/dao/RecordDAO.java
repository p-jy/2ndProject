package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.RecordVO;

public interface RecordDAO {

	List<DietVO> selectDietList();

	List<RecordVO> selectDietRecord(String me_id, int date);

	boolean insertDietPost(@Param("diet")DietVO diet);
    
}