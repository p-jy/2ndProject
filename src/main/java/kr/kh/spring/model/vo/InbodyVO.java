package kr.kh.spring.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class InbodyVO {
	int ib_num;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date ib_date;
	double ib_weight;
	Double ib_smm;
	Double ib_bfm;
	String ib_bedTime;
	String ib_bed_date;
	String ib_wakeTime;
	String ib_memo;
	String ib_me_id;
	String ip_name;

}
