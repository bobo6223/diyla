package com.cha102.diyla.back.controller;



import com.cha102.diyla.IatestnewsModel.*;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/latestnews/latServlet")
public class latServlet extends HttpServlet {
       
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String newsNo = req.getParameter("newsNo");

		if ("getOne_For_Display".equals(action)){

			//***************************2.開始查詢資料*****************************************/
			LatService latSvc = new LatService();
			LatestnewsVO latVO =  latSvc.getOneLat(Integer.valueOf(req.getParameter("newsNO")));

//			LatDAO dao = new LatDAO();
//			LatestnewsVO latVO = dao.findByPrimaryKey(Integer.valueOf(req.getParameter("newsNo")));

			req.setAttribute("latVO", latVO); // 資料庫取出的empVO物件,存入req
			String url = "/latestnews/listbyID.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}
	}
}
