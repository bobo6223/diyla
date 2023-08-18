package com.cha102.diyla.commodityOrder;

import java.util.List;

public interface CommodityOrderDao {
	int insert(CommodityOrderVO commodityOrderVO);

	void delete(Integer orderNo);

	void updateStatus(Integer status, Integer orderNO);

//	void update(CommodityOrderVO commodityOrderVO);
	
	CommodityOrderVO findByOrderNo(Integer OrderNo);

	List<CommodityOrderVO> getAllByMemId(Integer memId);

	List<CommodityOrderVO> getAll();
	

	List<CommodityOrderVO> sortBy(String sql);

}
