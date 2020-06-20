package com.sale_project.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sale_list_model.Sale_listJDBCDAO;
import com.sale_list_model.Sale_listVO;
import com.sale_project.model.Sale_projectDAO_interface;
import com.sale_project.model.Sale_projectVO;

public class Sale_projectJDBCDAO implements Sale_projectDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "EA101G5";
	String passwd = "EA101G5";

	private static final String INSERT_STMT = "INSERT INTO sale_project(sapro_no,sapro_start,sapro_end)VALUES('SA'||LPAD(to_char(SALE_PROJECTseq.NEXTVAL), 3, '0'),?,?)";
	private static final String UPDATE = "UPDATE sale_project set sapro_start=?,sapro_end=? where sapro_no=?";
	private static final String DELETE = "DELETE FROM sale_project where sapro_no=?";
	private static final String GET_ONE_STMT = "SELECT sapro_no,sapro_start,sapro_end from sale_project where sapro_no=?";
	private static final String GET_ALL_STMT = "SELECT sapro_no,sapro_start,sapro_end from sale_project order by sapro_no";

	@Override
	public void insert(Sale_projectVO sale_projectVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setDate(1, sale_projectVO.getSapro_start());
			pstmt.setDate(2, sale_projectVO.getSapro_end());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver." + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
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
	public void update(Sale_projectVO sale_projectVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setDate(1, sale_projectVO.getSapro_start());
			pstmt.setDate(2, sale_projectVO.getSapro_end());
			pstmt.setString(3, sale_projectVO.getSapro_no());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("couldn't load database driver." + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
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
	public void delete(String sapro_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, sapro_no);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver." + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
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
	public Sale_projectVO findByPrimaryKey(String sapro_no) {
		Sale_projectVO spVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, sapro_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				spVO = new Sale_projectVO();
				spVO.setSapro_no(rs.getString("sapro_no"));
				spVO.setSapro_start(rs.getDate("sapro_start"));
				spVO.setSapro_end(rs.getDate("sapro_end"));
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return spVO;
	}



	@Override
	public List<Sale_projectVO> getAll() {
		List<Sale_projectVO> list = new ArrayList<Sale_projectVO>();
		Sale_projectVO spVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				spVO = new Sale_projectVO();
				spVO.setSapro_no(rs.getString("sapro_no"));
				spVO.setSapro_start(rs.getDate("sapro_start"));
				spVO.setSapro_end(rs.getDate("sapro_end"));
				list.add(spVO);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	@Override
	public void insertWithSaleList(Sale_projectVO sale_projectVO, List<Sale_listVO> list) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,userid,passwd);
			con.setAutoCommit(false);
			
			String cols[]= {"sapro_no"};
			pstmt=con.prepareStatement(INSERT_STMT,cols);
			pstmt.setDate(1, sale_projectVO.getSapro_start());
			pstmt.setDate(2, sale_projectVO.getSapro_end());
			pstmt.executeUpdate();
			
			String next_sapro_no = null;
			
			ResultSet rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				next_sapro_no =rs.getString(1);
				System.out.println("自增主鍵"+next_sapro_no+"(剛新增成功的促銷專案編號)");
			}else {
				System.out.println("未取得自增主鍵值");
			}
			rs.close();
			Sale_listJDBCDAO dao =new Sale_listJDBCDAO();
			System.out.println("list.size()"+list.size());
			for(Sale_listVO asale :list) {
				asale.setSapro_no(new String(next_sapro_no));
				dao.insert2(asale,con);
			}
			con.commit();
			con.setAutoCommit(true);
			System.out.println("list.size()-B"+list.size());
			System.out.println("新增部門編號"+next_sapro_no+"時，共有訂單詳情"+list.size()+"比同時被新增");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver." + e.getMessage());
		} catch (SQLException se) {
			if (con != null) {
				try {
					System.err.print("Transaction is being");
					System.err.println("rolled back由sale_project");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured." + excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured." + se.getMessage());
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
	public static void main(String[] args) {
		Sale_projectJDBCDAO dao = new Sale_projectJDBCDAO();

//		Sale_projectVO spVO1 =new Sale_projectVO();
//		spVO1.setSapro_start(java.sql.Date.valueOf("2020-10-15"));
//		spVO1.setSapro_end(java.sql.Date.valueOf("2020-12-30"));
//		dao.insert(spVO1);

//		Sale_projectVO spVO2 =new Sale_projectVO();
//		spVO2.setSapro_no("SA018");
//		spVO2.setSapro_start(java.sql.Date.valueOf("2020-08-15"));
//		spVO2.setSapro_end(java.sql.Date.valueOf("2020-08-30"));
//		
//		dao.update(spVO2);

//		dao.delete("SA017");

//		Sale_projectVO spVO3=dao.findByPrimaryKey("SA001");
//		System.out.print(spVO3.getSapro_no()+" ");
//		System.out.print(spVO3.getSapro_start()+" ");
//		System.out.print(spVO3.getSapro_end()+" ");

//		List<Sale_projectVO> list = dao.getAll();
//		for (Sale_projectVO spVO4 : list) {
//			System.out.print(spVO4.getSapro_no() + " ");
//			System.out.print(spVO4.getSapro_start() + " ");
//			System.out.print(spVO4.getSapro_end() + " ");
//			System.out.println();
//		}
		Sale_projectVO spVO5 =new Sale_projectVO();
		spVO5.setSapro_start(java.sql.Date.valueOf("2020-01-20"));
		spVO5.setSapro_end(java.sql.Date.valueOf("2020-06-20"));		
		
		List<Sale_listVO>list=new ArrayList<Sale_listVO>();
		Sale_listVO slVO6=new Sale_listVO();
		slVO6.setProdno("P039");
		slVO6.setSapro_price(99);
		
		list.add(slVO6);
		
		dao.insertWithSaleList(spVO5, list);
	}



}
