package kr.kh.spring.controller;

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

import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
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
  
	@GetMapping("/login")
	public String login(HttpServletRequest request) {
		//이전 URL을 가져옴
		String prevUrl = request.getHeader("Referer");
		//이전 URL이 있고, /login이 아니면 세션에 저장
		if(prevUrl != null && !prevUrl.contains("/login")) {
			request.getSession().setAttribute("prevUrl", prevUrl);
			System.out.println(prevUrl);
		}
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
	
	@GetMapping
	public String logout(Model model, HttpSession session) {
		session.removeAttribute("user");
		
		model.addAttribute("url", "/");
		model.addAttribute("msg", "로그아웃 했습니다.");
		return "msg/msg";
	}
}
