package kr.kh.spring.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Workout_PicVO {

	private int wp_num;
	private String wp_ori_name;
	private String wp_name;
	private int wp_wo_num;
	
	public Workout_PicVO(String wp_ori_name, String wp_name, int wp_wo_num) {
		this.wp_ori_name = wp_ori_name;
		this.wp_name = wp_name;
		this.wp_wo_num = wp_wo_num;
	}
	
	
}
