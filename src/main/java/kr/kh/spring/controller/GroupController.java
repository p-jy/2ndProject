package kr.kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.service.GroupService;

@Controller
public class GroupController {
	
	@Autowired
	GroupService groupService;
	
	@GetMapping("/list")
	public String selectGroup(Model model) {
		List<GroupVO> groupList = groupService.selectGroupList();
		return"/group/list";
	}
	
	
}
