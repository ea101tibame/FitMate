package com.lessonDetail.model;

import java.util.List;


public interface LessonDetailDAO_interface {
	 
	//同時新增 
     public void insert2 (LessonDetailVO LessonDetailVO , java.sql.Connection con);
	
     public LessonDetailVO findAllTimesBylessno(String lessno);
     
     public List<LessonDetailVO> getAll();
     
}
