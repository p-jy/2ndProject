package kr.kh.spring.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {

	int ms_num;
	String ms_content;
	Date ms_time;
	int ms_gm_num;
	
}
