package com.lesson_order.model;

import java.util.List;


public class Lesson_orderService {
	
	private Lesson_orderDAO_interface dao;
	
	public Lesson_orderService() {
		dao = new Lesson_orderJDBCDAO();
	}
	
	public Lesson_orderVO addLesson_order(String lord_no, String stuno, String lessno, Integer lord_sc) {
		Lesson_orderVO lesson_orderVO = new Lesson_orderVO();
	
		lesson_orderVO.setLord_no(lord_no);
		lesson_orderVO.setStuno(stuno);	
		lesson_orderVO.setLessno(lessno);	
		lesson_orderVO.setLord_sc(lord_sc);	

		dao.insert(lesson_orderVO);
		
		return lesson_orderVO;
	
	}
	
	public void deleteLesson_order(String lord_no) {
		dao.delete(lord_no);

	}
		
	public List<Lesson_orderVO> getfindByLessno( String lessno) {
		return dao.getfindByLessno(lessno);
	}
	
	public List<Lesson_orderVO> getfindByStuno( String stuno) {
		return dao.getfindByLessno(stuno);
	}

	public List<Lesson_orderVO> getAll() {
		return dao.getAll();
	}
	

}
