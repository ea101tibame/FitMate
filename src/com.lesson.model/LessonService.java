package com.lesson.model;

import java.sql.Date;
import java.util.List;

import org.json.JSONArray;

import test.expertise.model.ExpertiseVO;

public class LessonService {

	private LessonDAO_interface dao;
	
	public LessonService() {
		dao = new LessonJDBCDAO();
	}

	public LessonVO addLesson(String lessno,String coano,String lessname,Integer lessmax,Integer lessmin,Integer lesscur,String lesstype,String lessloc,Integer lessprice,String lessdesc,java.sql.Date lessstart,java.sql.Date lessend,String lesssta,Integer lesstimes,byte[] lesspic) {
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
		
		dao.insert(LessonVO);
		return LessonVO;
		
	}
	public LessonVO updateLesson(String lessno,String coano,String lessname,Integer lessmax,Integer lessmin,Integer lesscur,String lesstype,String lessloc,Integer lessprice,String lessdesc,java.sql.Date lessstart,java.sql.Date lessend,String lesssta,Integer lesstimes,byte[] lesspic) {
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

	public List<LessonVO> findLessonByLessonType(String lesstype) {
		return dao.findLessonByLessonType(lesstype);
	}

	public ExpertiseVO getExpByExpno(String expno) {
		return dao.getExpByExpno(expno);
	}

	public List<LessonVO> getAllLesson() {
		return dao.getAll();
	}

	public JSONArray getCoachAllLesson(String coano) {
		return dao.getCoachAllLesson(coano);
	}
	
}
