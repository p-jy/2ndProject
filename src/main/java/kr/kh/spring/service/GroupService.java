package kr.kh.spring.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.Pagination.Criteria;
import kr.kh.spring.Pagination.GroupCriteria;
import kr.kh.spring.Pagination.PageMaker;
import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.Group_MemberVO;
import kr.kh.spring.model.vo.MajorCateVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.RuleVO;
import kr.kh.spring.model.vo.Share_RecordVO;

public interface GroupService {

	List<GroupVO> selectGroupList();

	List<RuleVO> allRuleList();
	
	boolean insertGroup(GroupVO group, MemberVO user, List<RuleVO> rule, Group_MemberVO gmVO, List<Share_RecordVO> sr);

	GroupVO getGroup(int gr_num);

	boolean deleteGroup(int gr_num, MemberVO user);

	boolean updateGroup(GroupVO group, MemberVO user, List<RuleVO> ruleList);

	GroupVO getRule(int gr_num);

	List<Group_MemberVO> getMemberList(int gr_num, MemberVO user);

	List<RuleVO> getRuleList(int gr_num);

	boolean inviteMemberToGroup(int gr_num, String inviteId);

	boolean isGroupLeader(int gr_num, String me_id);

	List<Share_RecordVO> getSRList(int gr_num);

	List<MajorCateVO> getMCList();



	

}
