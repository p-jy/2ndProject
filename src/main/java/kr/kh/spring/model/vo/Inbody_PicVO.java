package kr.kh.spring.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Inbody_PicVO {

	private int ip_num;
	private String ip_ori_name;
	private String ip_name;
	private int ip_ib_num;
	
	public Inbody_PicVO(String ip_ori_name, String ip_name, int ip_ib_num) {
		this.ip_ori_name = ip_ori_name;
		this.ip_name = ip_name;
		this.ip_ib_num = ip_ib_num;
	}
	
	
}
