package kr.kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.Pagination.Criteria;
import kr.kh.spring.Pagination.GroupCriteria;
import kr.kh.spring.Pagination.PageMaker;
import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.service.GroupService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	GroupService groupService;
	
	@GetMapping("/list")
	public String selectGroup(Model model, GroupCriteria cri) {
		
		List<GroupVO> groupList = groupService.selectGroupList();
		System.out.println(groupList);
		
		model.addAttribute("groupList", groupList);
		return "/group/list";
	}
	
	@GetMapping("/make")
	public String make(Model model) {
		
		return "/group/make";
	}
	
	@PostMapping("/make")
	public String makeGroup(Model model, GroupVO group, HttpSession session) {
		MemberVO user=(MemberVO) session.getAttribute("user");
		if(groupService.insertGroup(group, user)) {
			model.addAttribute("url", "/group/main");
			model.addAttribute("msg", "그룹을 생성하였습니다.");
		}
		else {
			model.addAttribute("url", "/group/make");
			model.addAttribute("msg", "그룹을 생성하지 못했습니다.");
		}
		
		return "msg/msg";
	}
	
	@GetMapping("/main/{gr_num}")
	public String main(Model model,@PathVariable int gr_num, HttpSession session) {
		//그룹 페이지 가져옴
		GroupVO group = groupService.getGroup(gr_num);
		//화면에 전송
		model.addAttribute("group", group);
		return "/group/main";
	}
	
	
	
	@GetMapping("/message")
	public String message(Model model) {
		
		return "/group/message";
	}
	
	
	
	
}
