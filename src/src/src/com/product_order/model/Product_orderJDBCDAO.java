package com.product_order.model;

import java.sql.*;
import java.util.*;

import com.product_order.model.Product_orderVO;
import com.product_order_list.model.Product_order_listJDBCDAO;
import com.product_order_list.model.Product_order_listVO;

public class Product_orderJDBCDAO implements Product_orderDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String userid = "EA101G5";
	String passwd = "EA101G5";

	private static final String INSERT_STMT = "INSERT INTO product_order(pordno,stuno,porddate,pordtotal,pordadd,pordsta,fare)VALUES(to_char(sysdate,'yyyymmdd')||'-PO'||LPAD(to_char(PRODUCT_ORDERseq.NEXTVAL), 3, '0'),?,CURRENT_TIMESTAMP,?,?,?,?)";
	private static final String UPDATE = "UPDATE product_order set stuno=?, pordtotal=?, pordadd=?,pordsta=?,fare=? where pordno=?";
	private static final String DELETE = "DELETE FROM product_order where pordno=?";
	private static final String GET_ONE_STMT = "SELECT pordno,stuno,porddate,pordtotal,pordadd,pordsta,fare from product_order where pordno=?";
	private static final String GET_ALL_STMT = "SELECT pordno,stuno,porddate,pordtotal,pordadd,pordsta,fare from product_order order by pordno";

	@Override
	public void insert(Product_orderVO product_orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, product_orderVO.getStuno());
			pstmt.setInt(2, product_orderVO.getPordtotal());
			pstmt.setString(3, product_orderVO.getPordadd());
			pstmt.setString(4, product_orderVO.getPordsta());
			pstmt.setInt(5, product_orderVO.getFare());

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
	public void update(Product_orderVO product_orderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, product_orderVO.getStuno());
			pstmt.setInt(2, product_orderVO.getPordtotal());
			pstmt.setString(3, product_orderVO.getPordadd());
			pstmt.setString(4, product_orderVO.getPordsta());
			pstmt.setInt(5, product_orderVO.getFare());
			pstmt.setString(6, product_orderVO.getPordno());

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
	public void delete(String pordno) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, pordno);
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
	public Product_orderVO findByPrimaryKey(String pordno) {
		Product_orderVO poVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, pordno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				poVO = new Product_orderVO();
				poVO.setPordno(rs.getString("pordno"));
				poVO.setStuno(rs.getString("stuno"));
				poVO.setPorddate(rs.getDate("porddate"));
				poVO.setPordtotal(rs.getInt("pordtotal"));
				poVO.setPordadd(rs.getString("pordadd"));
				poVO.setPordsta(rs.getString("pordsta"));
				poVO.setFare(rs.getInt("fare"));

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
		return poVO;
	}

	@Override
	public List<Product_orderVO> getAll() {
		List<Product_orderVO> list = new ArrayList<Product_orderVO>();
		Product_orderVO poVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				poVO = new Product_orderVO();
				poVO.setPordno(rs.getString("pordno"));
				poVO.setStuno(rs.getString("stuno"));
				poVO.setPorddate(rs.getDate("porddate"));
				poVO.setPordtotal(rs.getInt("pordtotal"));
				poVO.setPordadd(rs.getString("pordadd"));
				poVO.setPordsta(rs.getString("pordsta"));
				poVO.setFare(rs.getInt("fare"));
				list.add(poVO);
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
	public void insertWithPordList(Product_orderVO product_orderVO, List<Product_order_listVO> list) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			con.setAutoCommit(false);

			String cols[] = { "PORDNO" };
			pstmt = con.prepareStatement(INSERT_STMT, cols);
			pstmt.setString(1, product_orderVO.getStuno());
			pstmt.setInt(2, product_orderVO.getPordtotal());
			pstmt.setString(3, product_orderVO.getPordadd());
			pstmt.setString(4, product_orderVO.getPordsta());
			pstmt.setInt(5, product_orderVO.getFare());
			pstmt.executeUpdate();

			String next_pordno = null;

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				next_pordno = rs.getString(1);
				System.out.println("自增主鍵值" + next_pordno + "(剛新增成功的部門編號)");
			} else {
				System.out.println("未取得自增主鍵值");
			}
			rs.close();
			Product_order_listJDBCDAO dao = new Product_order_listJDBCDAO();
			System.out.println("list.size()" + list.size());
			for (Product_order_listVO aproduct : list) {
				aproduct.setPordno(new String(next_pordno));
				dao.insert2(aproduct, con);
			}
			con.commit();
			con.setAutoCommit(true);
			System.out.println("list.size()-B" + list.size());
			System.out.println("新增部門編號" + next_pordno + "時，共有訂單詳情" + list.size() + "筆同時被新增");

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver." + e.getMessage());
		} catch (SQLException se) {
			if (con != null) {
				try {
					System.err.print("Transaction is being");
					System.err.println("rolled back由product_order_list");
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
		Product_orderJDBCDAO dao2 = new Product_orderJDBCDAO();
//測試新增		
//		Product_orderVO poVO1 = new Product_orderVO();
//		poVO1.setStuno("S001");
//		poVO1.setPordtotal(999);
//		poVO1.setPordadd("桃園市龜山區萬壽路二段98號");
//		poVO1.setPordsta("待出貨");
//		poVO1.setFare(80);
//		dao.insert(poVO1);

//測試修改
//		Product_orderVO poVO2=new Product_orderVO();
//		poVO2.setStuno("S001");
//		poVO2.setPordtotal(999);
//		poVO2.setPordadd("桃園市中壢區龍東路37號");
//		poVO2.setPordsta("待出貨");
//		poVO2.setFare(0);
//		poVO2.setPordno("20200612-PO011");
//		dao.update(poVO2);

//測試刪除
//		dao.delete("20200612-PO011");

//測試查一筆
//		Product_orderVO poVO2=dao.findByPrimaryKey("20200419-PO001");
//		System.out.print(poVO2.getPordno()+" ");
//		System.out.print(poVO2.getStuno()+" ");
//		System.out.print(poVO2.getPorddate()+" ");
//		System.out.print(poVO2.getPordtotal()+" ");
//		System.out.print(poVO2.getPordadd()+" ");
//		System.out.print(poVO2.getPordsta()+" ");
//		System.out.print(poVO2.getFare()+" ");

//測試查全部
//		List<Product_orderVO> list = dao.getAll();
//		for (Product_orderVO poVO3 : list) {
//			System.out.print(poVO3.getPordno()+" ");
//			System.out.print(poVO3.getStuno()+" ");
//			System.out.print(poVO3.getPorddate()+" ");
//			System.out.print(poVO3.getPordtotal()+" ");
//			System.out.print(poVO3.getPordadd()+" ");
//			System.out.print(poVO3.getPordsta()+" ");
//			System.out.print(poVO3.getFare()+" ");
//			System.out.println();
//		}

		Product_orderVO poVO4 = new Product_orderVO();
		poVO4.setStuno("S001");
		poVO4.setPordtotal(300);
		poVO4.setPordadd("中壢區莒光路25號");
		poVO4.setPordsta("待出貨");
		poVO4.setFare(80);

		List<Product_order_listVO> testList = new ArrayList<Product_order_listVO>();
		Product_order_listVO polVO5 = new Product_order_listVO();
		polVO5.setProdno("P001");
		polVO5.setPord_listqty(new Integer(2));
		polVO5.setPord_listprice(new Integer(100));

		Product_order_listVO polVO6 = new Product_order_listVO();
		polVO6.setProdno("P002");
		polVO6.setPord_listqty(new Integer(2));
		polVO6.setPord_listprice(new Integer(149));

		testList.add(polVO5);
		testList.add(polVO6);

		dao2.insertWithPordList(poVO4, testList);

	}

}
