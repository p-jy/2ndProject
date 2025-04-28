package kr.kh.spring.model.vo;

import lombok.Data;

@Data
public class Share_RecordVO {
	private int sr_num;
	private int sr_mc_num;
	private int sr_gr_num;
	private MajorCateVO majorcates;
	private String sr_mj_cate;
	
	public MajorCateVO getMajorcates() {
        return majorcates;
    }

    public void setMajorcates(MajorCateVO majorcates) {
        this.majorcates = majorcates;
    }
	
}
