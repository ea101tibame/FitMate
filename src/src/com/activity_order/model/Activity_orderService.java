package com.activity_order.model;

import java.util.List;


public class Activity_orderService {
	private Acitivity_orderDAO_interface dao;
	
	public Activity_orderService() {
		dao = new Activity_orderJNDIDAO();
	}
	
	//新增
	public Activity_orderVO addActivityOrder(String actno,String stuno) {
		Activity_orderVO activity_orderVO = new Activity_orderVO();
		activity_orderVO.setActno(actno);
		activity_orderVO.setStuno(stuno);
		dao.insert(activity_orderVO);
		return activity_orderVO;
	}
	
	//修改
	public Activity_orderVO updateActivityOrder(String aord_no,String actno,String stuno,Double aord_sc) {
		Activity_orderVO activity_orderVO = new Activity_orderVO();
		activity_orderVO.setAord_no(aord_no);
		activity_orderVO.setActno(actno);
		activity_orderVO.setStuno(stuno);
		activity_orderVO.setAord_sc(aord_sc);
		dao.update(activity_orderVO);
		return activity_orderVO;
	}
	
	//刪除
	public void deleteActivityOrder(String aord_no) {
		dao.delete(aord_no);
	}
	
	//單一查詢
	public Activity_orderVO getOneActivityOrder(String aord_no) {
		return dao.findByPrimaryKey(aord_no);
	}
	
	//全部查詢
	public List<Activity_orderVO> getAllActivityOrder() {
		return dao.getAll();
	}
	//單一查詢由活動編號查有多少學員報名
	public List<Activity_orderVO> findStudentByactno(String actno){
		return dao.findStudentByactno(actno);
	}
	//單一查詢由學員編號查報名多少活動
	public List<Activity_orderVO> findActivityBystuno(String stuno){
		return dao.findActivityBystuno(stuno);
	}
}
