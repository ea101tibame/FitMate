package com.lesson.model;

import java.sql.Date;

public class LessonVO implements java.io.Serializable{
	private Integer lessno;
	private Integer coano;
	private String lessname;
	private Integer lessmax;
	private Integer lessmin;
	private Integer lesscur;
	private Integer lesstype;
	private String lessloc;
	private Integer lessprice;
	private String lessdesc;
	private Date lessstart;
	private Date lessend;
	private Integer lesssta;
	private Integer lesstimes;
	
	public Integer getLessno() {
		return lessno;
	}
	public void setLessno(Integer lessno) {
		this.lessno = lessno;
	}
	public Integer getCoano() {
		return coano;
	}
	public void setCoano(Integer coano) {
		this.coano = coano;
	}
	public String getLessname() {
		return lessname;
	}
	public void setLessname(String lessname) {
		this.lessname = lessname;
	}
	public Integer getLessmax() {
		return lessmax;
	}
	public void setLessmax(Integer lessmax) {
		this.lessmax = lessmax;
	}
	public Integer getLessmin() {
		return lessmin;
	}
	public void setLessmin(Integer lessmin) {
		this.lessmin = lessmin;
	}
	public Integer getLesscur() {
		return lesscur;
	}
	public void setLesscur(Integer lesscur) {
		this.lesscur = lesscur;
	}
	public Integer getLesstype() {
		return lesstype;
	}
	public void setLesstype(Integer lesstype) {
		this.lesstype = lesstype;
	}
	public String getLessloc() {
		return lessloc;
	}
	public void setLessloc(String lessloc) {
		this.lessloc = lessloc;
	}
	public Integer getLessprice() {
		return lessprice;
	}
	public void setLessprice(Integer lessprice) {
		this.lessprice = lessprice;
	}
	public String getLessdesc() {
		return lessdesc;
	}
	public void setLessdesc(String lessdesc) {
		this.lessdesc = lessdesc;
	}
	public Date getLessstart() {
		return lessstart;
	}
	public void setLessstart(Date lessstart) {
		this.lessstart = lessstart;
	}
	public Date getLessend() {
		return lessend;
	}
	public void setLessend(Date lessend) {
		this.lessend = lessend;
	}
	public Integer getLesssta() {
		return lesssta;
	}
	public void setLesssta(Integer lesssta) {
		this.lesssta = lesssta;
	}
	public Integer getLesstimes() {
		return lesstimes;
	}
	public void setLesstimes(Integer lesstimes) {
		this.lesstimes = lesstimes;
	}

}
