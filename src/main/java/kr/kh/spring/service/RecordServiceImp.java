package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

	public boolean insertDietPost(DietVO diet, MemberVO user, MultipartFile[] fileList) {
		if(user == null) {
			return false;
		}

		//diet.setDi_Me_Id("irruyan"); 테스트 코드
		
		diet.setDi_Me_Id(user.getMe_id());
		
		return recordDAO.insertDietPost(diet);
	}

}
