package com.lessonTime.model;
import java.util.*;

public interface LessonTimeDAO_inrterface {
	public void insert(LessonTimeVO lessonTimeVO);
	public void update(LessonTimeVO lessonTimeVO);
	public void delete(Integer L_T_NO);
	public LessonTimeVO findByPrimaryKey(Integer L_T_NO);
	public List<LessonTimeVO>getAll();
}
