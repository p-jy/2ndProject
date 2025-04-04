package kr.kh.spring.service;

import java.util.List;

import kr.kh.spring.model.vo.DietVO;

public interface RecordService {

	List<DietVO> selectDietList();

}
