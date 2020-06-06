package com.product.model;

import java.io.Serializable;

public class ProductVO implements Serializable{

	private String prodno;
	private String pclass_id;
	private String prodname;
	private int prodprice;
	private int prodqty;
	private byte prodpic[];
	private String prodesc;
	private String prodsta;
	
	public String getProdno() {
		return prodno;
	}
	public void setProdno(String prodno) {
		this.prodno = prodno;
	}
	public String getPclass_id() {
		return pclass_id;
	}
	public void setPclass_id(String pclass_id) {
		this.pclass_id = pclass_id;
	}
	public String getProdname() {
		return prodname;
	}
	public void setProdname(String prodname) {
		this.prodname = prodname;
	}
	public int getProdprice() {
		return prodprice;
	}
	public void setProdprice(int prodprice) {
		this.prodprice = prodprice;
	}
	public int getProdqty() {
		return prodqty;
	}
	public void setProdqty(int prodqty) {
		this.prodqty = prodqty;
	}
	public byte[] getProdpic() {
		return prodpic;
	}
	public void setProdpic(byte[] prodpic) {
		this.prodpic = prodpic;
	}
	public String getProdesc() {
		return prodesc;
	}
	public void setProdesc(String prodesc) {
		this.prodesc = prodesc;
	}
	public String getProdsta() {
		return prodsta;
	}
	public void setProdsta(String prodsta) {
		this.prodsta = prodsta;
	}

	
}
