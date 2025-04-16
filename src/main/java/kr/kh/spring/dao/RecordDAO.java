package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.InbodyVO;
import kr.kh.spring.model.vo.WorkoutVO;

public interface RecordDAO {

	List<DietVO> selectDietList();

	boolean insertDietPost(@Param("diet")DietVO diet);

	List<InbodyVO> selectInbodyList();

	List<WorkoutVO> selectWorkoutList();
    
}