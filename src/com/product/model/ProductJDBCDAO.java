package com.product.model;

import java.io.*;
import java.sql.*;
import java.util.List;

public class ProductJDBCDAO implements ProductDAO_interface{

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:49161:XE";
	String userid= "TEST2";
	String passwd = "TEST2";
	
	private static final String INSERT_STMT=
			"INSERT INTO Product(prodno,pclass_id,prodname,prodprice,prodqty,prodpic,prodsta)VALUES(Productseq.NEXTVAL,?,?,?,?,?,?)";
	private static final String UPDATE="UPDATE Product set pclass_id=?,prodname=?,prodprice=?,prodqty=?,prodpic=?,prodsta=?";
	private static final String DELET="DELETE FROM Product where prodno=?";
	private static final String DELETE = null;
	@Override
	public void insert(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con =DriverManager.getConnection(url,userid,passwd);
			pstmt=con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, productVO.getPclass_id());
			pstmt.setString(2,productVO.getProdname());
			pstmt.setInt(3,productVO.getProdprice());
			pstmt.setInt(4,productVO.getProdqty());
			pstmt.setBytes(5,productVO.getProdpic());
//			pstmt.setString(6,productVO.getProdesc());
			pstmt.setString(6,productVO.getProdsta());
			
			pstmt.executeUpdate();
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("Couldn;t load database driver."+e.getMessage());
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}if(con!=null) {
				try {
					con.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void update(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1,productVO.getPclass_id());
			pstmt.setInt(2,productVO.getProdprice());
			pstmt.setInt(3, productVO.getProdqty());
			pstmt.setBytes(4,productVO.getProdpic());
			pstmt.setString(5, productVO.getProdesc());
			pstmt.setString(6, productVO.getProdsta());
			
			pstmt.executeUpdate();
			
		}catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
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
	public void delete(String prodno) {
		Connection con = null;
		PreparedStatement pstmt =null;
		
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,userid,passwd);
			pstmt=con.prepareStatement(DELETE);
			
			pstmt.setString(1, prodno);
			pstmt.executeUpdate();
			
		}catch(ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver."+e.getMessage());
		}catch(SQLException se) {
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace(System.err);
				}
			}if(con!=null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public ProductVO findByPrimaryKey(String prodno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public static void main(String[] args) {
		ProductJDBCDAO dao = new ProductJDBCDAO();
		  ProductVO productVO1 = new ProductVO();
		  byte[] pic;
		  try {
		   pic = getPicByteArray("C:/G6_PIC/EMP/1.jpg");
		   productVO1.setProdpic(pic);
		   productVO1.setEmpname("測試");
		   productVO1.setEmpact("123123");
		   empVO1.setEmppwd("1111111");
		   empVO1.setMail("11111111111");
		   empVO1.setSex("male");
		   empVO1.setEmpstatus(1);
		   dao.insert(empVO1);
		  } catch (IOException e) {
		   e.printStackTrace();
		  }
		  
		  
		  
		 }
	
	public static byte[] getPicByteArray(String path) throws IOException {
		   File pic = new File(path);
		   FileInputStream fis = new FileInputStream(pic);
		   ByteArrayOutputStream baos = new ByteArrayOutputStream();
		   byte[] eachBuffer = new byte[4096];//一次送多少出去
		   int currentBytes;//當前送多少bytes出去 (ex:總共有200 bytes，一次送150 bytes，所以會送三次，每次currentBytes分別為150，150，50)
		   while((currentBytes = fis.read(eachBuffer)) != -1){
		    baos.write(eachBuffer, 0, currentBytes);
		   }
		   baos.close();
		   fis.close();
		   return baos.toByteArray();//回傳管子內建的byte陣列，取得裝有位元資料的byte陣列 陣列 
		 }
	
}
