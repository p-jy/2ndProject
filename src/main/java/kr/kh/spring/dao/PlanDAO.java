package kr.kh.spring.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.model.vo.PlanVO;

public interface PlanDAO {

	boolean insertPlan(@Param("plan")PlanVO plan);


}
