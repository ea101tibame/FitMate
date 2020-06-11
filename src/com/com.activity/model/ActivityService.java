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
			Integer actmax, Integer actcur, String actdesc, String actsta, byte[] actpic, String stuno, String coano) {
		ActivityVO actVO = new ActivityVO();
		actVO.setActname(actname);
		actVO.setActloc(actloc);
		actVO.setActdate(actdate);
		actVO.setActss(actss);
		actVO.setActstart(actstart);
		actVO.setActend(actend);
		actVO.setActtype(acttype);
		actVO.setActprice(actprice);
		actVO.setActmin(actmin);
		actVO.setActmax(actmax);
		actVO.setActcur(actcur);
		actVO.setActdesc(actdesc);
		actVO.setActsta(actsta);
		actVO.setActpic(actpic);
		actVO.setActpic(actpic);
		actVO.setStuno(stuno);
		actVO.setCoano(coano);
		dao.insert(actVO);
		return actVO;
	}

	// 修改
	public ActivityVO updateActivity(String actno, String actname, String actloc, java.sql.Date actdate, String actss,
			java.sql.Date actstart, java.sql.Date actend, String acttype, Integer actprice, Integer actmin,
			Integer actmax, Integer actcur, String actdesc, String actsta, byte[] actpic, String stuno, String coano) {
		ActivityVO actVO = new ActivityVO();
		actVO.setActno(actno);
		actVO.setActname(actname);
		actVO.setActloc(actloc);
		actVO.setActdate(actdate);
		actVO.setActss(actss);
		actVO.setActstart(actstart);
		actVO.setActend(actend);
		actVO.setActtype(acttype);
		actVO.setActprice(actprice);
		actVO.setActmin(actmin);
		actVO.setActmax(actmax);
		actVO.setActcur(actcur);
		actVO.setActdesc(actdesc);
		actVO.setActsta(actsta);
		actVO.setActpic(actpic);
		actVO.setActpic(actpic);
		actVO.setStuno(stuno);
		actVO.setCoano(coano);
		dao.insert(actVO);
		return actVO;
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
	public List<ActivityVO> getAllAciivity() {
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
