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
import com.cha102.diyla.commodityOrder.CommodityOrderService;
import com.cha102.diyla.member.MemVo;
import com.cha102.diyla.shoppongcart.ShoppingCartService;
import com.cha102.diyla.shoppongcart.ShoppingCartVO;

@WebServlet("/shop/CheckOutController")
public class CheckOutController extends HttpServlet {
	CommodityService commodityService = new CommodityService();
	ShoppingCartService shoppingCartService = new ShoppingCartService();
	CommodityOrderService commodityOrderService =new CommodityOrderService();

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
			Integer memId = (Integer)session.getAttribute("memId");
			List<ShoppingCartVO> scvList = (List)session.getAttribute("shoppingCartList");
//			System.out.println(scvList);
			for(ShoppingCartVO cartItem:scvList) {
				commodityOrderService.insert(cartItem);
			}
		}

	}
}
