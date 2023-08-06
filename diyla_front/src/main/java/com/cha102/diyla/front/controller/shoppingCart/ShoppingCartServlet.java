package com.cha102.diyla.front.controller.shoppingCart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.cha102.diyla.commodityModel.CommodityService;

import com.cha102.diyla.commodityModel.CommodityVO;
import com.cha102.diyla.member.MemVo;
import com.cha102.diyla.shoppongcart.ShoppingCartVO;
import com.cha102.diyla.shoppongcart.ShoppingCartDaoImpl;
import com.cha102.diyla.shoppongcart.ShoppingCartService;

@WebServlet("/shoppingCart/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	CommodityService commodityService = new CommodityService();
	ShoppingCartService shoppingCartService = new ShoppingCartService();

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		Integer memId = Integer.valueOf(req.getParameter("memId"));
		List<ShoppingCartVO> shoppingCartList=null;
		List<CommodityVO> comList =null;
		if ("getAll".equals(action)) {
//			ShoppingCartDaoImpl dao = new ShoppingCartDaoImpl();
			shoppingCartList = shoppingCartService.getAll(Integer.valueOf(memId));//取出該會員所有購買商品
			
			
			int totalPrice = shoppingCartService.getTotalPrice(shoppingCartList);
			req.setAttribute("shoppingCartList", shoppingCartList);
			req.setAttribute("memId", memId);
			req.setAttribute("totalPrice", totalPrice);
			String url = "/shoppingCart/listAll.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);

		}
		if ("addItem".equals(action)) {
			Integer comNo = Integer.valueOf(req.getParameter("comNo"));
			Integer comAmount = Integer.valueOf(req.getParameter("comAmount"));
			CommodityVO commodityVO = commodityService.findByID(comNo);
			ShoppingCartVO cartVO = shoppingCartService.addShoppingCart(memId, comNo, comAmount);
			shoppingCartList.add(cartVO);
			session.setAttribute("commodityVO", commodityVO);
			session.setAttribute("cartVO", cartVO);
			//toDO...總價刷新，當前清單刷新
		}
		if ("changeAmount".equals(action)) {
			Integer amount = Integer.valueOf(req.getParameter("amount"));
			Integer comNo = Integer.valueOf(req.getParameter("comNo"));
			
			
			//toDO...總價刷新，當前清單刷新
		}
		if ("delete".equals(action)) {
			Integer comNo = Integer.valueOf(req.getParameter("comNo"));
			shoppingCartService.delete(memId, comNo);
			//toDO...總價刷新，當前清單刷新
		}
		if ("clear".equals(action)) {
			shoppingCartService.delete(memId, memId);
		}
	}
}