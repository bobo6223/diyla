package com.cha102.diyla.IatestnewsModel;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Arrays;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@NoArgsConstructor
@ToString
public class LatestnewsVO implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer newsNo;
	private String newsContext;
	private byte[] annPic;
	private Byte annStatus;
	private Timestamp annTime;
	
}
