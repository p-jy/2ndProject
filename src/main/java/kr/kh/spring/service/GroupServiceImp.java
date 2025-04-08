package kr.kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.GroupDAO;
import kr.kh.spring.model.vo.GroupVO;

@Service
public class GroupServiceImp implements GroupService{

	@Autowired
	GroupDAO groupDao;

	@Override
	public List<GroupVO> selectGroupList() {
		return groupDao.selectGroupList();
	}
}
