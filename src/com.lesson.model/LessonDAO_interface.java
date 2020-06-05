package com.lesson.model;

import java.util.*;

public interface LessonDAO_interface {
	public void insert(LessonVO lessonVO);
	public void update(LessonVO lessonVO);
	public void delete(Integer L_NO);
	public LessonVO findByPrimaryKey(Integer L_NO);
	public List<LessonVO>getAll();
}
