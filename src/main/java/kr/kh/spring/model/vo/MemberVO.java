package kr.kh.spring.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String me_id;
	private String me_pw;
	private String me_name;
	private String me_phone;
	private String me_cookie;
	private boolean auto;
	private Date me_limit;
	private String me_del;
	
}
