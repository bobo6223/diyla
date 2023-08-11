package com.cha102.diyla.commodityOrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.cha102.diyla.commodityModel.CommodityService;
import com.cha102.diyla.commodityModel.CommodityVO;
import com.cha102.diyla.commodityOrder.CommodityOrderVO;
import com.cha102.diyla.shoppongcart.ShoppingCartVO;

public class CommodityOrderDetailDaoJNDI implements CommodityOrderDetailDao {
	CommodityService commodityService = new CommodityService();
	public static DataSource ds = null;

	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static final String INSERT = "INSERT INTO commodity_order_detail (ORDER_NO,COM_NO,COM_QUANTITY,COM_PRICE) VALUES (?,?,?,?);";
	public static final String GET_ALL = "SELECT * FROM commodity_order_detail WHERE ORDER_NO = ?";

	@Override
	public void insert(CommodityOrderVO commodityOrderVO, List<ShoppingCartVO> cartVOs) {
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(INSERT);) {
			for (ShoppingCartVO cartVO : cartVOs) {
				CommodityVO commodityVO = commodityService.findByID(cartVO.getComNo());
				Integer comPri = commodityVO.getComPri();
				Integer amount = cartVO.getComAmount();
				pstm.setInt(1, commodityOrderVO.getOrderNO());
				pstm.setInt(2, cartVO.getComNo());
				pstm.setInt(3, comPri);
				pstm.setInt(4, comPri * amount);
				pstm.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<CommodityOrderDetailVO> getAll(Integer orderNo) {
		List<CommodityOrderDetailVO> commodityOrderDetailVOs = null;
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(GET_ALL);) {
			pstm.setInt(1, orderNo);
			try (ResultSet rs = pstm.executeQuery();) {
				while (rs.next()) {
					CommodityOrderDetailVO commodityOrderDetailVO = new CommodityOrderDetailVO();
					commodityOrderDetailVO.setOrderNo(rs.getInt("ORDER_NO"));
					commodityOrderDetailVO.setComNo(rs.getInt("COM_NO"));
					commodityOrderDetailVO.setComPrice(rs.getInt("COM_QUANTITY"));
					commodityOrderDetailVO.setComQuantity(rs.getInt("COM_PRICE"));
					commodityOrderDetailVOs.add(commodityOrderDetailVO);
				}
				return commodityOrderDetailVOs;
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
