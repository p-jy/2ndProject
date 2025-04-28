package kr.kh.spring.controller;

import java.util.List;

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

@Controller
public class StatisticsController {

	@Autowired
	MemberService memberService;
	
	@GetMapping("/statistics")
	public String statistics(Model model, HttpSession session) {
		MemberVO user=(MemberVO) session.getAttribute("user");		
		
		if(user == null) {
			model.addAttribute("url", "/login");
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "msg/msg";
		}
		
		return "/statistics/statistics";
	}
	
	@ResponseBody
	@PostMapping("/chart/diet")
	public List<DietVO> chartDiet(@RequestParam int date, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		String me_id = user.getMe_id();
		return memberService.selectDietList(me_id, date);
	}
	
	@ResponseBody
	@PostMapping("/chart/workout")
	public List<DietVO> chartWorkout(@RequestParam int date, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		String me_id = user.getMe_id();
		return memberService.selectWorkoutList(me_id, date);
	}
	
	@ResponseBody
	@PostMapping("/chart/inbody")
	public List<DietVO> chartInbody(@RequestParam int date, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		String me_id = user.getMe_id();
		return memberService.selectInbodyList(me_id, date);
	}
	
}
