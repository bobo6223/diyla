package com.cha102.diyla.commodityOrderDetail;

import java.util.List;

import com.cha102.diyla.commodityOrder.CommodityOrderVO;
import com.cha102.diyla.shoppongcart.ShoppingCartVO;
import com.mysql.cj.x.protobuf.MysqlxCrud.Insert;

public class CommodityOrderDetailService {
	CommodityOrderDetailDaoJNDI dao = new CommodityOrderDetailDaoJNDI();
	
	public void insert(CommodityOrderVO commodityOrderVO, List<ShoppingCartVO> cartVOs) {
		dao.insert(commodityOrderVO, cartVOs);
	}


	public List<CommodityOrderDetailVO> getAll(Integer orderNo){
		return dao.getAll(orderNo);
	};
}
