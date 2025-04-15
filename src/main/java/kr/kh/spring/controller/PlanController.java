package kr.kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String insertPost(@RequestParam("title") String title, Model model) {
		
		System.out.println("입력한 제목 : " + title);
		model.addAttribute("title", title);
		
		return "redirect:/plan/make";
	}
}
