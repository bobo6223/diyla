package com.cha102.diyla.diyForum;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class DiyForumJDBCDAO implements DiyForumDAO_Interface {
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/diyla?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "580531";
	
	private static final String INSERT_STMT = "INSERT INTO diy_forum (MEM_ID,DIY_NO,ARTI_CONT,DIY_GRA) VALUES ( ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT ARTI_NO,MEM_ID,DIY_NO,ARTI_CONT,DIY_GRA FROM diy_forum order by ARTI_NO";
	private static final String GET_ONE_STMT = "SELECT ARTI_NO,MEM_ID,DIY_NO,ARTI_CONT,DIY_GRA FROM diy_forum where ARTI_NO = ?";
	private static final String DELETE = "DELETE FROM diy_forum where ARTI_NO = ?";
	private static final String UPDATE = "UPDATE diy_forum set MEM_ID = ?,DIY_NO =?,ARTI_CONT =?,DIY_GRA =? where ARTI_NO = ?";
	
// 新增	
	@Override
	public void insert(DiyForumVO DiyForumVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, DiyForumVO.getMemId());
			pstmt.setInt(2, DiyForumVO.getDiyNo());
			pstmt.setString(3, DiyForumVO.getArtiCont());
			pstmt.setInt(4, DiyForumVO.getDiyGrade());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	
// 修改
	@Override
	public void update(DiyForumVO DiyForumVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, DiyForumVO.getMemId());
			pstmt.setInt(2, DiyForumVO.getDiyNo());
			pstmt.setString(3, DiyForumVO.getArtiCont());
			pstmt.setInt(4, DiyForumVO.getDiyGrade());
			pstmt.setInt(5, DiyForumVO.getArtiNo());


			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	
// 刪除
	@Override
	public void delete(Integer artiNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, artiNo);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	
// 查詢單筆
	@Override
	public DiyForumVO findByPrimaryKey(Integer artiNo) {
		
		
		DiyForumVO DiyForumVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, artiNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				DiyForumVO = new DiyForumVO();
				DiyForumVO.setArtiNo(rs.getInt("ARTI_NO"));
				DiyForumVO.setMemId(rs.getInt("MEM_ID"));
				DiyForumVO.setDiyNo(rs.getInt("DIY_NO"));
				DiyForumVO.setArtiCont(rs.getString("ARTI_CONT"));
				DiyForumVO.setDiyGrade(rs.getInt("DIY_GRA"));
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
		return DiyForumVO;
		
	}
	
// 查詢多筆
	@Override
	public List<DiyForumVO> getAll() {
		
		List<DiyForumVO> list = new ArrayList<DiyForumVO>();
		DiyForumVO DiyForumVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				DiyForumVO = new DiyForumVO();
				DiyForumVO.setArtiNo(rs.getInt("ARTI_NO"));
				DiyForumVO.setMemId(rs.getInt("MEM_ID"));
				DiyForumVO.setDiyNo(rs.getInt("DIY_NO"));
				DiyForumVO.setArtiCont(rs.getString("ARTI_CONT"));
				DiyForumVO.setDiyGrade(rs.getInt("DIY_GRA"));
				list.add(DiyForumVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
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
