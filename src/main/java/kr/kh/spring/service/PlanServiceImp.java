package kr.kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.PlanDAO;
import kr.kh.spring.model.vo.DayVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.PlanVO;

@Service
public class PlanServiceImp implements PlanService {
	
	@Autowired
	PlanDAO planDao;

	@Override
	public boolean insertPlan(PlanVO plan, MemberVO user) {
		if(user == null || plan == null) {
			return false;
		}
		plan.setPl_me_id(user.getMe_id());
		
		boolean res = planDao.insertPlan(plan); 
		if(!res) {
			return false;
		}
		return true;
	}

}
