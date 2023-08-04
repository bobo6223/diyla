package com.cha102.diyla.diyOrder;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;

public class DiyOrderDAO implements DiyOrderDAO_interface{
	private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/diyla?serverTimezone=Asia/Taipei";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "12345678";

    private static final String INSERT_STMT = "INSERT INTO diy_order (Mem_Id, Diy_No, Contact_Person, Contact_Phone, Reservation_Num, Diy_Period, Diy_Reserve_Date, Reservation_Status, Payment_Status, Diy_Price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL_STMT = "SELECT Diy_Order_No, Mem_Id, Diy_No, Contact_Person, Contact_Phone, Reservation_Num, Diy_Period, Diy_Reserve_Date, Create_Time, Reservation_Status, Payment_Status, Diy_Price FROM diy_order ORDER BY Diy_Order_No";
    private static final String GET_ONE_STMT = "SELECT Diy_Order_No, Mem_Id, Diy_No, Contact_Person, Contact_Phone, Reservation_Num, Diy_Period, Diy_Reserve_Date, Create_Time, Reservation_Status, Payment_Status, Diy_Price FROM diy_order WHERE Diy_Order_No = ?";
    private static final String DELETE = "DELETE FROM diy_order WHERE Diy_Order_No = ?";
    private static final String UPDATE = "UPDATE diy_order SET Mem_Id = ?, Diy_No = ?, Contact_Person = ?, Contact_Phone = ?, Reservation_Num = ?, Diy_Period = ?, Diy_Reserve_Date = ?, Create_Time = ?, Reservation_Status = ?, Payment_Status = ?, Diy_Price = ? WHERE Diy_Order_No = ?";

    // 新增
    @Override
    public void insert(DiyOrderVO diyOrderVO) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 載入驅動程式
            Class.forName(driver);
            // 建立連線
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            // 準備 SQL 語句
            pstmt = conn.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, diyOrderVO.getMemId());
            pstmt.setInt(2, diyOrderVO.getDiyNo());
            pstmt.setString(3, diyOrderVO.getContactPerson());
            pstmt.setString(4, diyOrderVO.getContactPhone());
            pstmt.setInt(5, diyOrderVO.getReservationNum());
            pstmt.setInt(6, diyOrderVO.getDiyPeriod());
            pstmt.setDate(7, diyOrderVO.getDiyReserveDate());
//            pstmt.setTimestamp(8, diyOrderVO.getCreateTime());
            pstmt.setByte(8, diyOrderVO.getReservationStatus());
            pstmt.setByte(9, diyOrderVO.getPaymentStatus());
            pstmt.setInt(10, diyOrderVO.getDiyPrice());

            // 執行更新
            pstmt.executeUpdate();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
        } catch (SQLException se) {
            throw new RuntimeException("A database error occurred. " + se.getMessage());
        } finally {
            // 關閉資源
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    // 修改
    @Override
    public void update(DiyOrderVO diyOrderVO) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 載入驅動程式
            Class.forName(driver);
            // 建立連線
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            // 準備 SQL 語句
            pstmt = conn.prepareStatement(UPDATE);

            pstmt.setInt(1, diyOrderVO.getMemId());
            pstmt.setInt(2, diyOrderVO.getDiyNo());
            pstmt.setString(3, diyOrderVO.getContactPerson());
            pstmt.setString(4, diyOrderVO.getContactPhone());
            pstmt.setInt(5, diyOrderVO.getReservationNum());
            pstmt.setInt(6, diyOrderVO.getDiyPeriod());
            pstmt.setDate(7, diyOrderVO.getDiyReserveDate());
            pstmt.setTimestamp(8, diyOrderVO.getCreateTime());
            pstmt.setByte(9, diyOrderVO.getReservationStatus());
            pstmt.setByte(10, diyOrderVO.getPaymentStatus());
            pstmt.setInt(11, diyOrderVO.getDiyPrice());
            pstmt.setInt(12, diyOrderVO.getDiyOrderNo());

            // 執行更新
            pstmt.executeUpdate();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
        } catch (SQLException se) {
            throw new RuntimeException("A database error occurred. " + se.getMessage());
        } finally {
            // 關閉資源
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    // 刪除
    @Override
    public void delete(Integer diyOrderNo) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 載入驅動程式
            Class.forName(driver);
            // 建立連線
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            // 準備 SQL 語句
            pstmt = conn.prepareStatement(DELETE);

            pstmt.setInt(1, diyOrderNo);

            // 執行更新
            pstmt.executeUpdate();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
        } catch (SQLException se) {
            throw new RuntimeException("A database error occurred. " + se.getMessage());
        } finally {
            // 關閉資源
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    // 查詢單筆
    @Override
    public DiyOrderVO findByPrimaryKey(Integer diyOrderNo) {
        DiyOrderVO diyOrderVO = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 載入驅動程式
            Class.forName(driver);
            // 建立連線
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            // 準備 SQL 語句
            pstmt = conn.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, diyOrderNo);

            // 執行查詢
            rs = pstmt.executeQuery();

            if (rs.next()) {
                diyOrderVO = new DiyOrderVO();
                diyOrderVO.setDiyOrderNo(rs.getInt("Diy_Order_No"));
                diyOrderVO.setMemId(rs.getInt("Mem_Id"));
                diyOrderVO.setDiyNo(rs.getInt("Diy_No"));
                diyOrderVO.setContactPerson(rs.getString("Contact_Person"));
                diyOrderVO.setContactPhone(rs.getString("Contact_Phone"));
                diyOrderVO.setReservationNum(rs.getInt("Reservation_Num"));
                diyOrderVO.setDiyPeriod(rs.getInt("Diy_Period"));
                diyOrderVO.setDiyReserveDate(rs.getDate("Diy_Reserve_Date"));
                diyOrderVO.setCreateTime(rs.getTimestamp("Create_Time"));
                diyOrderVO.setReservationStatus(rs.getByte("Reservation_Status"));
                diyOrderVO.setPaymentStatus(rs.getByte("Payment_Status"));
                diyOrderVO.setDiyPrice(rs.getInt("Diy_Price"));
            }

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
        } catch (SQLException se) {
            throw new RuntimeException("A database error occurred. " + se.getMessage());
        } finally {
            // 關閉資源
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }

        return diyOrderVO;
    }

    // 查詢全部
    @Override
    public List<DiyOrderVO> getAll() {
        List<DiyOrderVO> list = new ArrayList<>();
        DiyOrderVO diyOrderVO = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 載入驅動程式
            Class.forName(driver);
            // 建立連線
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            // 準備 SQL 語句
            pstmt = conn.prepareStatement(GET_ALL_STMT);

            // 執行查詢
            rs = pstmt.executeQuery();

            while (rs.next()) {
                diyOrderVO = new DiyOrderVO();
                diyOrderVO.setDiyOrderNo(rs.getInt("Diy_Order_No"));
                diyOrderVO.setMemId(rs.getInt("Mem_Id"));
                diyOrderVO.setDiyNo(rs.getInt("Diy_No"));
                diyOrderVO.setContactPerson(rs.getString("Contact_Person"));
                diyOrderVO.setContactPhone(rs.getString("Contact_Phone"));
                diyOrderVO.setReservationNum(rs.getInt("Reservation_Num"));
                diyOrderVO.setDiyPeriod(rs.getInt("Diy_Period"));
                diyOrderVO.setDiyReserveDate(rs.getDate("Diy_Reserve_Date"));
                diyOrderVO.setCreateTime(rs.getTimestamp("Create_Time"));
                diyOrderVO.setReservationStatus(rs.getByte("Reservation_Status"));
                diyOrderVO.setPaymentStatus(rs.getByte("Payment_Status"));
                diyOrderVO.setDiyPrice(rs.getInt("Diy_Price"));
                list.add(diyOrderVO);
            }

        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
        } catch (SQLException se) {
            throw new RuntimeException("A database error occurred. " + se.getMessage());
        } finally {
            // 關閉資源
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }

        return list;
    }
}
