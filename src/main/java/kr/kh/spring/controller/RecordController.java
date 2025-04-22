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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.model.vo.DietVO;
import kr.kh.spring.model.vo.InbodyVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.WorkoutVO;
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
	public String selectDietPost(Model model) {
		return "record/diet";
	}
	
	@GetMapping("/inbody")
	public String selectInbody(Model model) {
		List<InbodyVO> inbodyList = recordService.selectInbodyList();
		model.addAttribute("inbodyList", inbodyList);
		return "record/inbody";
	}
	
	@GetMapping("/workout")
	public String selectWorkout(Model model) {
		List<WorkoutVO> workoutList = recordService.selectWorkoutList();
		model.addAttribute("workoutList", workoutList);
		return "record/workout";
	}

	@GetMapping("/plan")
	public String selectPlan(Model model) {		
		return "record/plan";
	}
	
	@GetMapping("/insertDiet")
	public String insertDiet(Model model) {
		return "record/insertDiet";
	}
	
	@PostMapping("/insertDiet")
	public String insertDietPost(@ModelAttribute DietVO diet, HttpSession session, 
			MultipartFile[] fileList, Model model) {
		
		MemberVO user = (MemberVO) session.getAttribute("user");
		if(user == null) {
			model.addAttribute("url", "/login");
			model.addAttribute("msg", "로그인해주세요.");
			return "msg/msg";
		}
		
		if(recordService.insertDietPost(diet, user, fileList)) {
			System.out.println(diet);
			model.addAttribute("url", "/");
	        model.addAttribute("msg", "식단이 기록되었습니다.");
			return "msg/msg";
		}
		return "redirect:/record/diet";
	}
	
	
}
