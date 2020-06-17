package com.coach.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CoaJDBCDAO implements CoaDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
//	String url = "jdbc:oracle:thin:@localhost:1521:XE"; // for class
	String url = "jdbc:oracle:thin:@localhost:49161:XE"; // for home dev
	String userid = "EA101G5";
	String passwd = "EA101G5";

	private static final String INSERT_STMT = "INSERT INTO coach (coano,coaname,coapsw,coamail,coatel,coaacc,coapic,coasex,coaintro) VALUES ('C'||LPAD(to_char(coach_seq.NEXTVAL),3,'0'), ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE coach set coaname=?, coapsw=?, coamail=?, coatel=?, coaacc=?, coapoint=?, coasta=?, coapic=?, coasex=?, coaintro=?, coasctotal=?, coascqty=? where coano=?";
	private static final String DELETE = "DELETE FROM coach where coano = ?";
	private static final String GET_ONE_STMT = "SELECT coano,coaname,coapsw,coamail,coatel,coaacc,coapoint,coasta,coapic,coasex,coaintro,coasctotal,coascqty FROM coach where coano = ?";
	private static final String GET_ALL_STMT = "SELECT coano,coaname,coapsw,coamail,coatel,coaacc,coapoint,coasta,coapic,coasex,coaintro,coasctotal,coascqty FROM coach order by coano";

	@Override
	public void insert(CoaVO coaVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, coaVO.getCoaname());
			pstmt.setString(2, coaVO.getCoapsw());
			pstmt.setString(3, coaVO.getCoamail());
			pstmt.setString(4, coaVO.getCoatel());
			pstmt.setString(5, coaVO.getCoaacc());
			pstmt.setBytes(6, coaVO.getCoapic());
			pstmt.setString(7, coaVO.getCoasex());
			pstmt.setString(8, coaVO.getCoaintro());

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

	@Override
	public void update(CoaVO coaVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, coaVO.getCoaname());
			pstmt.setString(2, coaVO.getCoapsw());
			pstmt.setString(3, coaVO.getCoamail());
			pstmt.setString(4, coaVO.getCoatel());
			pstmt.setString(5, coaVO.getCoaacc());
			pstmt.setInt(6, coaVO.getCoapoint());
			pstmt.setString(7, coaVO.getCoasta());
			pstmt.setBytes(8, coaVO.getCoapic());
			pstmt.setString(9, coaVO.getCoasex());
			pstmt.setString(10, coaVO.getCoaintro());
			pstmt.setInt(11, coaVO.getCoasctotal());
			pstmt.setInt(12, coaVO.getCoascqty());
			pstmt.setString(13, coaVO.getCoano());

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

	@Override
	public void delete(String coano) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, coano);

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

	@Override
	public CoaVO findByPrimaryKey(String coano) {

		CoaVO coaVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, coano);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				coaVO = new CoaVO();
				coaVO.setCoano(rs.getString("coano"));
				coaVO.setCoaname(rs.getString("coaname"));
				coaVO.setCoapsw(rs.getString("coapsw"));
				coaVO.setCoamail(rs.getString("coamail"));
				coaVO.setCoatel(rs.getString("coatel"));
				coaVO.setCoaacc(rs.getString("coaacc"));
				coaVO.setCoapoint(rs.getInt("coapoint"));
				coaVO.setCoasta(rs.getString("coasta"));
				coaVO.setCoapic(rs.getBytes("coapic"));
				coaVO.setCoasex(rs.getString("coasex"));
				coaVO.setCoaintro(rs.getString("coaintro"));
				coaVO.setCoasctotal(rs.getInt("coasctotal"));
				coaVO.setCoascqty(rs.getInt("coascqty"));

			}

			// Handle any driver errors
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
		return coaVO;
	}

	@Override
	public List<CoaVO> getAll() {
		List<CoaVO> list = new ArrayList<CoaVO>();
		CoaVO coaVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				coaVO = new CoaVO();
				coaVO.setCoano(rs.getString("coano"));
				coaVO.setCoaname(rs.getString("coaname"));
				coaVO.setCoapsw(rs.getString("coapsw"));
				coaVO.setCoamail(rs.getString("coamail"));
				coaVO.setCoatel(rs.getString("coatel"));
				coaVO.setCoaacc(rs.getString("coaacc"));
				coaVO.setCoapoint(rs.getInt("coapoint"));
				coaVO.setCoasta(rs.getString("coasta"));
				coaVO.setCoapic(rs.getBytes("coapic"));
				coaVO.setCoasex(rs.getString("coasex"));
				coaVO.setCoaintro(rs.getString("coaintro"));
				coaVO.setCoasctotal(rs.getInt("coasctotal"));
				coaVO.setCoascqty(rs.getInt("coascqty"));
				list.add(coaVO); // Store the row in the list
			}

			// Handle any driver errors
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

	public static byte[] getPicByteArray(String path) throws IOException {
		File pic = new File(path);
		FileInputStream fis = new FileInputStream(pic);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] eachBuffer = new byte[4096];// 一次送多少出去
		int currentBytes;// 當前送多少bytes出去 (ex:總共有200 bytes，一次送150
							// bytes，所以會送三次，每次currentBytes分別為150，150，50)
		while ((currentBytes = fis.read(eachBuffer)) != -1) {
			baos.write(eachBuffer, 0, currentBytes);
		}
		baos.close();
		fis.close();
		return baos.toByteArray();// 回傳管子內建的byte陣列，取得裝有位元資料的byte陣列 陣列
	}

	public static void main(String[] args) {

		CoaJDBCDAO dao = new CoaJDBCDAO();

		// insert
//		CoaVO coaVO1 = new CoaVO();
//		coaVO1.setCoaname("大吳教練");
//		coaVO1.setCoapsw("peter123");
//		coaVO1.setCoamail("peter123@gmail.com");
//		coaVO1.setCoatel("0988088888");
//		coaVO1.setCoaacc("52366899555123");
//		coaVO1.setCoapoint(100000);
//		coaVO1.setCoasta("未授權");
//		coaVO1.setCoasex("男");
//		coaVO1.setCoaintro("減肥是一輩子的事，快來找我運動吧！");
//		coaVO1.setCoasctotal(100);
//		coaVO1.setCoascqty(1000);
//
//		try {
//			byte[] pic = getPicByteArray("WebContent/img/coach-image/C011.jpg");
//			coaVO1.setCoapic(pic);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		dao.insert(coaVO1);

		// update

//		CoaVO coaVO2 = new CoaVO();
//		coaVO2.setCoaname("吳神教練");
//		coaVO2.setCoapsw("peter123");
//		coaVO2.setCoamail("peter123@gmail.com");
//		coaVO2.setCoatel("0988088888");
//		coaVO2.setCoaacc("52366899555123");
//		coaVO2.setCoapoint(100000);
//		coaVO2.setCoasta("已授權");
//		coaVO2.setCoasex("男");
//		coaVO2.setCoaintro("減肥是一輩子的事，快來我偶運動吧！");
//		coaVO2.setCoasctotal(100);
//		coaVO2.setCoascqty(1000);
//		coaVO2.setCoano("C010");
//
//		try {
//			byte[] pic = getPicByteArray("WebContent/img/coach-image/C010.jpg");
//			coaVO2.setCoapic(pic);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		dao.update(coaVO2);
//
//		//delete
//		dao.delete("C014");
//
//		 find one
//		CoaVO coaVO3 = dao.findByPrimaryKey("C010");
//		System.out.print(coaVO3.getCoano() + ",");
//		System.out.print(coaVO3.getCoaname() + ",");
//		System.out.print(coaVO3.getCoapsw() + ",");
//		System.out.print(coaVO3.getCoamail() + ",");
//		System.out.print(coaVO3.getCoatel() + ",");
//		System.out.print(coaVO3.getCoaacc() + ",");
//		System.out.print(coaVO3.getCoapoint() + ",");
//		System.out.print(coaVO3.getCoasta() + ",");
//		System.out.print(coaVO3.getCoapic() + ",");
//		System.out.print(coaVO3.getCoasex() + ",");
//		System.out.print(coaVO3.getCoaintro() + ",");
//		System.out.print(coaVO3.getCoasctotal() + ",");
//		System.out.print(coaVO3.getCoascqty());

////		System.out.println("---------------------");

////		// find all
//		List<CoaVO> list = dao.getAll();
//		for (CoaVO aCoa : list) {
//
//			System.out.print(aCoa.getCoano() + ",");
//			System.out.print(aCoa.getCoaname() + ",");
//			System.out.print(aCoa.getCoapsw() + ",");
//			System.out.print(aCoa.getCoamail() + ",");
//			System.out.print(aCoa.getCoatel() + ",");
//			System.out.print(aCoa.getCoaacc() + ",");
//			System.out.print(aCoa.getCoapoint() + ",");
//			System.out.print(aCoa.getCoasta() + ",");
//			System.out.print(aCoa.getCoapic() + ",");
//			System.out.print(aCoa.getCoasex() + ",");
//			System.out.print(aCoa.getCoaintro() + ",");
//			System.out.print(aCoa.getCoasctotal() + ",");
//			System.out.print(aCoa.getCoascqty() + ",");
//
//			System.out.println();
//		}

	}

}
