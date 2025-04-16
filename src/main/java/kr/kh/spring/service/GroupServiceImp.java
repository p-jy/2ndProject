package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.Pagination.Criteria;
import kr.kh.spring.Pagination.PageMaker;
import kr.kh.spring.dao.GroupDAO;
import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.MemberVO;

@Service
public class GroupServiceImp implements GroupService{

	@Autowired
	GroupDAO groupDao;

	@Override
	public List<GroupVO> selectGroupList() {
		return groupDao.selectGroupList();
	}

	@Override
	public boolean insertGroup(GroupVO group, MemberVO user) {
		if(group == null) {
			return false;
		}
		if(user == null) {
			return false;
		}
		
		//그룹 테이블에 집어넣을 내용
		group.setGr_me_id(user.getMe_id());
		boolean resultGroup =groupDao.insertGroup(group);
		if(!resultGroup) {
			return false;
		}
		System.out.println(group);
		//규칙 테이블에 집어넣을 내용
		group.setRl_gr_num(group.getGr_num());
		boolean resultRule = groupDao.insertRule(group);
		if(!resultRule) {
			return false;
		}
		System.out.println(group);
		//공유 기록에 집어넣을 내용
		/*
		group.setSr_gr_num(group.getGr_num());
		boolean resultS_Recode = groupDao.insertShareRecode(group);
		if(resultS_Recode) {
			return false;
		}
		*/
		//그룹 목표에 집어넣을 내용
		/*
		group.setGg_gr_num(group.getGg_gr_num());
		boolean resultGroupGoal = groupDao.insertGroupGoal(group); 
		if(!resultGroupGoal) {
			return false;
		}
		*/
		
		
		
		return true;
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
	public boolean updateGroup(GroupVO group, MemberVO user) {
		if(user == null || group == null) {
			return false;
		}
		GroupVO dbGroup = groupDao.selectGroup(group.getGr_num());
		
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
		boolean resultRule = groupDao.updateRule(group);
		if(!resultRule) {
			return false;
		}
		System.out.println(group);
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

	

	
}
