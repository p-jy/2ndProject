package kr.kh.spring.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WorkoutVO {
	int wo_num;
	String wo_title;
	Date wo_date;
	String wo_ampm;
	String wo_time;
	int wo_minute;
	String wo_text;

}
