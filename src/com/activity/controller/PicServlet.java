package com.activity.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PicServlet extends HttpServlet {
	private static final String show_PIC = "SELECT ACTPIC FROM ACTIVITY WHERE ACTNO=?";

	public PicServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String userid = "EA101G5";
		String passwd = "EA101G5";

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(show_PIC);
			String actno = req.getParameter("actno");
			pstmt.setString(1, actno);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("actpic"));
				byte[] buf = new byte[8 * 1024]; // 4K buffer
				int length;
				while ((length = in.read(buf)) != -1) {
					out.write(buf, 0, length);
				}
				out.flush();
				in.close();
			} else {
				res.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
			rs.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
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
