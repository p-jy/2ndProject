package kr.kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.kh.spring.model.dto.PlanListDTO;
import kr.kh.spring.model.vo.DayVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.PlanVO;
import kr.kh.spring.service.PlanService;

@Controller
@RequestMapping("/plan")
public class PlanController {

	@Autowired
	PlanService planService;
	
	@GetMapping("/plan")
	public String selectPlan(Model model, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			return "/";
		}
		
		List<PlanVO> planList = planService.selectPlanList(user.getMe_id());
		model.addAttribute("planList", planList);
		
		return "plan/plan";
	}
	
	@GetMapping("/planModal")
	public String insert() {
		return "plan/planModal";
	}
	
	@RequestMapping(value = "/planModal", method = RequestMethod.POST)
	public String insertPost(PlanVO plan, Model model, HttpSession session, PlanListDTO planlist) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		List<DayVO> dayList = planlist.getDayList();
		
		if(user == null) {
			model.addAttribute("url", "/login");
			model.addAttribute("msg", "로그인해주세요.");
			return "msg/msg";
		}
		
		boolean res = planService.insertPlan(plan, user, dayList);
		
		if(res) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "계획을 등록했습니다.");
			
			return "msg/msg";
		}

		model.addAttribute("url", "/");
		model.addAttribute("msg", "계획 등록에 실패했습니다.");
		
		return "redirect:/";		
	}
	/*
	@GetMapping("/watch")
	public String watch(Model model, @PathVariable int pl_num, HttpSession session) {
		//유저 정보
		MemberVO user = (MemberVO)session.getAttribute("user");

		//계획을 가져옴
		PlanVO planlist = planService.getPlanList(pl_num);
		
		model.addAttribute("planlist", planlist);
		
		return "/plan/watch";
	}
	*/
}
