package kr.kh.spring.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class DietVO {
	int di_Num; 
	String di_Name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date di_Date;
	String di_AmPm; 
	String di_Time; 
	String di_Memo; 
	String di_Me_Id;

}
