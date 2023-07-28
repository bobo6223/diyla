package com.cha102.diyla.IatestnewsModel;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Arrays;

public class LatestnewsVO implements Serializable {

	private Integer newsNo;
	private String newsContext;
	private byte[] annPic;
	private Byte annStatus;
	private Timestamp annTime;
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
	public Byte getAnnStatus() {
		return annStatus;
	}
	public void setAnnStatus(Byte annStatus) {
		this.annStatus = annStatus;
	}
	public Timestamp getAnnTime() {
		return annTime;
	}
	public void setAnnTime(Timestamp annTime) {
		this.annTime = annTime;
	}
	public LatestnewsVO() {
		super();
	}
	@Override
	public String toString() {
		return "LatestnewsVO [newsNo=" + newsNo + ", newsContext=" + newsContext + ", annPic=" + Arrays.toString(annPic)
				+ ", annStatus=" + annStatus + ", annTime=" + annTime + "]";
	}
	public LatestnewsVO(Integer newsNo, String newsContext, byte[] annPic, Byte annStatus, Timestamp annTime) {
		super();
		this.newsNo = newsNo;
		this.newsContext = newsContext;
		this.annPic = annPic;
		this.annStatus = annStatus;
		this.annTime = annTime;
	}

}
