package com.activity_fav.model;

import java.util.List;

import com.activity_order.model.Activity_orderVO;

public interface Activity_favDAO_interface {
	public void insert(Activity_favVO act_favVO);
	public void update(Activity_favVO act_favVO);
	public void delete(String actno, String stuno);
	public List<Activity_favVO> findStudentByPrimaryKey(String actno);
	public List<Activity_favVO> findActivityByPrimaryKey(String stuno);
	public List<Activity_favVO> getAll();
}
