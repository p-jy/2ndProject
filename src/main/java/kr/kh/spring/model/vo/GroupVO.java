package kr.kh.spring.model.vo;



import java.util.Date;

import lombok.Data;

@Data
public class GroupVO {
	
	int gr_num;
	char gr_public;
	char gr_code;
	char gr_pw;
	String gr_name;
	String gr_introduction;
	Date gr_start_date;
	int gr_period;
	int gr_personnel;
	int participant;
	String gr_me_id;
	
}
