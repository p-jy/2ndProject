package kr.kh.spring.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DietVO {
	int di_Num; 
	String di_Name;
	Date di_Date;
	String di_AmPm; 
	String di_Time; 
	String di_Memo; 
	String di_Me_Id;

}
