package com.cha102.diyla.commodityOrder;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.cha102.diyla.shoppongcart.ShoppingCartService;
import com.cha102.diyla.shoppongcart.ShoppingCartVO;

public class CommodityOrderDaoJNDI implements CommodityOrderDao {
	public static DataSource ds = null;

	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static final String INSERT = "INSERT INTO commodity_order (MEM_ID,ORDER_STATUS,ORDER_PRICE,DISCOUNT_PRICE,ACTUAL_PRICE) VALUES (?,?,?,?,?);";
	public static final String DLEETE = "SELECT * FROM commodity_order WHERE ORDER_NO = ? ";
	public static final String UPDATE = "UPDATE commodity_order set ORDER_STATUS = ? where ORDER_NO = ?";
	public static final String GET_ALL = "SELECT * FROM commodity_order WHERE MEM_ID = ?";
	public static final String FIND_BY_ORDER_NO = "SELECT * FROM commodity_order WHERE ORDER_NO = ?";

	public int insert(ShoppingCartVO shoppingCartVO) {
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(INSERT);) {
			ShoppingCartService cartService = new ShoppingCartService(); 
			List<ShoppingCartVO>cartVOs = cartService.getAll(shoppingCartVO.getMemId());
			Integer totalPrice = cartService.getTotalPrice(cartVOs);
			pstm.setInt(1, shoppingCartVO.getMemId());
			//先以未結帳做預設
			pstm.setInt(2, 1);
			pstm.setInt(3, totalPrice);
			//目前代幣上為完善 先以0帶入
			pstm.setInt(4, 0);
			pstm.setInt(5, totalPrice);
			int i = pstm.executeUpdate();
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public void delete(Integer orderNo) {
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(DLEETE);) {
			pstm.setInt(1, orderNo);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void update(CommodityOrderVO commodityOrderVO,Integer status) {
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(UPDATE);){
			pstm.setInt(1, status);
			pstm.setInt(2, commodityOrderVO.getOrderNO());
			 pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	
	public CommodityOrderVO findByOrderNo(Integer orderNo) {
		try (Connection con = ds.getConnection(); 
				PreparedStatement pstm = con.prepareStatement(FIND_BY_ORDER_NO);) {
			CommodityOrderVO commodityOrderVO = new CommodityOrderVO();
			pstm.setInt(1, orderNo);

			try (ResultSet rs = pstm.executeQuery();) {
				if (rs.next()) {
					commodityOrderVO.setOrderNO(rs.getInt("ORDER_NO"));
					commodityOrderVO.setMemId(rs.getInt("MEM_ID"));
					commodityOrderVO.setOrderTime(rs.getTimestamp("ORDER_TIME"));
					commodityOrderVO.setOrderStatus(rs.getInt("ORDER_STATUS"));
					commodityOrderVO.setOrderPrice(rs.getInt("ORDER_PRICE"));
					commodityOrderVO.setDiscountPrice(rs.getInt("DISCOUNT_PRICE"));
					commodityOrderVO.setActualPrice(rs.getInt("ACTUAL_PRICE"));
					commodityOrderVO.setUpdateTime(rs.getTimestamp("UPDATE_TIME"));
				}
				return commodityOrderVO;
			} catch (Exception e) {
				// TODO: handle exception
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<CommodityOrderVO> getAll(Integer memId) {
		List<CommodityOrderVO> commodityOrderlist = new ArrayList<>();
		try (Connection con = ds.getConnection(); PreparedStatement pstm = con.prepareStatement(GET_ALL);) {
			CommodityOrderVO commodityOrderVO = null;
			pstm.setInt(1, memId);
			try (ResultSet rs = pstm.executeQuery();) {
				while(rs.next()) {
					commodityOrderVO=new CommodityOrderVO();
					commodityOrderVO.setOrderNO(rs.getInt("ORDER_NO"));
					commodityOrderVO.setMemId(rs.getInt("MEM_ID"));
					commodityOrderVO.setOrderTime(rs.getTimestamp("ORDER_TIME"));
					commodityOrderVO.setOrderStatus(rs.getInt("ORDER_STATUS"));
					commodityOrderVO.setOrderPrice(rs.getInt("ORDER_PRICE"));
					commodityOrderVO.setDiscountPrice(rs.getInt("DISCOUNT_PRICE"));
					commodityOrderVO.setActualPrice(rs.getInt("ACTUAL_PRICE"));
					commodityOrderVO.setUpdateTime(rs.getTimestamp("UPDATE_TIME"));
					commodityOrderlist.add(commodityOrderVO);
				}
				return commodityOrderlist;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	
}
