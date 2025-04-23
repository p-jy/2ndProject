package kr.kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.PlanVO;
import kr.kh.spring.service.PlanService;

@Controller
@RequestMapping("/plan")
public class PlanController {

	@Autowired
	PlanService planService;
	
	@GetMapping("/make")
	public String insert() {
		
		return "/plan/make";
	}
	
	@PostMapping("/make")
	public String insertPost(PlanVO plan, Model model, HttpSession session) {
		//유저 정보 끌어옴
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(planService.insertPlan(plan, user)) {
			model.addAttribute("plan", plan);
			System.out.println(plan);
			
			return "redirect:/make";
		}
		//계획 만들기 성공 시 메인으로?
		return "redirect:/";		
	}
	
}
