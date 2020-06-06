package com.article.model;

import oracle.sql.BLOB;

public class ArticleVo {
	private String  artno;
	private String  arttitle;
	private String  artcon;
	private String  artdate;
	private String  stuno;
	private String  coano;
	private Byte[]  artpic;
	private String  artsta;
	
	
	public String getArtno() {
		return artno;
	}
	public void setArtno(String artno) {
		this.artno = artno;
	}
	public String getArttitle() {
		return arttitle;
	}
	public void setArttitle(String arttitle) {
		this.arttitle = arttitle;
	}
	public String getArtcon() {
		return artcon;
	}
	public void setArtcon(String artcon) {
		this.artcon = artcon;
	}
	public String getArtdate() {
		return artdate;
	}
	public void setArtdate(String artdate) {
		this.artdate = artdate;
	}
	public String getStuno() {
		return stuno;
	}
	public void setStuno(String stuno) {
		this.stuno = stuno;
	}
	public String getCoano() {
		return coano;
	}
	public void setCoano(String coano) {
		this.coano = coano;
	}
	public Byte[] getArtpic() {
		return artpic;
	}
	public void setArtpic(Byte[] artpic) {
		this.artpic = artpic;
	}
	public String getArtsta() {
		return artsta;
	}
	public void setArtsta(String artsta) {
		this.artsta = artsta;
	}
	
	
}
