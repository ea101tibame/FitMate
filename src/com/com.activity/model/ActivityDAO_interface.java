package com.activity.model;

import java.util.*;

import com.expertise.model.ExpertiseVO;


public interface ActivityDAO_interface {
	//基本
    public void insert(ActivityVO actVO);
    public void update(ActivityVO actVO);
    public void delete(String actno);
    public ActivityVO findByPrimaryKey(String actno);
    public List<ActivityVO> getAll();
    //變化
    public ExpertiseVO findByExpertise(String expno);
    public List<ActivityVO> getAllToCoachTable();
}


