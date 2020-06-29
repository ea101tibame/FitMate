package com.product_order.model;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.product_order.model.Product_orderVO;
import com.product_order_list.model.Product_order_listJDBCDAO;
import com.product_order_list.model.Product_order_listVO;

public class Product_orderDAO implements Product_orderDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO product_order(pordno,stuno,porddate,pordtotal,pordadd,pordsta,fare)VALUES(to_char(sysdate,'yyyymmdd')||'-PO'||LPAD(to_char(PRODUCT_ORDERseq.NEXTVAL), 3, '0'),?,CURRENT_TIMESTAMP,?,?,?,?)";
	private static final String UPDATE = "UPDATE product_order set stuno=?, pordtotal=?, pordadd=?,pordsta=?,fare=? where pordno=?";
	private static final String DELETE = "DELETE FROM product_order where pordno=?";
	private static final String GET_ONE_STMT = "SELECT pordno,stuno,porddate,pordtotal,pordadd,pordsta,fare from product_order where pordno=?";
	private static final String GET_ALL_STMT = "SELECT pordno,stuno,porddate,pordtotal,pordadd,pordsta,fare from product_order order by pordno";
	private static final String GET_ALL_BY_STUNO = "SELECT * FROM product_order where stuno=?";

	@Override
	public void insert(Product_orderVO product_orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, product_orderVO.getStuno());
			pstmt.setInt(2, product_orderVO.getPordtotal());
			pstmt.setString(3, product_orderVO.getPordadd());
			pstmt.setString(4, product_orderVO.getPordsta());
			pstmt.setInt(5, product_orderVO.getFare());

			pstmt.executeUpdate();
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, product_orderVO.getStuno());
			pstmt.setInt(2, product_orderVO.getPordtotal());
			pstmt.setString(3, product_orderVO.getPordadd());
			pstmt.setString(4, product_orderVO.getPordsta());
			pstmt.setInt(5, product_orderVO.getFare());
			pstmt.setString(6, product_orderVO.getPordno());

			pstmt.executeUpdate();
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, pordno);
			pstmt.executeUpdate();
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
			con = ds.getConnection();
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

			con = ds.getConnection();
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
	public List<Product_orderVO> getAllByStuno(String stuno) {
		List<Product_orderVO> list = new ArrayList<Product_orderVO>();
		Product_orderVO poVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_BY_STUNO);

			pstmt.setString(1, stuno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				poVO = new Product_orderVO();
				poVO.setPordno(rs.getString("pordno"));
				poVO.setPorddate(rs.getDate("porddate"));
				poVO.setPordtotal(rs.getInt("pordtotal"));
				poVO.setPordadd(rs.getString("pordadd"));
				poVO.setPordsta(rs.getString("pordsta"));
				poVO.setFare(rs.getInt("fare"));
				list.add(poVO);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertWithPordList(Product_orderVO product_orderVO, List<Product_order_listVO> list) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
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
				System.out.println("自增主鍵值" + next_pordno + "(剛新增成功的商品編號)");
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

}
