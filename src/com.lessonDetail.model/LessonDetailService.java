package com.lessonDetail.model;

import com.lesson.model.LessonDAO_interface;

public class LessonDetailService {
	private LessonDetailJDBCDAO dao;
	
	public LessonDetailService() {
		dao = new LessonDetailJDBCDAO();
	}
}
