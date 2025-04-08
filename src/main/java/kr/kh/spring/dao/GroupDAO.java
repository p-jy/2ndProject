package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.model.vo.GroupVO;

public interface GroupDAO {

	List<GroupVO> selectGroupList();

	boolean insertGroup(@Param("group")GroupVO group);

}
