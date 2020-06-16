package com.lesson.model;

import java.sql.Date;
import java.util.List;

import org.json.JSONArray;

import test.expertise.model.ExpertiseVO;

public class LessonService {

	private LessonDAO_interface dao;
	
	public LessonService() {
		dao = new LessonJDBCDAO();//之後轉JNDI
	}

	public LessonVO addLesson(String coano,String lessname,Integer lessmax,Integer lessmin,Integer lesscur,String lesstype,String lessloc,Integer lessprice,String lessdesc,java.sql.Date lessstart,java.sql.Date lessend,String lesssta,Integer lesstimes,byte[] lesspic) {
		LessonVO lessonVO= new LessonVO();
		
		
		lessonVO.setCoano(coano);
		lessonVO.setLessname(lessname);
		lessonVO.setLessmax(lessmax);
		lessonVO.setLessmin(lessmin);
		
		lessonVO.setLesscur(lesscur);
		lessonVO.setLesstype(lesstype);
		lessonVO.setLessloc(lessloc);
		lessonVO.setLessprice(lessprice);
		lessonVO.setLessdesc(lessdesc);
		
		lessonVO.setLessstart(lessstart);
		lessonVO.setLessend(lessend);
		lessonVO.setLesssta(lesssta);
		lessonVO.setLesstimes(lesstimes);
		lessonVO.setLesspic(lesspic);
		
		dao.insert(lessonVO);
		return lessonVO;
		
	}
	public LessonVO updateLesson(String lessno, String coano,String lessname,Integer lessmax,Integer lessmin,Integer lesscur,String lesstype,String lessloc,Integer lessprice,String lessdesc,java.sql.Date lessstart,java.sql.Date lessend,String lesssta,Integer lesstimes,byte[] lesspic) {
		LessonVO lessonVO= new LessonVO();
		lessonVO.setLessno(lessno);
		lessonVO.setCoano(coano);
		lessonVO.setLessname(lessname);
		lessonVO.setLessmax(lessmax);
		lessonVO.setLessmin(lessmin);
		
		lessonVO.setLesscur(lesscur);
		lessonVO.setLesstype(lesstype);
		lessonVO.setLessloc(lessloc);
		lessonVO.setLessprice(lessprice);
		lessonVO.setLessdesc(lessdesc);
		
		lessonVO.setLessstart(lessstart);
		lessonVO.setLessend(lessend);
		lessonVO.setLesssta(lesssta);
		lessonVO.setLesstimes(lesstimes);
		lessonVO.setLesspic(lesspic);
		dao.update(lessonVO);
		return lessonVO;
		
	}

	public List<LessonVO> findLessonByLessonType(String lesstype) {
		return dao.findLessonByLessonType(lesstype);
	}

	public List<ExpertiseVO> getAllExpByExpno() {
		return dao.getAllExpByExpno();
	}

	public List<LessonVO> getAllLesson() {
		return dao.getAll();
	}

	public JSONArray getCoachAllLesson(String coano) {
		return dao.getCoachAllLesson(coano);
	}
	public List<LessonVO> getCoachLesson(String coano) {
		return dao.getCoachLesson(coano);
	}
	public LessonVO getOneByPK(String lessno) {
		return dao.getOneByPK(lessno);
	}
	
}
