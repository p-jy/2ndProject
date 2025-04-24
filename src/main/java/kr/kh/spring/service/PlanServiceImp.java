package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.PlanDAO;
import kr.kh.spring.model.dto.PlanListDTO;
import kr.kh.spring.model.vo.DayVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.PlanVO;

@Service
public class PlanServiceImp implements PlanService {
	
	@Autowired
	PlanDAO planDao;

	@Override
	public boolean insertPlan(PlanVO plan, MemberVO user, List<DayVO> dayList) {
		System.out.println(plan);
		if(user == null || plan == null) {
			return false;
		}
		plan.setPl_me_id(user.getMe_id());
		
		boolean res = planDao.insertPlan(plan); 
		if(!res) {
			return false;
		}
		if(dayList == null) {
			return false;
		}
		for (DayVO day : dayList) {
			getdayList(day, plan.getPl_num());
		}
		return true;
	}

	private void getdayList(DayVO day, int pl_num) {
		try {
			planDao.insertDay(day, pl_num);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
