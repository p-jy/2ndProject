package kr.kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.spring.dao.GroupDAO;

@Service
public class GroupServiceImp implements GroupService{

	@Autowired
	GroupDAO groupDao;
}
