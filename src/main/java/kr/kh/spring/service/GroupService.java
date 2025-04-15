package kr.kh.spring.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.Pagination.Criteria;
import kr.kh.spring.Pagination.GroupCriteria;
import kr.kh.spring.Pagination.PageMaker;
import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.MemberVO;

public interface GroupService {

	List<GroupVO> selectGroupList();

	boolean insertGroup(GroupVO group, MemberVO user);

	GroupVO getGroup(int gr_num);

	boolean deleteGroup(int gr_num, MemberVO user);

	boolean updateGroup(GroupVO group, MemberVO user);

	

}
