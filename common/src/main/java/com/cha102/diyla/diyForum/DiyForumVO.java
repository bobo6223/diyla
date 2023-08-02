package com.cha102.diyla.diyForum;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class DiyForumVO implements Serializable {
    private Integer artiNo;
    private Integer memId;
    private Integer diyNo;
    private String artiCont;
    private Byte diyGra;
    
 // 無參數
    public DiyForumVO() {
    	
    }

    @Override
	public String toString() {
		return "DiyForumVO [artiNo=" + artiNo + ", memId=" + memId + ", diyNo=" + diyNo + ", artiCont=" + artiCont
				+ ", diyGra=" + diyGra + "]";
	}
	public Integer getArtiNo() {
        return artiNo;
    }
    public void setArtiNo(Integer artiNo) {
        this.artiNo = artiNo;
    }
    public Integer getMemId() {
        return memId;
    }
    public void setMemId(Integer memId) {
        this.memId = memId;
    }
    public Integer getDiyNo() {
        return diyNo;
    }
    public void setDiyNo(Integer diyNo) {
        this.diyNo = diyNo;
    }
    public String getArtiCont() {
        return artiCont;
    }
    public void setArtiCont(String artiCont) {
        this.artiCont = artiCont;
    }
    public Byte getDiyGra() {
        return diyGra;
    }
    public void setDiyGra(Byte diyGra) {
        this.diyGra = diyGra;
    }
}
