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
		if(group == null ||
		   group.getGr_name().trim().length() == 0 ||
		   group.getGr_introduction().length() == 0) {
			return false;
		}
		if(user == null) {
			return false;
		}
		group.setGr_me_id(user.getMe_id());
		boolean result =groupDao.insertGroup(group);
		
		if(!result) {
			return false;
		}
		
		return result;
	}

	@Override
	public GroupVO getGroup(int gr_num) {
		
		return groupDao.selectGroup(gr_num);
	}

	

	
}
