package com.cha102.diyla.front.desertcourse.classModel;

import com.cha102.diyla.sweetclass.classModel.ClassINGDAO;
import com.cha102.diyla.sweetclass.classModel.ClassINGVO;

import java.util.*;
import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ClassINGDAOImpl implements ClassINGDAO {
    private static DataSource ds = null;
    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }
    private static final String INSERT_STMT =
            "INSERT INTO class_ing (class_id, ing_id,ing_nums) VALUES (?, ?, ?)";
    private static final String GET_ALL_STMT =
            "SELECT class_id,ing_id,ing_nums FROM class order by class_id";
    private static final String GET_ONE_STMT =
            "SELECT class_id,ing_id,ing_nums FROM class where class_id = ?";
    private static final String DELETE =
            "DELETE FROM class where class_id = ?, ing_id=?";
    private static final String UPDATE =
            "UPDATE class_id set ing_id=?,ing_nums=? where class_id = ?";

    @Override
    public void insert(com.cha102.diyla.sweetclass.classModel.ClassINGVO classINGVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(INSERT_STMT);

            pstmt.setInt(1, classINGVO.getClassId());
            pstmt.setInt(2, classINGVO.getIngId());
            pstmt.setInt(3, classINGVO.getIngNums());

            pstmt.executeUpdate();

            // Handle any SQL errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public void update(com.cha102.diyla.sweetclass.classModel.ClassINGVO classINGVO) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setInt(1, classINGVO.getClassId());
            pstmt.setInt(2, classINGVO.getIngId());
            pstmt.setInt(3, classINGVO.getIngNums());

            pstmt.executeUpdate();

            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
    }

    @Override
    public void delete(Integer claID, Integer ingID) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(DELETE);

            pstmt.setInt(1, claID);
            pstmt.setInt(2, ingID);

            pstmt.executeUpdate();

            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException se) {
                    se.printStackTrace(System.err);
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }

    }

    @Override
    public com.cha102.diyla.sweetclass.classModel.ClassINGVO findByPrimaryKey(Integer claID, Integer ingID) {
        com.cha102.diyla.sweetclass.classModel.ClassINGVO classINGVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ONE_STMT);

            pstmt.setInt(1, claID);
            pstmt.setInt(2, ingID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                classINGVO = new com.cha102.diyla.sweetclass.classModel.ClassINGVO();
                classINGVO.setClassId(rs.getInt("class_id"));
                classINGVO.setIngId(rs.getInt("ing_id"));
                classINGVO.setIngNums(rs.getInt("ing_nums"));

            }

            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
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
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return classINGVO;
    }

    @Override
    public List<com.cha102.diyla.sweetclass.classModel.ClassINGVO> getAll() {
        List<com.cha102.diyla.sweetclass.classModel.ClassINGVO> list = new ArrayList<com.cha102.diyla.sweetclass.classModel.ClassINGVO>();
        com.cha102.diyla.sweetclass.classModel.ClassINGVO classINGVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                // empVO 也稱為 Domain objects
                classINGVO = new ClassINGVO();
                classINGVO.setClassId(rs.getInt("class_id"));
                classINGVO.setIngId(rs.getInt("ing_id"));
                classINGVO.setIngNums(rs.getInt("ing_nums"));
                list.add(classINGVO); // Store the row in the list
            }

            // Handle any driver errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
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
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                }
            }
        }
        return list;

    }
}
