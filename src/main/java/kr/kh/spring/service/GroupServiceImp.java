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
		
		//규칙 테이블에 집어넣을 내용
		group.setRl_gr_num(group.getGr_num());
		boolean resultRule = groupDao.insertRule(group);
		//공유 기록에 집어넣을 내용
		group.setSr_gr_num(group.getGr_num());
		boolean resultS_Recode = groupDao.insertShareRecode(group);	
		//그룹 목표에 집어넣을 내용
		group.setGg_gr_num(group.getGg_gr_num());
		boolean resultGroupGoal = groupDao.insertGroupGoal(group); 
		//
		if(!resultGroup || !resultRule ||
		   !resultS_Recode || !resultGroupGoal) {
			return false;
		}
		
		return true;
	}

	@Override
	public GroupVO getGroup(int gr_num) {
		
		return groupDao.selectGroup(gr_num);
	}

	@Override
	public boolean deleteGroup(int gr_num, MemberVO user) {
		if(user == null) {
			return false;
		}
		GroupVO group = groupDao.selectGroup(gr_num);
		if(group == null || !group.getGr_me_id().equals(user.getMe_id())) {
			return false;
		}
		//그룹 삭제(공개여부 => "N"으로 변경 및 정원수 입장한 맴버수 모두 0으로 변경)
		boolean result = groupDao.deleteGroup(gr_num);
		if(!result) {
			return false;
		}
		
		return true;
	}

	@Override
	public boolean updateGroup(GroupVO group, MemberVO user) {
		if(user == null || group == null ||
		   group.getGr_name().trim().length()==0||
		   group.getGr_introduction().length() == 0) {
			return false;
		}
		GroupVO dbGroup = groupDao.selectGroup(group.getGr_num());
		if(dbGroup == null || 
		   !dbGroup.getGr_me_id().equals(user.getMe_id())) {
			return false;
		}
		//그룹 테이블에 집어넣을 내용
		boolean result =groupDao.updateGroup(group);
		if(!result) {
			return false;
		}
		//규칙 테이블에 집어넣을 내용
		
		//공유 기록에 집어넣을 내용
		
		//그룹 목표에 집어넣을 내용
		return true;
	}

	

	
}
