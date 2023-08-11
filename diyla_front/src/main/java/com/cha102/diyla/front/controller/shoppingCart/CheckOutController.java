package com.cha102.diyla.front.controller.shoppingCart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityOrder.*;
import com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailService;
import com.cha102.diyla.member.MemVo;
import com.cha102.diyla.shoppongcart.*;

@WebServlet("/shop/CheckOutController")
public class CheckOutController extends HttpServlet {
	CommodityService commodityService = new CommodityService();
	ShoppingCartService shoppingCartService = new ShoppingCartService();
	CommodityOrderService commodityOrderService = new CommodityOrderService();
	CommodityOrderDetailService commodityOrderDetailService = new CommodityOrderDetailService();

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		List<ShoppingCartVO> shoppingCartList = (ArrayList<ShoppingCartVO>) session.getAttribute("shoppingCartList");
		String action = req.getParameter("action");
		if ("checkout".equals(action)) {
			Integer memId = (Integer) session.getAttribute("memId");
			Integer totalPrice = shoppingCartService.getTotalPrice(shoppingCartList);
			CommodityOrderVO commodityOrderVO = new CommodityOrderVO(memId, 0, totalPrice, 0, totalPrice);
			Integer orderNo = commodityOrderService.insert(memId);
			for (ShoppingCartVO cartVO : shoppingCartList) {
				//加入商品訂單明細
				commodityOrderDetailService.insert(orderNo, cartVO);
			}
			//購買完清除購物車
//			shoppingCartService.clear(memId);
		}

		if ("listOrder".equals(action)) {
			Integer memId = (Integer) session.getAttribute("memId");

		}

	}
}
