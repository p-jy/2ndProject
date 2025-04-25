package kr.kh.spring.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class WorkoutVO {
	int wo_num;
	String wo_title;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date wo_date;
	String wo_ampm;
	String wo_time;
	int wo_minute;
	String wo_text;
	String wo_me_id;
	String wp_name;
}
