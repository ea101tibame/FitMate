package com.information.model;

import java.sql.Date;

public class InformationVO implements java.io.Serializable{
	
	private String inno ;
	private Date indate ;
	private String intitle ;
	public String getIntitle() {
		return intitle;
	}
	public void setIntitle(String intitle) {
		this.intitle = intitle;
	}
	private String indesc ;
	
	public String getInno() {
		return inno;
	}
	public void setInno(String inno) {
		this.inno = inno;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public String getIndesc() {
		return indesc;
	}
	public void setIndesc(String indesc) {
		this.indesc = indesc;
	}
}
