package kr.kh.spring.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.Pagination.Criteria;
import kr.kh.spring.Pagination.PageMaker;
import kr.kh.spring.dao.GroupDAO;
import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.Group_MemberVO;
import kr.kh.spring.model.vo.MajorCateVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.RuleVO;
import kr.kh.spring.model.vo.Share_RecordVO;

@Service
public class GroupServiceImp implements GroupService{

	@Autowired
	GroupDAO groupDao;

	@Override
	public List<GroupVO> selectGroupList() {
		return groupDao.selectGroupList();
	}

	@Override
	public List<Share_RecordVO> getSRList(int gr_num) {
		
		return groupDao.selectSRList(gr_num);
	}

	@Override
	public List<MajorCateVO> getMCList() {
		
		return groupDao.selectMajorCateList();
		//return null;
	}

	@Override
	public boolean insertGroup(GroupVO group, MemberVO user, List<RuleVO> rule,
			Group_MemberVO gmVO, List<Share_RecordVO> sr) {
		if(group == null) {
			return false;
		}
		if(user == null) {
			return false;
		}
		if(group.getGr_name()==null) {
			return false;
		}
		//해당 객체에 코드를 부여
		group.setGr_code(generateUniqueGroupCode());
		//그룹 테이블에 집어넣을 내용
		
		//해당 그룹테이블 기본키를 가져옴
		group.setGr_me_id(user.getMe_id());				
		boolean resultGroup =groupDao.insertGroup(group);
		if(!resultGroup) {
			return false;
		}
		System.out.println(group);
		//규칙 테이블에 집어넣을 내용
		if(rule == null) {
			return false;
		}
		for(RuleVO dbrule : rule) {
			
			getRule(dbrule,group.getGr_num());
		}
		/*
		group.setRl_gr_num(group.getGr_num());
		boolean resultRule = groupDao.insertRule(group);
		if(!resultRule) {
			return false;
		}
		*/
		
		System.out.println(group);
		//공유 기록에 집어넣을 내용
		if(sr==null) {
			return false;
		}
		for(Share_RecordVO dbsr : sr) {
			getSr(dbsr,group.getGr_num());
		}
		
		//그룹 목표에 집어넣을 내용
		/*
		group.setGg_gr_num(group.getGg_gr_num());
		boolean resultGroupGoal = groupDao.insertGroupGoal(group); 
		if(!resultGroupGoal) {
			return false;
		}
		*/
		gmVO.setGm_me_id(user.getMe_id());
		gmVO.setGm_gr_num(group.getGr_num());
		
		boolean groupmember = groupDao.GroupMember(gmVO);
		if(!groupmember) {
			return false;
		}
		
		return true;
	}

	

	private void getSr(Share_RecordVO dbsr, int gr_num) {
		try {
			groupDao.insertSR(dbsr,gr_num);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	private void getRule(RuleVO dbrule, int gr_num) {
		try {
			groupDao.insertRule1(dbrule,gr_num);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	private String generateUniqueGroupCode() {
		 String code;
		    do {
		        code = generateGroupCode(); // 6자리 랜덤 코드 생성
		    } while (groupDao.countByGroupCode(code) > 0); // DB에 이미 존재하는지 체크
		    return code;
	}

	private String generateGroupCode() {
		 int length = 6;
		 String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		 StringBuilder code = new StringBuilder();

		 Random rnd = new Random();
		 for (int i = 0; i < length; i++) {
		     code.append(chars.charAt(rnd.nextInt(chars.length())));
		 }

		 return code.toString();
	}

	@Override
	public List<RuleVO> allRuleList() {
		
		return groupDao.getAllRuleList();
	}

	@Override
	public List<RuleVO> getRuleList(int gr_num) {
		
		return groupDao.selectRuleList(gr_num);
	}

	@Override
	public GroupVO getGroup(int gr_num) {
		
		return groupDao.selectGroup(gr_num);
	}

	@Override
	public GroupVO getRule(int gr_num) {
		
		return groupDao.selectRule(gr_num);
	}

	@Override
	public boolean deleteGroup(int gr_num, MemberVO user) {
		if(user == null) {
			return false;
		}
		//그룹 정보 가져옴
		GroupVO group = groupDao.selectGroup(gr_num);
		//해당 그룹의 그룹장과 유저가 다르면 false로 리턴 
		if(group == null || !group.getGr_me_id().equals(user.getMe_id())) {
			return false;
		}
		//그룹 삭제(공개여부 => "N", 삭제여부 => "Y"으로 변경 및 null값으로 처리 가능한 값들을 모두 null값으로 처리)
		boolean result = groupDao.deleteGroup(gr_num);
		if(!result) {
			return false;
		}
		
		return true;
	}

	@Override
	public boolean updateGroup(GroupVO group, MemberVO user ,List<RuleVO> ruleList) {
		if(user == null || group == null) {
			return false;
		}
		GroupVO dbGroup = groupDao.selectGroup(group.getGr_num());
		System.out.println(dbGroup);
		if(dbGroup == null || 
		   !dbGroup.getGr_me_id().equals(user.getMe_id())) {
			return false;
		}
		System.out.println(dbGroup);
		//그룹 테이블에 수정할 내용
		boolean result =groupDao.updateGroup(group);
		if(!result) {
			return false;
		}
		System.out.println(group);
		//규칙 테이블에 수정할 내용
		if(ruleList == null) {
			return false;
		}
		for(RuleVO dbrule : ruleList) {
			System.out.println(dbrule);
			dbrule.setRl_num(dbGroup.getGr_num());
			dbrule.setRl_gr_num(dbGroup.getGr_num());
			if(dbrule.getRl_gr_num() == dbGroup.getGr_num()) {
				System.out.println(dbrule);
				updateRule(dbrule,dbrule.getRl_gr_num());
				System.out.println("------");
				System.out.println(dbrule);
			}
			
		}
		/*
		boolean resultRule = groupDao.updateRule(group);
		if(!resultRule) {
			return false;
		}
		System.out.println(group);
		 
		*/
		
		//공유 기록에 수정할 내용
		/*
		 boolean resultS_Recode = groupDao.updateShareRecode(group);	
		 if(!resultS_Recode) {
			 return false;
		 }
		 */
		//그룹 목표에 수정할 내용
		/*
		boolean resultGroupGoal = groupDao.updateGroupGoal(group);
		if(!resultGroupGoal) {
			return false;
		}
		*/
		return true;
	}

	private void updateRule(RuleVO dbrule, int rl_gr_num) {
		try {
			groupDao.updateRule1(dbrule,rl_gr_num);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Group_MemberVO> getMemberList(int gr_num, MemberVO user) {
		if(gr_num == 0 || user == null) {
			return null;
		}
		
		return groupDao.selectMemberList(gr_num, user);
	}

	@Override
	public boolean inviteMemberToGroup(int gr_num, String me_id) {
		if(groupDao.isMemberInGroup(gr_num, me_id)) {
			return false;
		}
		Group_MemberVO gm = new Group_MemberVO();
		gm.setGm_gr_num(gr_num);
		gm.setGm_me_id(me_id);
		if(!groupDao.insertGroupMember(gm)) {
			return false;
		}
		groupDao.updateParticipant(gr_num);
		
		
		return true;
	}

	@Override
	public boolean isGroupLeader(int gr_num, String me_id) {
		GroupVO group = groupDao.selectGroup(gr_num);
		return group != null && group.getGr_me_id().equals(me_id);
	}

	
	

	

	
}
