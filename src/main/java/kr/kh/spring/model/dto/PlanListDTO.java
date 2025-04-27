package kr.kh.spring.model.dto;

import java.util.List;

import kr.kh.spring.model.vo.DayVO;
import kr.kh.spring.model.vo.PlanVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlanListDTO {
	
	private PlanVO plan;
	private List<DayVO> dayList;
	
	public List<DayVO> getDayList() {
        return dayList;
    }

    public void setDayList(List<DayVO> dayList) {
        this.dayList = dayList;
    }
}
