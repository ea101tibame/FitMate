package com.student.model;

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

import com.ProjectConfig;

public class StuJDBCDAO implements StuDAO_interface {

	private static final String INSERT_STMT = "INSERT INTO student (stuno,stuname,stupsw,stumail,stutel,stusex,stupic,stuadd,stubir) VALUES ('S'||LPAD(to_char(student_seq.NEXTVAL),3,'0'), ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE student set stuname=?, stupsw=?, stumail=?, stutel=?, stuadd=?, stupoint=?, stusta=?, stusex=?, stubir=? where stuno=?";
	private static final String DELETE = "DELETE FROM student where stuno = ?";
	private static final String GET_ONE_STMT = "SELECT stuno,stuname,stupsw,stumail,stutel,stuadd,stupoint,stusta,stupic,stusex,to_char(stubir,'yyyy-mm-dd') stubir FROM student where stuno = ?";
	private static final String GET_ONE_BY_MAIL_PSW_STMT = "SELECT stuno,stuname,stupsw,stumail,stutel,stuadd,stupoint,stusta,stusex,stubir,stupic FROM student where stumail = ? AND stupsw=? ";
	private static final String GET_ALL_STMT = "SELECT stuno,stuname,stupsw,stumail,stutel,stuadd,stupoint,stusta,stusex,to_char(stubir,'yyyy-mm-dd') stubir FROM student order by stuno";

	@Override
	public String insert(StuVO stuVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			String[] returnColumn = { "stuno" };
			pstmt = con.prepareStatement(INSERT_STMT, returnColumn);
			pstmt.setString(1, stuVO.getStuname());
			pstmt.setString(2, stuVO.getStupsw());
			pstmt.setString(3, stuVO.getStumail());
			pstmt.setString(4, stuVO.getStutel());
			pstmt.setString(5, stuVO.getStusex());
			pstmt.setBytes(6, stuVO.getStupic());
			pstmt.setString(7, stuVO.getStuadd());
			pstmt.setDate(8, stuVO.getStubir());
			pstmt.executeUpdate();

			String pk = null;
			ResultSet generatedKeys = pstmt.getGeneratedKeys();
			while (generatedKeys.next()) {
				pk = generatedKeys.getString(1);
			}
			return pk;
		}
		// Handle any driver errors
		catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		}
		// Handle any SQL errors
		catch (SQLException se) {
			se.printStackTrace();
			throw new RuntimeException("A database error occured. " + se.getMessage());
		}
		// Clean up JDBC resources
		finally {
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
	public void update(StuVO stuVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, stuVO.getStuname());
			pstmt.setString(2, stuVO.getStupsw());
			pstmt.setString(3, stuVO.getStumail());
			pstmt.setString(4, stuVO.getStutel());
			pstmt.setString(5, stuVO.getStuadd());
			pstmt.setInt(6, stuVO.getStupoint());
			pstmt.setString(7, stuVO.getStusta());
			pstmt.setString(8, stuVO.getStusex());
			pstmt.setDate(9, stuVO.getStubir());
			pstmt.setString(10, stuVO.getStuno());

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
	public void delete(String stuno) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, stuno);

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
	public StuVO findByPrimaryKey(String stuno) {

		StuVO stuVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, stuno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// stuVo
				stuVO = new StuVO();
				stuVO.setStuno(rs.getString("stuno"));
				stuVO.setStuname(rs.getString("stuname"));
				stuVO.setStupsw(rs.getString("stupsw"));
				stuVO.setStumail(rs.getString("stumail"));
				stuVO.setStutel(rs.getString("stutel"));
				stuVO.setStuadd(rs.getString("stuadd"));
				stuVO.setStupoint(rs.getInt("stupoint"));
				stuVO.setStusta(rs.getString("stusta"));
				stuVO.setStusex(rs.getString("stusex"));
				stuVO.setStubir(rs.getDate("stubir"));
				stuVO.setStupic(rs.getBytes("stupic"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			se.printStackTrace();
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
		return stuVO;
	}

	@Override
	public StuVO findByMailNPsw(String stumail, String stupsw) {

		StuVO stuVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(GET_ONE_BY_MAIL_PSW_STMT);

			pstmt.setString(1, stumail);
			pstmt.setString(2, stupsw);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// stuVo
				stuVO = new StuVO();
				stuVO.setStuno(rs.getString("stuno"));
				stuVO.setStuname(rs.getString("stuname"));
				stuVO.setStupsw(rs.getString("stupsw"));
				stuVO.setStumail(rs.getString("stumail"));
				stuVO.setStutel(rs.getString("stutel"));
				stuVO.setStuadd(rs.getString("stuadd"));
				stuVO.setStupoint(rs.getInt("stupoint"));
				stuVO.setStusta(rs.getString("stusta"));
				stuVO.setStusex(rs.getString("stusex"));
				stuVO.setStubir(rs.getDate("stubir"));
				stuVO.setStupic(rs.getBytes("stupic"));
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
		return stuVO;
	}

	@Override
	public List<StuVO> getAll() {
		List<StuVO> list = new ArrayList<StuVO>();
		StuVO stuVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(ProjectConfig.JDBC_DRIVER);
			con = DriverManager.getConnection(ProjectConfig.JDBC_URL, ProjectConfig.JDBC_USER_ID,
					ProjectConfig.JDBC_USER_PW);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// stuVO
				stuVO = new StuVO();
				stuVO.setStuno(rs.getString("stuno"));
				stuVO.setStuname(rs.getString("stuname"));
				stuVO.setStupsw(rs.getString("stupsw"));
				stuVO.setStumail(rs.getString("stumail"));
				stuVO.setStutel(rs.getString("stutel"));
				stuVO.setStuadd(rs.getString("stuadd"));
				stuVO.setStupoint(rs.getInt("stupoint"));
				stuVO.setStusta(rs.getString("stusta"));
				stuVO.setStusex(rs.getString("stusex"));
				stuVO.setStubir(rs.getDate("stubir"));
				stuVO.setStupic(rs.getBytes("stupic"));
				list.add(stuVO); // Store the row in the list
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

		StuJDBCDAO dao = new StuJDBCDAO();

		// insert
//		StuVO stuVO1 = new StuVO();
//		stuVO1.setStuname("痴痴");
//		stuVO1.setStupsw("showwhite0");
//		stuVO1.setStumail("shengshan1992@gmail.com");
//		stuVO1.setStutel("0945685236");
//		stuVO1.setStuadd("宜蘭市大坡路11巷25號");
//		stuVO1.setStupoint(10000);
//		stuVO1.setStusta("已驗證");
//		stuVO1.setStusex("女");
//		stuVO1.setStubir(java.sql.Date.valueOf("1992-01-01"));
//		try {
//			byte[] pic = getPicByteArray("WebContent/student-image/S011.png");
//			stuVO1.setStupic(pic);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		dao.insert(stuVO1);

		// update
//		StuVO stuVO2 = new StuVO();
//		
//		stuVO2.setStuname("白痴公主");
//		stuVO2.setStupsw("showwhite0");
//		stuVO2.setStumail("shengshan1992@gmail.com");
//		stuVO2.setStutel("0945685236");
//		stuVO2.setStuadd("宜蘭市大坡路11巷25號");
//		stuVO2.setStupoint(10000);
//		stuVO2.setStusta("已驗證");
//		stuVO2.setStusex("女");
//		stuVO2.setStubir(java.sql.Date.valueOf("1992-01-01"));
//		stuVO2.setStuno("S011");
//		
//		dao.update(stuVO2);

		// delete
//		dao.delete("S011");

//		// find one
//		StuVO stuVO3 = dao.findByPrimaryKey("S010");
//		System.out.print(stuVO3.getStuno() + ",");
//		System.out.print(stuVO3.getStuname() + ",");
//		System.out.print(stuVO3.getStupsw() + ",");
//		System.out.print(stuVO3.getStumail() + ",");
//		System.out.print(stuVO3.getStutel() + ",");
//		System.out.print(stuVO3.getStuadd() + ",");
//		System.out.print(stuVO3.getStupoint() + ",");
//		System.out.print(stuVO3.getStusta() + ",");
//		System.out.print(stuVO3.getStusex() + ",");
//		System.out.print(stuVO3.getStubir() + ",");
//		System.out.print(stuVO3.getStupic());

//		System.out.println("---------------------");
//
//		// find all
		List<StuVO> list = dao.getAll();
		for (StuVO aStu : list) {
			System.out.print(aStu.getStuno() + ",");
			System.out.print(aStu.getStuname() + ",");
			System.out.print(aStu.getStupsw() + ",");
			System.out.print(aStu.getStumail() + ",");
			System.out.print(aStu.getStutel() + ",");
			System.out.print(aStu.getStuadd() + ",");
			System.out.print(aStu.getStupoint() + ",");
			System.out.print(aStu.getStusta() + ",");
			System.out.print(aStu.getStusex() + ",");
			System.out.print(aStu.getStubir() + ",");
//			System.out.print(aStu.getStupic());
			System.out.println();
		}
	}

}
