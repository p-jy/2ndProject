package kr.kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String statistics() {
		return "/statistics/statistics";
	}
	
	@ResponseBody
	@PostMapping("/chart/diet")
	public List<DietVO> chartDiet(@RequestParam int date, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		String me_id = user.getMe_id();
		return memberService.selectDietList(me_id, date);
	}
	
}
