package kr.kh.spring.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Group_MemberVO {
	
	private int gm_num;
	private int gm_me_id;
	private int gm_gr_num;
}
