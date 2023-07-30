package com.cha102.diyla.IatestnewsModel;

import java.util.List;

public class LatService {
	private LatDAO_interface dao;

	public LatService() {
		dao = new LatDAO();
	}

	public LatestnewsVO addLat(String newsContext, byte[] annPic) {

		LatestnewsVO latVO = new LatestnewsVO();

		latVO.setNewsContext(newsContext);
		latVO.setAnnPic(annPic);
		dao.insert(latVO);

		return latVO;
	}

	public LatestnewsVO updateLat(Integer newsNo, String newsContext, byte annStatus, byte[] annPic) {
		LatestnewsVO latVO = new LatestnewsVO();

		latVO.setNewsNo(newsNo);
		latVO.setNewsContext(newsContext);
		latVO.setAnnStatus(annStatus);
		latVO.setAnnPic(annPic);

		dao.update(latVO);
		return latVO;
	}

	public void deleteLat(Integer newsNo) {
		dao.delete(newsNo);
	}

	public LatestnewsVO getOneLat(Integer newsNo) {
		return dao.findByPrimaryKey(newsNo);
	}

	public List<LatestnewsVO> getAll() {
		return dao.getAll();
	}
}
