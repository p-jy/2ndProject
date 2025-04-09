package kr.kh.spring.model.vo;



import java.util.Date;

import lombok.Data;

@Data
public class GroupVO {
	
	//그룹 테이블
	int gr_num;
	char gr_public;
	char gr_code;
	char gr_pw;
	String gr_name;
	String gr_introduction;
	Date gr_start_date;
	int gr_period;
	int gr_personnel;
	int gr_participant;
	String gr_me_id;
	
	//목표 테이블
	int gl_num;
	
	//그룹목표 테이블
	int gg_num;
	int gg_gr_num;
	int gg_gl_num;
	
	//규칙 테이블
	int rl_num;
	String rl_rule;
	int rl_gr_num;
	
	//공유기록 테이블
	int sr_num;
	int sr_rc_num;
	int sr_gr_num;
}
