package kr.kh.spring.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.model.dto.RecordDTO;
import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.InbodyVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.WorkoutVO;

public interface RecordService {

	List<DietVO> selectDietList(String me_id);
  
	boolean insertDietPost(DietVO diet, MemberVO user, MultipartFile file);

	List<InbodyVO> selectInbodyList(String me_id);

	List<WorkoutVO> selectWorkoutList(String me_id);

	List<RecordDTO> getAllRecords(String date);

	boolean insertInbodyPost(InbodyVO inbody, MemberVO user, MultipartFile file);

	boolean insertWorkoutPost(WorkoutVO workout, MemberVO user, MultipartFile file);

}
