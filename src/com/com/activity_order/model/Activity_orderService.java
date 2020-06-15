package com.activity_order.model;

import java.sql.Timestamp;
import java.util.List;


public class Activity_orderService {
	private Acitivity_orderDAO_interface dao;
	
	public Activity_orderService() {
		dao = new Activity_orderDAO();
	}
	
	//新增
	public Activity_orderVO addActivityOrder(String aord_no,String actno,String stuno,Double aord_sc,java.sql.Timestamp aord_time) {
		Activity_orderVO act_orVO = new Activity_orderVO();
		act_orVO.setActno(actno);
		act_orVO.setStuno(stuno);
		act_orVO.setAord_sc(aord_sc);
		dao.insert(act_orVO);
		return act_orVO;
	}
	
	//修改
	public Activity_orderVO updateActivityOrder(String aord_no,String actno,String stuno,Double aord_sc,java.sql.Timestamp aord_time) {
		Activity_orderVO act_orVO = new Activity_orderVO();
		act_orVO.setAord_no(aord_no);
		act_orVO.setActno(actno);
		act_orVO.setStuno(stuno);
		act_orVO.setAord_sc(aord_sc);
		dao.update(act_orVO);
		return act_orVO;
	}
	
	//刪除
	public void deleteActivityOrder(String acor_no) {
		dao.delete(acor_no);
	}
	
	//單一查詢
	public Activity_orderVO getOneActivityOrder(String aord_no) {
		return dao.findByPrimaryKey(aord_no);
	}
	
	//全部查詢
	public List<Activity_orderVO> getAllActivityOreder() {
		return dao.getAll();
	}
}
