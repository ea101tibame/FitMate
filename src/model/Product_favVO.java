package com.product_fav.model;

import java.io.Serializable;

public class Product_favVO implements Serializable{
	private String stuno;
	private String prodno;
	public String getStuno() {
		return stuno;
	}
	public void setStuno(String stuno) {
		this.stuno = stuno;
	}
	public String getProdno() {
		return prodno;
	}
	public void setProdno(String prodno) {
		this.prodno = prodno;
	}

}
