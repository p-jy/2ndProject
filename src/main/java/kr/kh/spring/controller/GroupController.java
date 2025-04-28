package kr.kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.spring.model.dto.Gro_Sha_RecDTO;
import kr.kh.spring.model.dto.GroupRuleListDTO;
import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.Group_MemberVO;
import kr.kh.spring.model.vo.MajorCateVO;
import kr.kh.spring.model.vo.MemberVO;
import kr.kh.spring.model.vo.RuleVO;
import kr.kh.spring.model.vo.Share_RecordVO;
import kr.kh.spring.model.vo.SubCateVO;
import kr.kh.spring.service.GroupService;
import kr.kh.spring.service.MemberService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	GroupService groupService;
	
	@Autowired
	MemberService memberService;
	
	//그룹 리스트 출력
	@GetMapping("/list")
	public String selectGroup(Model model) {
		
		List<GroupVO> groupList = groupService.selectGroupList();
		
		for (GroupVO group : groupList) {
		    List<Share_RecordVO> sharedList = groupService.selectShareRecordList(group.getGr_num());
		    System.out.println(sharedList);
		    group.setSharedList(sharedList);
		}
		
		

		model.addAttribute("groupList", groupList);
		
		return "/group/list";
	}
	
	@GetMapping("/createGroupModal")
	public String make(Model model, HttpSession session) {
		MemberVO user=(MemberVO) session.getAttribute("user");		
		
		if(user == null) {
			model.addAttribute("url", "/login");
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "msg/msg";
		}
		
		List<SubCateVO> subCate = groupService.getGoalList();
		System.out.println(subCate);
		model.addAttribute("subCate", subCate);
		return "group/createGroupModal";
	}
	
	//그룹 만들기
	@RequestMapping(value = "/createGroupModal", method = RequestMethod.POST)
	public String makeGroup(Model model, GroupVO group, GroupRuleListDTO grList,
			Gro_Sha_RecDTO srList, Group_MemberVO gmVO, HttpSession session) {
		//유저 정보 호출
		MemberVO user=(MemberVO) session.getAttribute("user");		
		
		if(user == null) {
			model.addAttribute("url", "/login");
			model.addAttribute("msg", "로그인 후 이용가능합니다.");
			return "msg/msg";
		}
		
		//규칙 리스트 호출
		List<RuleVO> rule = grList.getRuleList();
		System.out.println(rule);
		List<Share_RecordVO> sr = srList.getSharerecordList();
		//목표 리스트 호출
		List<SubCateVO> subCate = groupService.getGoalList();
		
		model.addAttribute("subCate", subCate);
		//방 만들기
		boolean res = groupService.insertGroup(group, user, rule, gmVO, sr);
		if(res) {
			model.addAttribute("url", "/group/list");
			model.addAttribute("msg", "그룹을 생성하였습니다.");
			return "msg/msg";
		}
		
		model.addAttribute("url", "/");
		model.addAttribute("msg", "그룹 생성에 실패했습니다.");
		return "msg/msg";
	}
	
	//그룹 출력
	@GetMapping("/main/{gr_num}")
	public String main(Model model, @PathVariable int gr_num, HttpSession session) {
		//그룹 페이지 가져옴
		GroupVO group = groupService.getGroup(gr_num);

		//해당 그룹맴버 정보를 가져옴.
		
		//해당 그룹하고 같은 번호를 가진 규칙 테이블의 값들을 객체에 삽입.
		List<RuleVO> ruleList=groupService.getRuleList(gr_num);
		
				
		//해당 그룹하고 같은 번호를 가진 목표 테이블의 값들을 객체에 삽입.
		List<MajorCateVO> mcList=groupService.getMCList();
		//해당 그룹하고 같은 번호를 가진 공유할 기록 테이블의 값들을 객체에 삽입.
		List<Share_RecordVO> srList=groupService.getSRList(gr_num);
		
		
		System.out.println(group);
		//현재 vo에 있는 값들을 모두 출력
		System.out.println(ruleList);
		System.out.println(mcList);
		System.out.println(srList);
		//화면에 전송
		model.addAttribute("group", group);
		model.addAttribute("ruleList", ruleList);
		model.addAttribute("srList", srList);
		return "/group/main";
	}
	//그룹 삭제하기(작성중)
	@GetMapping("/delete/{gr_num}")
	public String groupDelete(Model model, @PathVariable("gr_num")int gr_num, HttpSession session) {
		//유저 정보 호출
		MemberVO user=(MemberVO) session.getAttribute("user");
		if(groupService.deleteGroup(gr_num,user)) {
			model.addAttribute("url", "/group/list");
			model.addAttribute("msg", "그룹이 삭제되었습니다.");
		}
		else {
			model.addAttribute("url", "/group/main"+gr_num);
			model.addAttribute("msg", "그룹 삭제 실패");
		}
		return "/msg/msg";
	}
	//그룹 내용 수정하기(가져오기)
	@GetMapping("/remake/{gr_num}")
	public String groupRemake(Model model, @PathVariable("gr_num")int gr_num, HttpSession session) {
		//그룹 정보 호출
		GroupVO group =groupService.getGroup(gr_num);
		//유저 정보 호출
		MemberVO user=(MemberVO) session.getAttribute("user");
		//로그인이 안되어있거나 그룹이 존재하지 않거나, 그룹장이 아닌경우
		if(group == null || user == null || !group.getGr_me_id().equals(user.getMe_id())) {
			model.addAttribute("url", "/group/list");
			model.addAttribute("msg", "이 기능은 그룹장만 사용할 수 있습니다.");
			return "/msg/msg";
		}
		
		model.addAttribute("group", group);
		return "/group/remake";
	}
	
	//그룹 내용 수정하기(재작성)
	@PostMapping("/remake")
	public String remakeGroup(Model model, GroupVO group, GroupRuleListDTO grList
			,HttpSession session) {
		//유저 정보 호출
		MemberVO user=(MemberVO) session.getAttribute("user");
		//해당 그룹 규칙 값 모두 받기
		List<RuleVO> ruleList=grList.getRuleList();
		//방 수정하기
		if(groupService.updateGroup(group, user, ruleList)) {
			model.addAttribute("msg", "그룹을 수정하였습니다.");
		}
		//방 수정하기 실패했을 경우
		else {
			model.addAttribute("msg", "그룹을 생성하지 못했습니다.");
		}
		model.addAttribute("url","/group/main/"+group.getGr_num());
		return "msg/msg";
	}
	
	//그룹 맴버 리스트
	@GetMapping("/groupmember/{gr_num}")
	public String groupMember(Model model, @PathVariable("gr_num") int gr_num, HttpSession session) {
		//맴버 정보를 가져옴
		MemberVO user=(MemberVO) session.getAttribute("user");
		List<MemberVO> members = memberService.getMemberList();
		GroupVO group = groupService.getGroup(gr_num);
		System.out.println("그룹번호 : "+gr_num);
		
		System.out.println(members);
		
		//그룹맴버 페이지를 가져옴
		List<Group_MemberVO> memberList = groupService.getMemberList(gr_num,user);
		System.out.println(memberList);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("group", group);
		model.addAttribute("gr_num", gr_num);
		return "/group/groupmember";
	}
	
	//맴버 초대하기 기능
	@GetMapping("/invitation/{gr_num}")
	public String invitation(Model model,@PathVariable int gr_num, HttpSession session) {
		MemberVO user=(MemberVO) session.getAttribute("user");
		GroupVO group = groupService.getGroup(gr_num);
		
		model.addAttribute("group", group);
		model.addAttribute("gr_num", gr_num);
		return "/group/invitation";
	}
	//맴버가 해당 그룹에 들어가기 위해 가입신청을 누름
	
	//그룹장이 초대하고 싶은 맴버에게 코드를 보냄
	@PostMapping("/invitation/{gr_num}")
	public String inviteUser(@PathVariable("gr_num") int gr_num,
	                         @RequestParam("inviteId") String inviteId,
	                         HttpSession session,
	                         Model model) {
	    MemberVO inviter = (MemberVO) session.getAttribute("user");

	    // 로그인 체크 & 권한 확인 (그룹장만 초대 가능 등)
	    if (inviter == null || !groupService.isGroupLeader(gr_num, inviter.getMe_id())) {
	        model.addAttribute("msg", "그룹장만 초대할 수 있습니다.");
	        model.addAttribute("url", "/group/main/" + gr_num);
	        return "msg/msg";
	    }

	    boolean result = groupService.inviteMemberToGroup(gr_num, inviteId);

	    model.addAttribute("msg", result ? "초대가 완료되었습니다." : "초대에 실패했습니다.");
	    model.addAttribute("url", "/group/main/" + gr_num);
	    return "msg/msg";
	}
	//그룹장이 가입신청 리스트를 보고 수락하고 싶은 유저를 골라 해당 그룹에 초대
	
	
	@GetMapping("/message")
	public String message(Model model) {
		
		return "/group/message";
	}
	
	
	
	
}
