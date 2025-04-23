package kr.kh.spring.model.dto;

import java.util.List;

import kr.kh.spring.model.vo.GroupVO;
import kr.kh.spring.model.vo.RecordVO;
import kr.kh.spring.model.vo.RuleVO;
import kr.kh.spring.model.vo.Share_RecordVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Gro_Sha_RecDTO {
	
	 private GroupVO group;
	 private List<Share_RecordVO> sharerecordList;
}
