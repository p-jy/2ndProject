package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.Pagination.Criteria;
import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.Group_MemberVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.RuleVO;

public interface GroupDAO {

	List<GroupVO> selectGroupList();
	
	List<RuleVO> getAllRuleList();

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

	boolean GroupMember(@Param("gmVO")Group_MemberVO gmVO);

	List<Group_MemberVO> selectMemberList(@Param("gr_num")int gr_num,@Param("user")MemberVO user);

	int countByGroupCode(@Param("code")String code);

	List<RuleVO> selectRuleList(@Param("gr_num")int gr_num);

	void insertRule1(@Param("dbrule")RuleVO dbrule,@Param("gr_num") int gr_num);

	void updateRule1(@Param("dbrule")RuleVO dbrule, @Param("rl_gr_num")int rl_gr_num);

	

	

}
