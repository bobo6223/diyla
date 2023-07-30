package com.cha102.diyla.back.controller.shop;

import com.cha102.diyla.commodityClassModel.CommodityClassService;
import com.cha102.diyla.commodityClassModel.CommodityClassVO;
import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityModel.CommodityVO;
import org.apache.commons.io.IOUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/shop/CommodityController")
@MultipartConfig(fileSizeThreshold = 0, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class CommodityController extends HttpServlet {
    CommodityService service = new CommodityService();
    CommodityClassService classService = new CommodityClassService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("insertPage".equals(action)) {
            List<CommodityClassVO> commodityClasses = classService.getAll(); // 取回所有商品類別
            req.setAttribute("commodityClasses",commodityClasses); // 放到大中小的小
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/insertNewCommodity.jsp"); // 設定下個頁面路徑
            requestDispatcher.forward(req, resp); // 轉導到下個頁面，並把請求跟回應一併交給
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");


        if ("insert".equals(action)) {
            Integer comClassNo = Integer.valueOf(req.getParameter("comClassNo"));
            String commodityName = req.getParameter("commodityName");
            byte[]   commodityPic = IOUtils.toByteArray(req.getPart("commodityPic").getInputStream());
            String commodityDes = req.getParameter("commodityDes");
            Double commodityPri = Double.valueOf(req.getParameter("commodityPri"));
            Integer commodityQua = Integer.valueOf(req.getParameter("commodityQua"));
            Integer commodityStatus = Integer.valueOf(req.getParameter("commodityStatus"));

            CommodityVO commodityVO = new CommodityVO();
            commodityVO.setComClassNo(comClassNo);
            commodityVO.setComNAME(commodityName);
            commodityVO.setComPic(commodityPic);
            commodityVO.setComDec(commodityDes);
            commodityVO.setComPri(commodityPri);
            commodityVO.setComQua(commodityQua);
            commodityVO.setComState(commodityStatus);
            service.insert(commodityVO);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/shop/succeedInsertCommodity.jsp"); // webapp/index.jsp or index.html
            requestDispatcher.forward(req, res);
        }
    }
}
