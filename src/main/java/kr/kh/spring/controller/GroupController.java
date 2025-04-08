package kr.kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.service.GroupService;

@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	GroupService groupService;
	
	@GetMapping("/list")
	public String selectGroup(Model model) {
		List<GroupVO> groupList = groupService.selectGroupList();
		model.addAttribute("groupList", groupList);
		return"/group/list";
	}
	
	@GetMapping("/make")
	public String make(Model model) {
		
		return"/group/make";
	}
	
	@GetMapping("/main")
	public String main(Model model) {
		
		return"/group/main";
	}
	
	@GetMapping("/message")
	public String message(Model model) {
		
		return"/group/message";
	}
	
	
	
	
}
