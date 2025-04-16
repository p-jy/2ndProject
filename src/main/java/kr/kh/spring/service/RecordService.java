package kr.kh.spring.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.MemberVO;

public interface RecordService {

	List<DietVO> selectDietList();

	boolean selectDietRecord(MemberVO user, int date);
  
	boolean insertDietPost(DietVO diet, MemberVO user, MultipartFile[] fileList);

}
