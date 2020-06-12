package com.lessonTime.model;

import java.sql.Date;
import java.util.List;

import org.json.JSONArray;

public class LessonTimeService {
	private LessonTimeDAO_inrterface dao;

	public LessonTimeService() {
		dao = new LessonTimeJDBCDAO();
	}

	public LessonTimeVO addLessonTime(String ltime_no, java.sql.Date ltime_date, Integer ltime_ss) {

		LessonTimeVO LessonTimeVO = new LessonTimeVO();

		LessonTimeVO.setLtime_no(ltime_no);
		LessonTimeVO.setLtime_date(ltime_date);
		LessonTimeVO.setLtime_ss(ltime_ss);
		dao.insert(LessonTimeVO);

		return LessonTimeVO;

	}

	public LessonTimeVO updateLessonTime(String ltime_no, java.sql.Date ltime_date, Integer ltime_ss) {

		LessonTimeVO LessonTimeVO = new LessonTimeVO();

		LessonTimeVO.setLtime_no(ltime_no);
		LessonTimeVO.setLtime_date(ltime_date);
		LessonTimeVO.setLtime_ss(ltime_ss);
		dao.update(LessonTimeVO);

		return LessonTimeVO;

	}

	public void deleteLessonTime(String ltime_no) {
		dao.delete(ltime_no);
	}

	public LessonTimeVO findTimeByPK(String ltime_no) {
		return dao.findByPrimaryKey(ltime_no);
	}

	public List<LessonTimeVO> getAllLessonTime() {
		return dao.getAll();
	}

	public JSONArray getCoachAllLesson(String coano) {
		return dao.getCoachAllLesson(coano);
	}

}
