package kr.kh.spring.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Diet_PicVO {

	private int dp_num;
	private String dp_ori_name;
	private String dp_name;
	private int dp_di_num;
	
	public Diet_PicVO(String dp_ori_name, String dp_name, int dp_di_num) {
		this.dp_ori_name = dp_ori_name;
		this.dp_name = dp_name;
		this.dp_di_num = dp_di_num;
	}
	
	
}
