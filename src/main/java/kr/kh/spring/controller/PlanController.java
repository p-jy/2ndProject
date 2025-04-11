package kr.kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kh.spring.model.vo.PlanVO;
import kr.kh.spring.service.PlanService;

@Controller
@RequestMapping("/plan")
public class PlanController {

	@Autowired
	PlanService planService;
	
	@GetMapping("/make")
	public String plan(Model model, PlanVO plan) {
		
		List<PlanVO> planList = planService.insertPlanList();
		
		model.addAttribute("planList", planList);
		
		return "/plan/make";
	}
}
