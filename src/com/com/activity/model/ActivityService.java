package com.activity.model;

import java.sql.Date;
import java.util.List;

import org.json.JSONArray;

import com.activity.model.ActivityVO;
import com.expertise.model.ExpertiseVO;

public class ActivityService {

	private ActivityDAO_interface dao;

	public ActivityService() {
		dao = new ActivityDAO();
	}

/* 基本 */
	// 新增
	public ActivityVO addActivity(String actname, String actloc, java.sql.Date actdate, String actss,
			java.sql.Date actstart, java.sql.Date actend, String acttype, Integer actprice, Integer actmin,
			Integer actmax,Integer actcur, String actdesc, String actsta, byte[] actpic, String stuno, String coano) {
		ActivityVO activityVO = new ActivityVO();
		activityVO.setActname(actname);
		activityVO.setActloc(actloc);
		activityVO.setActdate(actdate);
		activityVO.setActss(actss);
		activityVO.setActstart(actstart);
		activityVO.setActend(actend);
		activityVO.setActtype(acttype);
		activityVO.setActprice(actprice);
		activityVO.setActmin(actmin);
		activityVO.setActmax(actmax);
		activityVO.setActcur(actcur);
		activityVO.setActdesc(actdesc);
		activityVO.setActsta(actsta);
		activityVO.setActpic(actpic);
		activityVO.setStuno(stuno);
		activityVO.setCoano(coano);
		dao.insert(activityVO);
		return activityVO;
	}

	// 修改
	public ActivityVO updateActivity(String actno, String actname, String actloc, java.sql.Date actdate, String actss,
			java.sql.Date actstart, java.sql.Date actend, String acttype, Integer actprice, Integer actmin,
			Integer actmax, Integer actcur, String actdesc, String actsta, byte[] actpic, String stuno, String coano) {
		ActivityVO activityVO = new ActivityVO();
		activityVO.setActno(actno);
		activityVO.setActname(actname);
		activityVO.setActloc(actloc);
		activityVO.setActdate(actdate);
		activityVO.setActss(actss);
		activityVO.setActstart(actstart);
		activityVO.setActend(actend);
		activityVO.setActtype(acttype);
		activityVO.setActprice(actprice);
		activityVO.setActmin(actmin);
		activityVO.setActmax(actmax);
		activityVO.setActcur(actcur);
		activityVO.setActdesc(actdesc);
		activityVO.setActsta(actsta);
		activityVO.setActpic(actpic);
		activityVO.setStuno(stuno);
		activityVO.setCoano(coano);
		dao.insert(activityVO);
		return activityVO;
	}

	// 刪除
	public void deleteActivity(String actno) {
		dao.delete(actno);
	}

	// 單一查詢
	public ActivityVO getOneActivity(String actno) {
		return dao.findByPrimaryKey(actno);
	}

	// 全部查詢
	public List<ActivityVO> getAllActivity() {
		return dao.getAll();
	}

	/* 變化 */
	// 全部查詢 查詢教練全部活動放入課表(轉JSON格式)
	public JSONArray getAllToCoachTable(String coano) {
		return dao.getAllToCoachTable(coano);
	}
	
	// 單一查詢 查詢教練專長
	public ExpertiseVO findByExpertise(String expno) {
		return dao.findByExpertise(expno);
	}
}
