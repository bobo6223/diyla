package com.cha102.diyla.IatestnewsModel;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

public class LatestnewsVO implements Serializable{

	private Integer newsNo;
	private String newsContext;
	private byte[] annPic;
	private Integer annStatus;
	private Date annTime;

	public Integer getNewsNo() {
		return newsNo;
	}

	public void setNewsNo(Integer newsNo) {
		this.newsNo = newsNo;
	}

	public String getNewsContext() {
		return newsContext;
	}

	public void setNewsContext(String newsContext) {
		this.newsContext = newsContext;
	}

	public byte[] getAnnPic() {
		return annPic;
	}

	public void setAnnPic(byte[] annPic) {
		this.annPic = annPic;
	}

	public Integer getAnnStatus() {
		return annStatus;
	}

	public void setAnnStatus(Integer annStatus) {
		this.annStatus = annStatus;
	}

	public Date getAnnTime() {
		return annTime;
	}

	public void setAnnTime(Date annTime) {
		this.annTime = annTime;
	}

	@Override
	public String toString() {
		return "IatestnewsVO [newsNo=" + newsNo + ", newsContext=" + newsContext + ", annPic=" + Arrays.toString(annPic)
				+ ", annStaus=" + annStatus + ", annTime=" + annTime + "]";
	}

	public LatestnewsVO(Integer newsNo, String newsContext, byte[] annPic, Integer annStaus, Date annTime) {
		super();
		this.newsNo = newsNo;
		this.newsContext = newsContext;
		this.annPic = annPic;
		this.annStatus = annStatus;
		this.annTime = annTime;
	}

	public LatestnewsVO() {
		super();
	}

}
