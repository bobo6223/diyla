package com.cha102.diyla.commodityOrderDetail;

import java.util.List;

import com.cha102.diyla.commodityOrder.CommodityOrderVO;
import com.cha102.diyla.shoppongcart.ShoppingCartVO;

public interface CommodityOrderDetailDao {
	
	void insert(Integer orderNo, ShoppingCartVO cartVO);

	List<CommodityOrderDetailVO> getAll(Integer orderNo);
}
