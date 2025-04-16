package kr.kh.spring.service;

import kr.kh.spring.model.vo.DayVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.PlanVO;

public interface PlanService {

	boolean insertPlan(PlanVO plan, MemberVO user);


}
