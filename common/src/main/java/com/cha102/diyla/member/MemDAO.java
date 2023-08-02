package com.cha102.diyla.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class MemDAO implements MemDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/diyla?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "T2012w1221";

	@Override
	public void insert(MemVO memVo) {

		Connection con = null;
		PreparedStatement pre = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pre = con.prepareStatement(
					"INSERT into member(mem_name,mem_email,mem_password,mem_phone,mem_birthday,mem_gender,mem_address)VALUES(?,?,?,?,?,?,?)");
			pre.setString(1, memVo.getMem_name());
			pre.setString(2, memVo.getMem_email());
			pre.setString(3, memVo.getMem_password());
			pre.setString(4, memVo.getMem_phone());
			pre.setDate(5, memVo.getMem_date());
			pre.setInt(6, memVo.getMem_gender());
			pre.setString(7, memVo.getMem_address());

			pre.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pre != null) {
				try {
					pre.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}

			}
		}

	}

	@Override
	public void delete(Integer mem_id) {
		Connection con = null;
		PreparedStatement pre = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pre = con.prepareStatement("DELETE from member where mem_id =?");
			pre.setInt(1, mem_id);
			pre.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pre != null) {
				try {
					pre.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(MemVO memVo) {
		Connection con = null;
		PreparedStatement pre = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pre = con.prepareStatement(
					"UPDATE member set mem_name=?,mem_password=?,mem_phone=?,mem_address=?,mem_status=?,mem_token=?,blacklist_com=?,blacklist_art=?,blacklist_diy=?,blacklist_class=?,rpmsg_count=? where mem_id = ?");
			pre.setString(1, memVo.getMem_name());
			pre.setString(2, memVo.getMem_password());
			pre.setString(3, memVo.getMem_phone());
			pre.setString(4, memVo.getMem_address());
			pre.setInt(5, memVo.getMem_status());
			pre.setInt(6, memVo.getMem_token());
			pre.setInt(7, memVo.getBlacklist_com());
			pre.setInt(8, memVo.getBlacklist_art());
			pre.setInt(9, memVo.getBlacklist_diy());
			pre.setInt(10, memVo.getBlacklist_class());
			pre.setInt(11, memVo.getRpmsg_count());
			pre.setInt(12, memVo.getMem_id());

			pre.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pre != null) {
				try {
					pre.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public MemVO findByPrimaryKey(Integer mem_id) {
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		MemVO memVo = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pre = con.prepareStatement(
					"SELECT mem_name,mem_email,mem_password,mem_phone,mem_birthday,mem_gender,mem_address,mem_status,mem_token,mem_date,blacklist_com,blacklist_art,blacklist_diy,blacklist_class,rpmsg_count FROM MEMBER WHERE MEM_ID = ?");
			pre.setInt(1, mem_id);
			rs = pre.executeQuery();
			
			while (rs.next()) {
				memVo = new MemVO();
				memVo.setMem_name(rs.getString("mem_name"));
				memVo.setMem_email(rs.getString("mem_email"));
				memVo.setMem_password(rs.getString("mem_password"));
				memVo.setMem_phone(rs.getString("mem_phone"));
				memVo.setMem_birthday(rs.getDate("mem_birthday"));
				memVo.setMem_gender(rs.getInt("mem_gender"));
				memVo.setMem_address(rs.getString("mem_address"));
				memVo.setMem_status(rs.getInt("mem_status"));
				memVo.setMem_date(rs.getDate("mem_date"));
				memVo.setMem_token(rs.getInt("mem_token"));
				memVo.setBlacklist_com(rs.getInt("blacklist_com"));
				memVo.setBlacklist_art(rs.getInt("blacklist_art"));
				memVo.setBlacklist_diy(rs.getInt("blacklist_diy"));
				memVo.setBlacklist_class(rs.getInt("blacklist_class"));
				memVo.setRpmsg_count(rs.getInt("rpmsg_count"));

			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (pre != null) {
				try {
					pre.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}

		return memVo;
	}

	@Override
	public List<MemVO> getAll() {
		List<MemVO> memList = new ArrayList<MemVO>();
		Connection con = null;
		PreparedStatement pre = null;
		ResultSet rs = null;
		MemVO memVo = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pre = con.prepareStatement(
					"SELECT mem_id,mem_name,mem_email,mem_password,mem_phone,mem_birthday,mem_gender,mem_address,mem_status,mem_token,mem_date,blacklist_com,blacklist_art,blacklist_diy,blacklist_class,rpmsg_count from member order by mem_id");
			rs = pre.executeQuery();

			while (rs.next()) {
				memVo = new MemVO();
				memVo.setMem_id(rs.getInt("mem_id"));
				memVo.setMem_name(rs.getString("mem_name"));
				memVo.setMem_email(rs.getString("mem_email"));
				memVo.setMem_password(rs.getString("mem_password"));
				memVo.setMem_phone(rs.getString("mem_phone"));
				memVo.setMem_birthday(rs.getDate("mem_birthday"));
				memVo.setMem_gender(rs.getInt("mem_gender"));
				memVo.setMem_address(rs.getString("mem_address"));
				memVo.setMem_status(rs.getInt("mem_status"));
				memVo.setMem_date(rs.getDate("mem_date"));
				memVo.setMem_token(rs.getInt("mem_token"));
				memVo.setBlacklist_com(rs.getInt("blacklist_com"));
				memVo.setBlacklist_art(rs.getInt("blacklist_art"));
				memVo.setBlacklist_diy(rs.getInt("blacklist_diy"));
				memVo.setBlacklist_class(rs.getInt("blacklist_class"));
				memVo.setRpmsg_count(rs.getInt("rpmsg_count"));
				memList.add(memVo);

			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pre != null) {
				try {
					pre.close();
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
		return memList;
	}
	public static void main(String[] args) {
		MemDAO mem = new MemDAO();
		// 新增
		MemVO memVo = new MemVO();
		memVo.setMem_name("xxx");
		memVo.setMem_email("abc@diyla.com.tw");
		memVo.setMem_password("123456");
		memVo.setMem_phone("0933444555");
		memVo.setMem_date(java.sql.Date.valueOf("2020-01-01"));
		memVo.setMem_gender(1);
		memVo.setMem_address("花蓮市北濱街");
		mem.insert(memVo);
		// 修改
		MemVO memVo2 = new MemVO();
		memVo2.setMem_id(1);
		memVo2.setMem_name("DIY一起拉");
		memVo2.setMem_password("654321");
		memVo2.setMem_phone("0998765432");
		memVo2.setMem_address("台北市yy");
		memVo2.setMem_status(1);
		memVo2.setMem_token(100);
		memVo2.setBlacklist_com(1);
		memVo2.setBlacklist_art(1);
		memVo2.setBlacklist_diy(1);
		memVo2.setBlacklist_class(1);
		memVo2.setRpmsg_count(2);
		mem.update(memVo2);
	
		//查詢
		MemVO memVo3 = mem.findByPrimaryKey(3);
		System.out.println(memVo3.getMem_name()+ ",");
		System.out.println(memVo3.getMem_email()+ ",");
		System.out.println(memVo3.getMem_password()+ ",");
		System.out.println(memVo3.getMem_phone()+ ",");
		System.out.println(memVo3.getMem_birthday()+ ",");
		System.out.println(memVo3.getMem_gender()+ ",");
		System.out.println(memVo3.getMem_address()+ ",");
		System.out.println(memVo3.getMem_status()+ ",");
		System.out.println(memVo3.getMem_date()+ ",");
		System.out.println(memVo3.getMem_token()+ ",");
		System.out.println(memVo3.getBlacklist_com()+ ",");
		System.out.println(memVo3.getBlacklist_art()+ ",");
		System.out.println(memVo3.getBlacklist_diy()+ ",");
		System.out.println(memVo3.getBlacklist_class()+ ",");
		System.out.println(memVo3.getRpmsg_count()+ ",");
		System.out.println("---------------------");
		
		
		List<MemVO> list = mem.getAll();
		for (MemVO m :list) {
			System.out.println(m.getMem_id()+ ",");
			System.out.println(m.getMem_name()+ ",");
			System.out.println(m.getMem_email()+ ",");
			System.out.println(m.getMem_password()+ ",");
			System.out.println(m.getMem_phone()+ ",");
			System.out.println(m.getMem_birthday()+ ",");
			System.out.println(m.getMem_gender()+ ",");
			System.out.println(m.getMem_address()+ ",");
			System.out.println(m.getMem_status()+ ",");
			System.out.println(m.getMem_date()+ ",");
			System.out.println(m.getMem_token()+ ",");
			System.out.println(m.getBlacklist_com()+ ",");
			System.out.println(m.getBlacklist_art()+ ",");
			System.out.println(m.getBlacklist_diy()+ ",");
			System.out.println(m.getBlacklist_class()+ ",");
			System.out.println(m.getRpmsg_count()+ ",");
			System.out.println("---------------------");
			
		}
		
		//刪除
		mem.delete(7);
		
		
		
	}
}
