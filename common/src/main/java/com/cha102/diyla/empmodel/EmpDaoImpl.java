package com.cha102.diyla.empmodel;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

public class EmpDaoImpl implements EmpDao {

    private  static final String FIND_BY_PK = "SELECT * FROM employee WHERE EMP_ID = ?";
    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/diyla?";

    public static final String USER = "root";
    public static final String PASSWORD = "sara0203";
    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }


    @Override
    public void insert(EmpVo empVo) {

    }
    public void update(EmpVo empVo) {

    }
    @Override
    public void delete(EmpVo empVo) {

    }

    @Override
    public EmpVo findByPrimaryKey(Integer empId) {
        EmpVo emp = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DriverManager.getConnection(URL,USER,PASSWORD);
            pstmt = con.prepareStatement(FIND_BY_PK);
            pstmt.setInt(1,empId);
            rs = pstmt.executeQuery();

            while (rs.next()){
                emp = new EmpVo();
                emp.setEmpId(rs.getInt("EMP_ID"));
                emp.setEmpName(rs.getString("EMP_NAME"));
                emp.setEmpAccount(rs.getString("EMP_ACCOUNT"));
                emp.setEmpPassword(rs.getString("EMP_PASSWORD"));
                emp.setEmpStatus(rs.getBoolean("EMP_STATUS"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            closeResource(con, pstmt, rs);
        }
        return emp;
    }

    @Override
    public List<EmpVo> getAll() {
        return null;
    }

    private  void closeResource(Connection con,PreparedStatement pstmt,ResultSet rs){
        if(rs != null){
            try {
                rs.close();
            } catch (SQLException rse) {
                rse.printStackTrace(System.err);
            }
        }
        if(pstmt != null){
            try {
                pstmt.close();
            } catch (SQLException pse) {
                pse.printStackTrace(System.err);
            }
        }
        if(con != null){
            try {
                con.close();
            } catch (SQLException cone) {
                cone.printStackTrace(System.err);
            }
        }
    }

    public static void main(String[] args) {
        EmpDaoImpl empDao = new EmpDaoImpl();
        EmpVo byPrimaryKey = empDao.findByPrimaryKey(1);
        System.out.println(byPrimaryKey);
    }

}

