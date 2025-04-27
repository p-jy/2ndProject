package kr.kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.model.dto.RecordDTO;
import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.Diet_PicVO;
import kr.kh.spring.model.vo.InbodyVO;
import kr.kh.spring.model.vo.Inbody_PicVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.WorkoutVO;
import kr.kh.spring.model.vo.Workout_PicVO;

public interface RecordDAO {

	List<DietVO> selectDietList();

	boolean insertDietPost(@Param("diet")DietVO diet);

	List<InbodyVO> selectInbodyList();

	List<WorkoutVO> selectWorkoutList();

	List<RecordDTO> selectAllRecordsList();

	void insertFile(Diet_PicVO fileVo);

	boolean insertInbodyPost(InbodyVO inbody);

	void insertInbodyFile(Inbody_PicVO inbody_PicVO);

	boolean insertWorkoutPost(WorkoutVO workout);

	void insertWorkoutFile(Workout_PicVO workout_PicVO);
    
}