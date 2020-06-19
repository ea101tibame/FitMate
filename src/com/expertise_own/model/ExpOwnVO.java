package com.expertise_own.model;

public class ExpOwnVO implements java.io.Serializable {

	private String coano;
	private String expno;
	private String expdesc;
	private byte[] expown;

	public String getCoano() {
		return coano;
	}

	public void setCoano(String coano) {
		this.coano = coano;
	}

	public String getExpno() {
		return expno;
	}

	public void setExpno(String expno) {
		this.expno = expno;
	}
	
	public String getExpdesc() {
		return expdesc;
	}

	public void setExpdesc(String expdesc) {
		this.expdesc = expdesc;
	}
	
	public byte[] getExpown() {
		return expown;
	}

	public void setExpown(byte[] expown) {
		this.expown = expown;
	}

}
