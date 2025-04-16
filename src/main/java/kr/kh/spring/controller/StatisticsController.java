package kr.kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.service.RecordService;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {

	@Autowired
	RecordService recordService;
	
	@GetMapping("")
	public String statistics() {
		return "/statistics/statistics";
	}
	
	@ResponseBody
	@PostMapping("/chart/diet")
	public boolean chartDiet(@RequestParam("date") int date, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		return recordService.selectDietRecord(user, date);
	}
	
}
