package com.cha102.diyla.commodityModel;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommodityDaoImpl implements CommodityDao {
    public static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/diyla");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

    public static final String GET_ALL_SQL = "SELECT * FROM COMMODITY";
    public static final String INSERT_SQL = "INSERT INTO COMMODITY (COM_CLASS_NO,COM_NAME,COM_PIC,COM_DES,COM_PRI,COM_QUA,COM_STATE) VALUES (?,?,?,?,?,?,?);";
    public static final String FIND_BY_ID = "SELECT * FROM COMMODITY where COM_NO = ?";
    public static final String FIND_BY_NAME_KEYWORD = "SELECT * FROM COMMODITY WHERE COM_NAME LIKE ? ";
    public static final String FIND_BY_COM_CLASS_NO = "SELECT * FROM COMMODITY WHERE COM_CLASS_NO = ? and COM_STATE != 0";
    public static final String GET_ALL_STATE = "SELECT * FROM COMMODITY WHERE COM_STATE != 0";
    public static final String GET_ONE_STATE = "SELECT * FROM COMMODITY where COM_NO = ? and COM_STATE != 0";
    public static final String UPDATE_SQL = "UPDATE COMMODITY SET COM_NAME=?, COM_PIC=?, COM_DES=?, COM_PRI=?, COM_QUA=?, COM_STATE=? WHERE COM_CLASS_NO=? ";

    public int insert(CommodityVO commodity) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL);) {
            conn.setAutoCommit(false);
            ps.setInt(1, commodity.getComClassNo());
            ps.setString(2, commodity.getComName());
            ps.setBytes(3, commodity.getComPic());
            ps.setString(4, commodity.getComDes());
            ps.setDouble(5, commodity.getComPri());
            ps.setInt(6, commodity.getComQua());
            ps.setInt(7, commodity.getComState());
            int i = ps.executeUpdate();
            if (i > 0) {
                conn.commit();
                return i;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<CommodityVO> getAll() {
        List<CommodityVO> commodities = new ArrayList<>();
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(GET_ALL_SQL)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CommodityVO commodity = new CommodityVO();
                buildCommodityVO(commodity, rs);
                commodities.add(commodity);
            }
            rs.close();
            return commodities;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public CommodityVO findByID(Integer comNO) {
        try (Connection connection = ds.getConnection();
             PreparedStatement pstt = connection.prepareStatement(FIND_BY_ID)) {
            pstt.setInt(1, comNO);
            ResultSet rs = pstt.executeQuery();
            if (rs.next()) {
                CommodityVO commodity = new CommodityVO();
                buildCommodityVO(commodity, rs);
                rs.close();
                return commodity;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<CommodityVO> findByNameKeyword(String nameKeyword) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(FIND_BY_NAME_KEYWORD)) {

            ps.setString(1, "%" + nameKeyword + "%");
            ResultSet rs = ps.executeQuery();
            List<CommodityVO> commodityVOS = new ArrayList<>();
            while (rs.next()) {
                CommodityVO commodityVO = new CommodityVO();
                buildCommodityVO(commodityVO,rs);
                commodityVOS.add(commodityVO);
            }
            rs.close();
            return commodityVOS;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<CommodityVO> findByComClass(Integer comClassNO) {
        try (Connection connection = ds.getConnection();
             PreparedStatement pstt = connection.prepareStatement(FIND_BY_COM_CLASS_NO)) {
            pstt.setInt(1, comClassNO);
            ResultSet rs = pstt.executeQuery();
            List<CommodityVO> commodityVOS = new ArrayList<>();
            while (rs.next()) {
                CommodityVO commodityVO = new CommodityVO();
                buildCommodityVO(commodityVO,rs);
                commodityVOS.add(commodityVO);
            }
            rs.close();
            return commodityVOS;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<CommodityVO> getAllState() {
        List<CommodityVO> commodities = new ArrayList<>();
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(GET_ALL_STATE)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CommodityVO commodity = new CommodityVO();
                buildCommodityVO(commodity, rs);
                commodities.add(commodity);
            }
            rs.close();
            return commodities;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(CommodityVO commodity) {
        try (Connection conn = ds.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_SQL);) {
            CommodityVO commodityVO = new CommodityVO();
            ResultSet rs = ps.executeQuery();
            buildCommodityVO(commodityVO,rs);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void buildCommodityVO(CommodityVO commodity, ResultSet rs) throws SQLException {
        commodity.setComNO(rs.getInt(1));
        commodity.setComClassNo(rs.getInt(2));
        commodity.setComName(rs.getString(3));
        commodity.setComPic(rs.getBytes(4));
        commodity.setComDes(rs.getString(5));
        commodity.setComPri(rs.getInt(6));
        commodity.setComQua(rs.getInt(7));
        commodity.setComState(rs.getInt(8));
        commodity.setCommentTotal(rs.getInt(9));
        commodity.setRatingSum(rs.getInt(10));
        commodity.setUpdateTime(rs.getTimestamp(11));
    }
}
