package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.RecordDAO;
import kr.kh.spring.model.vo.DietVO;

@Service
public class RecordServiceImp implements RecordService{
	
	@Autowired
	RecordDAO recordDAO;

	@Override
	public List<DietVO> selectDietList() {
		return recordDAO.selectDietList();
	}

}
