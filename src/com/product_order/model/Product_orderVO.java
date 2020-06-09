package com.product_order.model;

import java.io.Serializable;

public class Product_orderVO implements Serializable{
	
	private String pordno;
	private String stuno;
	private String porddate;
	private int pordtotal;
	private String pordadd;
	private String pordsta;
	private int fare;
	
	
	public String getPordno() {
		return pordno;
	}
	public void setPordno(String pordno) {
		this.pordno = pordno;
	}
	public String getStuno() {
		return stuno;
	}
	public void setStuno(String stuno) {
		this.stuno = stuno;
	}
	public String getPorddate() {
		return porddate;
	}
	public void setPorddate(String porddate) {
		this.porddate = porddate;
	}
	public int getPordtotal() {
		return pordtotal;
	}
	public void setPordtotal(int pordtotal) {
		this.pordtotal = pordtotal;
	}
	public String getPordadd() {
		return pordadd;
	}
	public void setPordadd(String pordadd) {
		this.pordadd = pordadd;
	}
	public String getPordsta() {
		return pordsta;
	}
	public void setPordsta(String pordsta) {
		this.pordsta = pordsta;
	}
	public int getFare() {
		return fare;
	}
	public void setFare(int fare) {
		this.fare = fare;
	}
	
	
}
