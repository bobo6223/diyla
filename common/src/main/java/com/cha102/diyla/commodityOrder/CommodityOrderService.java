package com.cha102.diyla.commodityOrder;

import java.util.List;

import com.cha102.diyla.shoppongcart.ShoppingCartVO;

public class CommodityOrderService {
	CommodityOrderDaoJNDI dao = new CommodityOrderDaoJNDI();

	public void update(CommodityOrderVO commodityOrderVO, Integer status) {
		dao.update(commodityOrderVO, status);
	}

	public void insert(ShoppingCartVO cartItem) {
		dao.insert(cartItem);
	}

	public List<CommodityOrderVO> getAll(Integer memNo) {
		dao.getAll(memNo);
		return null;
	}

	public CommodityOrderVO findByOrderNo(Integer OrderNo) {
		dao.findByOrderNo(OrderNo);
		return null;
	}

	public void delete(Integer orderNo) {
		dao.delete(orderNo);
	}
}
