package com.sale_list.model;

import java.io.Serializable;

public class Sale_listVO implements Serializable{
	private String sapro_no;
	private String prodno;
	private int sapro_price;
	
	public String getSapro_no() {
		return sapro_no;
	}
	public void setSapro_no(String sapro_no) {
		this.sapro_no = sapro_no;
	}
	public String getProdno() {
		return prodno;
	}
	public void setProdno(String prodno) {
		this.prodno = prodno;
	}
	public int getSapro_price() {
		return sapro_price;
	}
	public void setSapro_price(int sapro_price) {
		this.sapro_price = sapro_price;
	}

}
