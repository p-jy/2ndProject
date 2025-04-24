package kr.kh.spring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.spring.Pagination.Criteria;
import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.Group_MemberVO;
import kr.kh.spring.model.vo.MajorCateVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.RuleVO;
import kr.kh.spring.model.vo.Share_RecordVO;

public interface GroupDAO {

	List<GroupVO> selectGroupList();
	
	List<RuleVO> getAllRuleList();

	boolean insertGroup(@Param("group")GroupVO group);

	GroupVO selectGroup(@Param("gr_num")int gr_num);

	boolean deleteGroup(@Param("gr_num")int gr_num);

	boolean updateGroup(@Param("group")GroupVO group);

	boolean insertRule(@Param("group")GroupVO group);

	boolean updateRule(@Param("group")GroupVO group);

	GroupVO selectRule(@Param("gr_num")int gr_num);

	boolean GroupMember(@Param("gmVO")Group_MemberVO gmVO);

	List<Group_MemberVO> selectMemberList(@Param("gr_num")int gr_num,@Param("user")MemberVO user);

	int countByGroupCode(@Param("code")String code);

	List<RuleVO> selectRuleList(@Param("gr_num")int gr_num);
	
	//규칙 삽입
	void insertRule1(@Param("dbrule")RuleVO dbrule,@Param("gr_num") int gr_num);
	//규칙 수정(아직 해결x)
	void updateRule1(@Param("dbrule")RuleVO dbrule, @Param("rl_gr_num")int rl_gr_num);

	boolean isMemberInGroup(@Param("gr_num")int gr_num, @Param("me_id")String me_id);

	boolean insertGroupMember(@Param("gm")Group_MemberVO gm);

	void updateParticipant(@Param("gr_num")int gr_num);

	List<MajorCateVO> selectMajorCateList();

	List<Share_RecordVO> selectSRList(@Param("gr_num")int gr_num);

	void insertSR(@Param("dbsr")Share_RecordVO dbsr, @Param("gr_num")int gr_num);

	

	

}
