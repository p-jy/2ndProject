package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.model.dto.PlanListDTO;
import kr.kh.spring.model.vo.DayVO;
import kr.kh.spring.model.vo.MajorCateVO;
import kr.kh.spring.model.vo.PlanVO;

public interface PlanDAO {

	boolean insertPlan(@Param("plan")PlanVO plan);

	void insertDay(@Param("day")DayVO day, @Param("pl_num")int pl_num);

	List<PlanVO> selectPlanList(String me_id);


}
