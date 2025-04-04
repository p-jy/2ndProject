package kr.kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
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
			model.addAttribute("msg", "로그인 성공");
			model.addAttribute("user", user);
		} else {
			model.addAttribute("url", "/login?id=" + member.getMe_id());
			model.addAttribute("msg", "로그인에 실패했습니다.");
		}
		
		return "message";
	}
	
}
