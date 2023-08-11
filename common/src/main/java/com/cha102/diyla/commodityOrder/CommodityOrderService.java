package com.cha102.diyla.commodityOrder;

import java.util.List;

import com.cha102.diyla.shoppongcart.ShoppingCartService;
import com.cha102.diyla.shoppongcart.ShoppingCartVO;

public class CommodityOrderService {
	CommodityOrderDaoJNDI dao = new CommodityOrderDaoJNDI();

	public void update(CommodityOrderVO commodityOrderVO, Integer status) {
		dao.update(commodityOrderVO, status);
	}

	public Integer insert(Integer memId) {
		return dao.insert(memId);
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
	//查詢該會員目前購物車所有:結帳用
	public List<ShoppingCartVO> findByMemId(Integer memId) {
		ShoppingCartService cartService = new ShoppingCartService();
		List<ShoppingCartVO> cartVOs = cartService.getAll(memId);
		return cartVOs;
	}
}
