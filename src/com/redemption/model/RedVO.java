package com.redemption.model;

import java.sql.*;

public class RedVO implements java.io.Serializable {
	private String redno;
	private String coano;
	private Timestamp reddate;
	private Integer redprice;
	
	
	public String getRedno() {
		return redno;
	}
	public void setRedno(String redno) {
		this.redno = redno;
	}
	public String getCoano() {
		return coano;
	}
	public void setCoano(String coano) {
		this.coano = coano;
	}
	public Timestamp getReddate() {
		return reddate;
	}
	public void setReddate(Timestamp reddate) {
		this.reddate = reddate;
	}
	public Integer getRedprice() {
		return redprice;
	}
	public void setRedprice(Integer redprice) {
		this.redprice = redprice;
	}

}
