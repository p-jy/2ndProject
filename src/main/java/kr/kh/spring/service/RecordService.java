package kr.kh.spring.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.InbodyVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.WorkoutVO;

public interface RecordService {

	List<DietVO> selectDietList();
  
	boolean insertDietPost(DietVO diet, MemberVO user, MultipartFile[] fileList);

	List<InbodyVO> selectInbodyList();

	List<WorkoutVO> selectWorkoutList();

}
