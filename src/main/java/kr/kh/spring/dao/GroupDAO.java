package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.Pagination.Criteria;
import kr.kh.spring.model.vo.GroupVO;

public interface GroupDAO {

	List<GroupVO> selectGroupList();

	boolean insertGroup(@Param("group")GroupVO group);

	GroupVO selectGroup(@Param("gr_num")int gr_num);

	

}
