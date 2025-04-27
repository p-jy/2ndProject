package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.SubcateDAO;
import kr.kh.spring.model.vo.SubCateVO;

@Service
public class SubcateServiceImp implements SubcateService{
	
	@Autowired
	SubcateDAO subcateDao;
	
	@Override
	public List<SubCateVO> getMealtimeList() {
		return subcateDao.selectMealtimeList();
	}

	
}
