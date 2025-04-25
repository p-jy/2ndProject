package kr.kh.spring.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class InbodyVO {
	int ib_num; 
	Date ib_date;
	double ib_weight;
	double ib_smm;
	double ib_bfm;
	String ib_bedTime;
	String ib_bed_date;
	String ib_wakeTime;
	String ib_memo;

}
