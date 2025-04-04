package kr.kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.service.RecordService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/record")
public class RecordController {
	
	@Autowired
	RecordService recordService;
	
	@GetMapping("/diet")
	public String selectDiet(Model model) {
		List<DietVO> dietList = recordService.selectDietList();
		model.addAttribute("dietList", dietList);
		return "record/diet";
	}
	
	@GetMapping("/inbody")
	public String selectInbody() {
		return "record/inbody";
	}
	
	@GetMapping("/plan")
	public String selectPlan() {
		return "record/plan";
	}
	
	@GetMapping("/workout")
	public String selectWorkOut() {
		return "record/workout";
	}
	
	
	
}
