package com.cha102.diyla.commodityOrder;

import java.util.List;

import com.cha102.diyla.shoppongcart.ShoppingCartVO;

public interface CommodityOrderDao {
	int insert(Integer memId);

	void delete(Integer orderNo);
	
	void update(CommodityOrderVO commodityOrderVO,Integer status);

	CommodityOrderVO findByOrderNo(Integer OrderNo);

//	List<ShoppingCartVO> findByMemId(Integer  memId);
}
