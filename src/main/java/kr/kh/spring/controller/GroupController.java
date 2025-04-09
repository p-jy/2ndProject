package kr.kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.Pagination.Criteria;
import kr.kh.spring.Pagination.PageMaker;
import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.service.GroupService;

@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	GroupService groupService;
	
	@GetMapping("/list")
	public String selectGroup(Model model, Criteria cri) {
		List<GroupVO> groupList = groupService.selectGroupList();
		model.addAttribute("groupList", groupList);
		return "/group/list";
	}
	
	@GetMapping("/make")
	public String make(Model model) {
		
		return "/group/make";
	}
	
	@PostMapping("/make")
	public String makeGroup(Model model, GroupVO group, HttpSession session, MultipartFile[] fileList) {
		MemberVO user=(MemberVO) session.getAttribute("user");
		if(groupService.insertGroup(group, user, fileList)) {
			model.addAttribute("url", "/group/main");
			model.addAttribute("msg", "그룹을 생성하였습니다.");
		}
		else {
			model.addAttribute("url", "/group/make");
			model.addAttribute("msg", "그룹을 생성하지 못했습니다.");
		}
		
		return "message";
	}
	
	@GetMapping("/main")
	public String main(Model model) {
		
		return "/group/main";
	}
	
	
	
	@GetMapping("/message")
	public String message(Model model) {
		
		return "/group/message";
	}
	
	
	
	
}
