package com.product_class.model;

import java.sql.*;
import java.util.List;

public class Product_classJDBCDAO implements Product_classDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TEST2";
	String passwd = "TEST2";
	
	private static final String INSERT_STMT = 
			"INSERT INTO product_class(pclass_id,pclass_name)VALUES(pclass_seq.NEXTVAL,?)";
	
	
		
	
	@Override
	public void insert(Product_classVO product_classVO) {
		Connection con =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(dirver);
			con=DriverManager.getConnection(url,userid,passwd);
			pstmt =con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, product);
		}
	}

	@Override
	public void update(Product_classVO product_classVO) {
		
	}

	@Override
	public void delete(Integer pclass_id) {
		
	}

	@Override
	public Product_classVO findByPrimaryKey(Integer pclass_id) {
		return null;
	}

	@Override
	public List<Product_classVO> getAll() {
		return null;
	}
	

}
