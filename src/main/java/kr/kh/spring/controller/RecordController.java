package kr.kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.MemberVO;
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
	
	@PostMapping("/diet")
	public String insertDietPost(DietVO diet, HttpSession session, 
			MultipartFile[] fileList, Model model) {
		
		System.out.println(diet);
		
		MemberVO user = (MemberVO) session.getAttribute("user");
		if(recordService.insertDietPost(diet, user, fileList)) {
			model.addAttribute("url", "/");
	        model.addAttribute("msg", "식단이 기록되었습니다.");
			return "msg/msg";
		}
		return "redirect:/record/diet";
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
