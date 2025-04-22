package kr.kh.spring.model.dto;

import java.util.List;

import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.RuleVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GroupRuleListDTO {
	
	 private GroupVO group;
	 private List<RuleVO> ruleList;
	 
}
