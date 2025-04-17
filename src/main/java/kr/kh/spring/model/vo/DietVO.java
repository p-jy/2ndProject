package kr.kh.spring.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class DietVO {
	int di_num; 
	String di_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date di_date;
	String di_amPm; 
	String di_time; 
	String di_memo; 
	String di_me_id;
	int di_score;

}
