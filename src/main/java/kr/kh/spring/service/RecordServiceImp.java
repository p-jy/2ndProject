package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.RecordDAO;
import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.MemberVO;

@Service
public class RecordServiceImp implements RecordService{
	
	@Autowired
	RecordDAO recordDAO;

	@Override
	public List<DietVO> selectDietList() {
		return recordDAO.selectDietList();
	}

	@Override
	public boolean selectDietRecord(MemberVO user, int date) {
		return recordDAO.selectDietRecord(user, date);
	}

}
