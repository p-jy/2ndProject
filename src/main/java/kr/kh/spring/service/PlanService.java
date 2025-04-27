package kr.kh.spring.service;

import java.util.List;

import kr.kh.spring.model.dto.PlanListDTO;
import kr.kh.spring.model.vo.DayVO;
import kr.kh.spring.model.vo.MajorCateVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.PlanVO;

public interface PlanService {

	boolean insertPlan(PlanVO plan, MemberVO user, List<DayVO> dayList);

	List<PlanVO> selectPlanList(String me_id);


}
