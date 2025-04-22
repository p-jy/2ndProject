package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.dao.RecordDAO;
import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.InbodyVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.WorkoutVO;
import kr.kh.spring.model.vo.RecordVO;

@Service
public class RecordServiceImp implements RecordService{
	
	@Autowired
	RecordDAO recordDAO;

	@Override
	public List<DietVO> selectDietList() {
		return recordDAO.selectDietList();
	}

	public boolean insertDietPost(DietVO diet, MemberVO user, MultipartFile[] fileList) {
		if(user == null) {
			return false;
		}

		//diet.setDi_Me_Id("irruyan"); 테스트 코드
		
		diet.setDi_me_id(user.getMe_id());
		
		return recordDAO.insertDietPost(diet);
	}

	@Override
	public List<InbodyVO> selectInbodyList() {
		return recordDAO.selectInbodyList();
	}

	@Override
	public List<WorkoutVO> selectWorkoutList() {
		return recordDAO.selectWorkoutList();
	}

}
