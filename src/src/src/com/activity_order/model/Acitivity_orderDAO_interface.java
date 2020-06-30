package com.activity_order.model;

import java.util.List;


public interface Acitivity_orderDAO_interface {
    /*基本*/
	public void insert(Activity_orderVO activity_orderVO);
    public void update(Activity_orderVO activity_orderVO);
    public void delete(String aord_no);
    public Activity_orderVO findByPrimaryKey(String aord_no);
    public List<Activity_orderVO> getAll();
    /*變化*/
    /*單一查詢由學員編號查報名多少活動*/
    public List<Activity_orderVO> findActivityBystuno(String stuno);
    /*單一查詢由活動編號查有多少學員報名*/
    public List<Activity_orderVO> findStudentByactno(String actno); 
}

