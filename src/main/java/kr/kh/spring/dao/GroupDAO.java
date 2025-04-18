package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.Pagination.Criteria;
import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.Group_MemberVO;

public interface GroupDAO {

	List<GroupVO> selectGroupList();

	boolean insertGroup(@Param("group")GroupVO group);

	GroupVO selectGroup(@Param("gr_num")int gr_num);

	boolean deleteGroup(@Param("gr_num")int gr_num);

	boolean updateGroup(@Param("group")GroupVO group);

	boolean insertRule(@Param("group")GroupVO group);

	boolean insertShareRecode(@Param("group")GroupVO group);

	boolean insertGroupGoal(@Param("group")GroupVO group);

	boolean updateRule(@Param("group")GroupVO group);

	boolean updateShareRecode(@Param("group")GroupVO group);

	boolean updateGroupGoal(@Param("group")GroupVO group);

	GroupVO selectRule(@Param("gr_num")int gr_num);

	boolean GroupMember(@Param("group")GroupVO group);

	List<Group_MemberVO> selectMemberList(@Param("gr_num")int gr_num);

	

	

}
