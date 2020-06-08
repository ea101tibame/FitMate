package com.lesson_order.model;

import java.util.*;

//import com.lesson.model;
public interface Lesson_orderDAO_interface {
	
	public void insert(Lesson_orderVO lesson_orderVO);
	public void delete(String lord_no);		
	public List<Lesson_orderVO> getfindByLessno( String lessno);//查詢一個課程有多少學生
	public List<Lesson_orderVO> getfindByStuno(String stuno);//查詢一個學生有多少課程
	public Lesson_orderVO getfindByPrimaryKey(String Lord_no);
	public List<Lesson_orderVO> getAll();
	
	//public Set<LessonVO> getLessonByLesson_order(String Lessno);
	//public Set<StudentVO> getStudentByLessno(String Stunno);
	
}
