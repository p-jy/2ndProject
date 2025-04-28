package kr.kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String selectDiet(Model model, HttpSession session) {
		
		return "home";
	}

	@GetMapping("/signup")
	public String signup(Model model, String id) {
		model.addAttribute("id", id);
		return "/member/signup";
	}

	@PostMapping("/signup")
	public String signup(Model model, MemberVO member) {
		if (memberService.signup(member)) {
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
	public String login(HttpServletRequest request) {
		// 이전 URL을 가져옴
		String prevUrl = request.getHeader("Referer");
		// 이전 URL이 있고, /login이 아니면 세션에 저장
		if (prevUrl != null && !prevUrl.contains("/login")) {
			request.getSession().setAttribute("prevUrl", prevUrl);
			System.out.println(prevUrl);
		}
		return "/member/login";
	}

	@PostMapping("/login")
	public String login(Model model, MemberVO member) {
		MemberVO user = memberService.login(member);
		if (user == null) {
			return "redirect:/login";
		}
		user.setAuto(member.isAuto());
		// 가져온 회원 정보를 인터셉터에게 전달
		model.addAttribute("user", user);
		return "msg/msg";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		// 세션에 있는 user를 삭제
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("user");
		session.removeAttribute("user");
		if (user != null) {
			user.setMe_cookie(null);
			memberService.updateCookie(user);
		}
		return "redirect:/";
	}

	@GetMapping("/mypage")
	public String mypage() {
		return "/member/mypage";
	}

	@PostMapping("/mypage")
	public String mypage(Model model, MemberVO member, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		if (memberService.updateMember(user, member)) {
			model.addAttribute("msg", "회원 정보를 변경했습니다.");
		} else {
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
		if (user == null) {
			return "redirect:/";
		}
		if (memberService.deleteId(user)) {
			model.addAttribute("msg", "회원 탈퇴 성공");
		} else {
			model.addAttribute("msg", "회원 탈퇴 실패");
		}
		model.addAttribute("url", "/");

		return "msg/msg";
	}
}
