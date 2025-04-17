package kr.kh.spring.model.vo;



import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class GroupVO {
	
	//그룹 테이블
	private int gr_num;
	private String gr_public;
	private String gr_code;
	private String gr_pw;
	private String gr_name;
	private String gr_introduction;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date gr_start_date;
	private int gr_period;
	private int gr_personnel;
	private int gr_participant;
	private char gr_del;
	private String gr_me_id;
	
	//목표 테이블
	private int gl_num;
	
	//그룹목표 테이블
	private int gg_num;
	private int gg_gr_num;
	private int gg_gl_num;
	
	//규칙 테이블
	private int rl_num;
	private String rl_rule;
	private int rl_gr_num;
	
	//공유기록 테이블
	private int sr_num;
	private int sr_rc_num;
	private int sr_gr_num;
	
	
	
	
}
