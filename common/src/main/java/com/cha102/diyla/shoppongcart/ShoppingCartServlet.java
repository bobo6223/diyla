package com.cha102.diyla.shoppongcart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cha102.diyla.commodityModel.CommodityVO;
import com.cha102.diyla.member.MemVo;

public class ShoppingCartServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("getOne_For_Display".equals(action)) {
			// ***************************2.開始查詢資料*****************************************/
			ShoppingCartDaoImpl dao = new ShoppingCartDaoImpl();
			List<ShoppingCartVO> shoppingCartList = dao.getAll(Integer.valueOf(req.getParameter("memId")));
			req.setAttribute("shoppingCartList", shoppingCartList);
//            String url = "/common/getAll.jsp";
//            RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
//            successView.forward(req, res);
		
		
		}
	}
}