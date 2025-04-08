package kr.kh.spring.dao;

import java.util.List;

import kr.kh.spring.model.vo.GroupVO;

public interface GroupDAO {

	List<GroupVO> selectGroupList();

}
