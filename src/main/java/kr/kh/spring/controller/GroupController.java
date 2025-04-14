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
	
	//그룹 리스트 출력
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
	
	//그룹 만들기
	@PostMapping("/make")
	public String makeGroup(Model model, GroupVO group, HttpSession session) {
		//유저 정보 호출
		MemberVO user=(MemberVO) session.getAttribute("user");
		//방 만들기
		if(groupService.insertGroup(group, user)) {
			model.addAttribute("url", "/group/main");
			model.addAttribute("msg", "그룹을 생성하였습니다.");
		}
		//방 만들기 실패했을 경우
		else {
			model.addAttribute("url", "/group/make");
			model.addAttribute("msg", "그룹을 생성하지 못했습니다.");
		}
		
		return "msg/msg";
	}
	
	//그룹 출력
	@GetMapping("/main/{gr_num}")
	public String main(Model model,@PathVariable int gr_num, HttpSession session) {
		//그룹 페이지 가져옴
		GroupVO group = groupService.getGroup(gr_num);
		//화면에 전송
		model.addAttribute("group", group);
		return "/group/main";
	}
	//그룹 삭제하기(작성중)
	@GetMapping("/delete/{gr_num}")
	public String groupDelete(Model model, @PathVariable("gr_num")int gr_num, HttpSession session) {
		//유저 정보 호출
		MemberVO user=(MemberVO) session.getAttribute("user");
		if(groupService.deleteGroup(gr_num,user)) {
			model.addAttribute("url", "/group/list");
			model.addAttribute("msg", "그룹이 삭제되었습니다.");
		}
		else {
			model.addAttribute("url", "/group/main"+gr_num);
			model.addAttribute("msg", "그룹 삭제 실패");
		}
		return "/msg/msg";
	}
	//그룹 내용 수정하기(가져오기)
	@GetMapping("/remake/{gr_num}")
	public String groupRemake(Model model, @PathVariable("gr_num")int gr_num, HttpSession session) {
		//그룹 정보 호출
		GroupVO group =groupService.getGroup(gr_num);
		//유저 정보 호출
		MemberVO user=(MemberVO) session.getAttribute("user");
		//로그인이 안되어있거나 그룹이 존재하지 않거나, 그룹장이 아닌경우
		if(group == null || user == null || !group.getGr_me_id().equals(user.getMe_id())) {
			model.addAttribute("url", "/group/list");
			model.addAttribute("msg", "이 기능은 그룹장만 사용할 수 있습니다.");
			return "/msg/msg";
		}
		
		model.addAttribute("group", group);
		return "/msg/msg";
	}
	
	//그룹 내용 수정하기(재작성)
	@PostMapping("/remake")
	public String remakeGroup(Model model, GroupVO group, 
			HttpSession session) {
		//유저 정보 호출
		MemberVO user=(MemberVO) session.getAttribute("user");
		//방 만들기
		if(groupService.updateGroup(group, user)) {
			model.addAttribute("msg", "그룹을 수정하였습니다.");
		}
		//방 만들기 실패했을 경우
		else {
			model.addAttribute("msg", "그룹을 생성하지 못했습니다.");
		}
		model.addAttribute("url","/group/main"+group.getGr_num());
		return "msg/msg";
	}
	
	
	
	@GetMapping("/message")
	public String message(Model model) {
		
		return "/group/message";
	}
	
	
	
	
}
