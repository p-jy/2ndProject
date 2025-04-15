package kr.kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.service.MemberService;
import kr.kh.spring.service.RecordService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	RecordService recordService;
	
	
	
	@GetMapping("/")
	public String selectDiet(Model model) {
		List<DietVO> dietList = recordService.selectDietList();
		model.addAttribute("dietList", dietList);
		return "home";
	}
	
	@GetMapping("/signup")
	public String signup(Model model, String id) {
		model.addAttribute("id", id);
		return "/member/signup";
	}
	
	@PostMapping("/signup")
	public String signup(Model model, MemberVO member) {
		if(memberService.signup(member)) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "회원 가입에 성공했습니다.");
			return "msg/msg";
		} 
		return "redirect:/signup";
	}
	
	@ResponseBody
	@PostMapping("/check/id")
	public boolean checkId(@RequestParam("id") String id) {
		return memberService.checkId(id);
	}
	
	@ResponseBody
	@PostMapping("/check/name")
	public boolean checkName(@RequestParam("name") String name) {
		return memberService.checkName(name);
	}
	
	@ResponseBody
	@PostMapping("/check/phone")
	public boolean checkPhone(@RequestParam("phone") String phone) {
		return memberService.checkPhone(phone);
	}
  
	@GetMapping("/login")
	public String login(Model model, String id) {
		model.addAttribute("id", id);
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String login(Model model, MemberVO member) {
		MemberVO user = memberService.login(member); 
		if(user != null) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "로그인에 성공했습니다.");
			model.addAttribute("user", user);
		}else {
			model.addAttribute("url", "/login?id=" + member.getMe_id());
			model.addAttribute("msg", "로그인에 실패했습니다.");
		}
		return "msg/msg";
	}
	
	@GetMapping("/logout")
	public String logout(Model model, HttpSession session) {
		session.removeAttribute("user");
		
		model.addAttribute("url", "/");
		model.addAttribute("msg", "로그아웃 했습니다.");
		return "msg/msg";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		return "/member/mypage";
	}
	
	@PostMapping("/mypage")
	public String mypage(Model model, MemberVO member, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		if(memberService.updateMember(user, member)) {
			model.addAttribute("msg", "회원 정보를 변경했습니다.");
		}else {
			model.addAttribute("msg", "회원 정보를 변경하지 못했습니다.");
		}
		model.addAttribute("url", "/mypage");
		return "/msg/msg";
	}
	
	@GetMapping("/deleteId")
	public String deleteId() {
		return "/member/deleteId";
	}
	
	@PostMapping("/deleteId")
	public String deleteId(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		session.removeAttribute("user");
		if(user == null) {
			return "redirect:/";
		}
		if(memberService.deleteId(user)) {
			model.addAttribute("msg", "회원 탈퇴 성공");
		} else {
			model.addAttribute("msg", "회원 탈퇴 실패");
		}
		model.addAttribute("url", "/");
		
		return "msg/msg";
	}
}
