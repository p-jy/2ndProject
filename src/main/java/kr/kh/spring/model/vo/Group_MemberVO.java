package kr.kh.spring.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Group_MemberVO {
	
	private int gm_num;
	private String gm_me_id;
	private int gm_gr_num;
	
	//그룹 테이블(그룹 번호(기본키))
	private int gr_num;
	
	public Group_MemberVO(int gm_num) {
		this.gm_num = gm_num;
	}
	
	
}
