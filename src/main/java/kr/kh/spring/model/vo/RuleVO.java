package kr.kh.spring.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RuleVO {
	
	//규칙 테이블
	private int rl_num;
	private String rl_rule;
	private int rl_gr_num;
	//그룹 테이블(그룹 번호(기본키))
	private int gr_num;
	
	public RuleVO(String rl_rule, int rl_gr_num) {
		this.rl_rule = rl_rule;
		this.rl_gr_num = rl_gr_num;
	}
	
	
}
