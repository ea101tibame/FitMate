package com.lesson_fav.model;

import java.util.List;
import java.util.Set;

//import com.lesson.model;

public interface Lesson_favDAO_interface {

		public void insert(Lesson_favVO lesson_favVO);
		public void update(Lesson_favVO lesson_favVO);
		public void delete(String lessno);		
		public Lesson_favVO findByPrimaryKey(String lesson);
		public List<Lesson_favVO> getAll();
		
		//public Set<LessonVO> getLessonByLesson_order(String Lessno);
		//public Set<StudentVO> getStudentByLessno(String Stunno);
}
