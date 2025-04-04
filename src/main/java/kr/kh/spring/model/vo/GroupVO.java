package kr.kh.spring.model.vo;

import lombok.Data;

@Data
public class GroupVO {

	int gr_num;
	String gr_public; 
	char gr_code; 
	char gr_pw; 
	String gr_name;
	String GR_INTRODUCTION; 
	Data gr_start_date;
	int gr_period;  
	int gr_personnel; 
	int gr_participant;
	String gr_me_id;
	
}
