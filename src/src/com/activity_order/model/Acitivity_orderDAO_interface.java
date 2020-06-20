package com.activity_order.model;

import java.util.List;


public interface Acitivity_orderDAO_interface {
    public void insert(Activity_orderVO act_orderVO);
    public void update(Activity_orderVO actVO);
    public void delete(String aord_no);
    public Activity_orderVO findByPrimaryKey(String act_orderVO);
    public List<Activity_orderVO> getAll();
}

