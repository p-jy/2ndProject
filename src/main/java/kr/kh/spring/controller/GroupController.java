package kr.kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.kh.spring.service.GroupService;

@Controller
public class GroupController {
	
	@Autowired
	GroupService groupService;
	
	
	
}
