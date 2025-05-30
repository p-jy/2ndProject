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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.spring.model.dto.RecordDTO;
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
	public String selectDiet(Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		if (user == null) {
			return "";
		}
		
		List<DietVO> dietList = recordService.selectDietList(user.getMe_id());
		model.addAttribute("dietList", dietList);
		return "record/diet";
	}

	@PostMapping("/diet")
	public String selectDietPost(Model model) {
		return "record/diet";
	}

	@GetMapping("/calendar/list")
	@ResponseBody
	public List<RecordDTO> getAllRecords(@RequestParam String date) {
		return recordService.getAllRecords(date);
	}

	@GetMapping("/inbody")
	public String selectInbody(Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		if (user == null) {
			return "";
		}
		
		List<InbodyVO> inbodyList = recordService.selectInbodyList(user.getMe_id());
		model.addAttribute("inbodyList", inbodyList);
		return "record/inbody";
	}

	@PostMapping("/inbody")
	public String selectInbodyPost(Model model) {
		return "record/inbody";
	}

	@GetMapping("/workout")
	public String selectWorkout(Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		if (user == null) {
			return "";
		}
		
		List<WorkoutVO> workoutList = recordService.selectWorkoutList(user.getMe_id());
		model.addAttribute("workoutList", workoutList);
		return "record/workout";
	}

	@PostMapping("/workout")
	public String selectWorkoutPost(Model model) {
		return "record/workout";
	}

	@GetMapping("/dietModal")
	public String insertDiet(HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		if (user == null) {
			model.addAttribute("url", "/login");
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "msg/msg";
		}
		
		return "record/dietModal";
	}

	@RequestMapping(value = "/dietModal", method = RequestMethod.POST)
	public String insertDietPost(@ModelAttribute DietVO diet, @RequestParam("file") MultipartFile file,
			HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("user");

		if (user == null) {
			model.addAttribute("url", "/login");
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "msg/msg";
		}

		boolean res = recordService.insertDietPost(diet, user, file);
		
		if (res) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "식단이 기록되었습니다.");
			return "msg/msg";
		}

		model.addAttribute("url", "/");
		model.addAttribute("msg", "식단 기록에 실패했습니다.");
		return "msg/msg";
	}

	@GetMapping("/inbodyModal")
	public String insertInbody(Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		if (user == null) {
			model.addAttribute("url", "/login");
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "msg/msg";
		}
		
		return "record/inbodyModal";
	}

	@RequestMapping(value = "/inbodyModal", method = RequestMethod.POST)
	public String insertInbodyPost(@ModelAttribute InbodyVO inbody, HttpSession session,
			@RequestParam("file") MultipartFile file, Model model) {
		System.out.println(inbody);
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		if (user == null) {
			model.addAttribute("url", "/login");
			model.addAttribute("msg", "로그인해주세요.");
			return "msg/msg";
		}

		boolean res = recordService.insertInbodyPost(inbody, user, file);

		if (res) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "신체가 기록되었습니다.");
			System.out.println(inbody);
			return "msg/msg";
		}
		model.addAttribute("url", "/");
		model.addAttribute("msg", "신체 기록에 실패했습니다.");
		return "msg/msg";
	}

	@GetMapping("/workoutModal")
	public String insertWorkout(HttpSession session, Model model) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		
		if (user == null) {
			model.addAttribute("url", "/login");
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "msg/msg";
		}
		
		return "record/workoutModal";
	}

	@RequestMapping(value = "/workoutModal", method = RequestMethod.POST)
	public String insertWorkoutPost(@ModelAttribute WorkoutVO workout, HttpSession session, @RequestParam("file")MultipartFile file,
			Model model) {

		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("url", "/login");
			model.addAttribute("msg", "로그인해주세요.");
			return "msg/msg";
		}

		boolean res = recordService.insertWorkoutPost(workout, user, file);

		if (res) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "신체가 기록되었습니다.");
			System.out.println(workout);
			return "msg/msg";
		}
		model.addAttribute("url", "/");
		model.addAttribute("msg", "신체 기록에 실패했습니다.");
		return "msg/msg";
	}

}
