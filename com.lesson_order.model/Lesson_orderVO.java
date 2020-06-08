package com.lesson_order.model;

import java.io.Serializable;

public class Lesson_orderVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String lord_no;
	private String stuno;
	private String lessno;
	private String lord_sc;
	
	public String getLord_no() {
		return lord_no;
	}
	public void setLord_no(String lord_no) {
		this.lord_no = lord_no;
	}
	
	public String getStuno() {
		return stuno;
	}
	public void  setStuno(String stuno) {
		this.stuno = stuno;
	}
	
	public String getLessno() {
		return lessno;
	}
	public void setLessno(String lessno) {
		this.lessno = lessno;
	}
	
	public String getLord_sc() {
		return lord_sc;
	}
	public void setLord_sc(String lord_sc) {
		this.lord_sc = lord_sc;
	}
	
}
