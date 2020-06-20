package com.lesson.model;

import java.sql.Date;
import java.util.List;

import org.json.JSONArray;

//import test.expertise.model.ExpertiseVO;

public class LessonService {

	private LessonDAO_interface dao;
	
	public LessonService() {
		dao = new LessonJDBCDAO();//之後轉JNDI
	}

	public LessonVO addLesson(String coano,String lessname,Integer lessmax,Integer lessmin,Integer lesscur,String lesstype,String lessloc,Integer lessprice,String lessdesc,java.sql.Date lessstart,java.sql.Date lessend,String lesssta,Integer lesstimes,byte[] lesspic) {
		LessonVO LessonVO= new LessonVO();
		
		
		LessonVO.setCoano(coano);
		LessonVO.setLessname(lessname);
		LessonVO.setLessmax(lessmax);
		LessonVO.setLessmin(lessmin);
		
		LessonVO.setLesscur(lesscur);
		LessonVO.setLesstype(lesstype);
		LessonVO.setLessloc(lessloc);
		LessonVO.setLessprice(lessprice);
		LessonVO.setLessdesc(lessdesc);
		
		LessonVO.setLessstart(lessstart);
		LessonVO.setLessend(lessend);
		LessonVO.setLesssta(lesssta);
		LessonVO.setLesstimes(lesstimes);
		LessonVO.setLesspic(lesspic);
		
		dao.insert(LessonVO);
		return LessonVO;
		
	}
	public LessonVO updateLesson(String lessno, String coano,String lessname,Integer lessmax,Integer lessmin,Integer lesscur,String lesstype,String lessloc,Integer lessprice,String lessdesc,java.sql.Date lessstart,java.sql.Date lessend,String lesssta,Integer lesstimes,byte[] lesspic) {
		LessonVO LessonVO= new LessonVO();
		LessonVO.setLessno(lessno);
		LessonVO.setCoano(coano);
		LessonVO.setLessname(lessname);
		LessonVO.setLessmax(lessmax);
		LessonVO.setLessmin(lessmin);
		
		LessonVO.setLesscur(lesscur);
		LessonVO.setLesstype(lesstype);
		LessonVO.setLessloc(lessloc);
		LessonVO.setLessprice(lessprice);
		LessonVO.setLessdesc(lessdesc);
		
		LessonVO.setLessstart(lessstart);
		LessonVO.setLessend(lessend);
		LessonVO.setLesssta(lesssta);
		LessonVO.setLesstimes(lesstimes);
		LessonVO.setLesspic(lesspic);
		dao.update(LessonVO);
		return LessonVO;
		
	}

//	public List<LessonVO> findLessonByLessonType(String lesstype) {
//		return dao.findLessonByLessonType(lesstype);
//	}

//	public List<ExpertiseVO> getAllExpByExpno() {
//		return dao.getAllExpByExpno();
//	}

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
