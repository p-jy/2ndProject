package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.PlanDAO;
import kr.kh.spring.model.vo.PlanVO;

@Service
public class PlanServiceImp implements PlanService {
	
	@Autowired
	PlanDAO planDao;

	@Override
	public List<PlanVO> insertPlanList() {
		return planDao.insertPlanList();
	}
}
