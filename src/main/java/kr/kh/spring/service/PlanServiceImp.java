package kr.kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.PlanDAO;

@Service
public class PlanServiceImp implements PlanService {
	
	@Autowired
	PlanDAO planDao;
}
